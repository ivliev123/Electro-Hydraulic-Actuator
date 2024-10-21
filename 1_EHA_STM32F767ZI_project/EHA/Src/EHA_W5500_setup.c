/*
 * w5500_setup.c
 *
 *  Created on: 22 апр. 2024 г.
 *      Author: Ivliev
 */


#include <EHA_W5500_setup.h>
#include "main.h"

extern SPI_HandleTypeDef hspi3;

uint8_t dhcp_buffer[1024];
uint8_t dns_buffer[200];
uint8_t ntp_buf[48];
volatile bool ip_assigned = false;

uint16_t usRegInputBuf[REG_INPUT_NREGS] = {0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0};
uint16_t usRegHoldingBuf[REG_HOLDING_NREGS] = {0};
uint8_t ucRegCoilsBuf[REG_COILS_SIZE/8] = {0xaa,0xfe};
uint8_t ucRegDiscreteBuf[REG_DISCRETE_SIZE/8] = {0x98, 0x6e};




void W5500_Select(void) {
    HAL_GPIO_WritePin(W5500_CS_GPIO_Port, W5500_CS_Pin, GPIO_PIN_RESET);
}

void W5500_Unselect(void) {
    HAL_GPIO_WritePin(W5500_CS_GPIO_Port, W5500_CS_Pin, GPIO_PIN_SET);
}

void W5500_Restart(void) {
    HAL_GPIO_WritePin(W5500_RST_GPIO_Port, W5500_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(1);  // delay 1ms
    HAL_GPIO_WritePin(W5500_RST_GPIO_Port, W5500_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(1000);  // delay 1600ms
}

void W5500_ReadBuff(uint8_t* buff, uint16_t len) {
    HAL_SPI_Receive(&hspi3, buff, len, HAL_MAX_DELAY);
}

void W5500_WriteBuff(uint8_t* buff, uint16_t len) {
    HAL_SPI_Transmit(&hspi3, buff, len, HAL_MAX_DELAY);
}

uint8_t W5500_ReadByte(void) {
    uint8_t byte;
    W5500_ReadBuff(&byte, sizeof(byte));
    return byte;
}

void W5500_WriteByte(uint8_t byte) {
    W5500_WriteBuff(&byte, sizeof(byte));
}


wiz_NetInfo gSetNetInfo = {
  .mac  = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED},
  .ip   = {192, 168, 0, 242},
  .sn   = {255, 255, 255, 0},
  .gw   = {192, 168, 0, 1},
  .dns  = {192, 168, 0, 1},
  .dhcp = NETINFO_STATIC};

wiz_NetInfo gGetNetInfo;

enum Status
{
  Failed = 0,
  Success = 1
};


/**
 * @brief valid the result of set net info
 * @return 1: Success
 *         0: Failed
*/
uint8_t validSetNetInfoResult(wiz_NetInfo* _set, wiz_NetInfo* _get)
{
  return (!memcmp(_set, _get, sizeof(wiz_NetInfo)));  // if same, memcmp return 0
}


uint8_t stat;
uint8_t reqnr;
char Message[128];


void w5500_init(void)
{

	W5500_Restart();  // hardware restart through RESET pin

	reg_wizchip_cs_cbfunc(W5500_Select, W5500_Unselect);
	reg_wizchip_spi_cbfunc(W5500_ReadByte, W5500_WriteByte);
	reg_wizchip_spiburst_cbfunc(W5500_ReadBuff, W5500_WriteBuff);

	uint8_t rx_tx_buff_sizes[] = {2, 2, 2, 2, 2, 2, 2, 2};
	wizchip_init(rx_tx_buff_sizes, rx_tx_buff_sizes);

	wizchip_setnetinfo(&gSetNetInfo);
	ctlnetwork(CN_SET_NETINFO, (void*) &gSetNetInfo);

	HAL_Delay(100);
}




eMBErrorCode
eMBRegHoldingCB(UCHAR *pucRegBuffer, USHORT usAddress, USHORT usNRegs,
                eMBRegisterMode eMode)
{
  eMBErrorCode eStatus = MB_ENOERR;
  int iRegIndex;

  if ((usAddress >= REG_HOLDING_START) &&
      (usAddress + usNRegs <= REG_HOLDING_START + REG_HOLDING_NREGS))
  {
    iRegIndex = (int)(usAddress - REG_HOLDING_START);
    switch (eMode)
    {
    /* Pass current register values to the protocol stack. */
    case MB_REG_READ:
      while (usNRegs > 0)
      {
        *pucRegBuffer++ =
            (unsigned char)(usRegHoldingBuf[iRegIndex] >> 8);
        *pucRegBuffer++ =
            (unsigned char)(usRegHoldingBuf[iRegIndex] & 0xFF);
        iRegIndex++;
        usNRegs--;
      }
      break;
    /* Update current register values with new values from the protocol stack. */
    case MB_REG_WRITE:
      while (usNRegs > 0)
      {
        usRegHoldingBuf[iRegIndex] = *pucRegBuffer++ << 8;
        usRegHoldingBuf[iRegIndex] |= *pucRegBuffer++;
        iRegIndex++;
        usNRegs--;
      }
    }
  }
  else
  {
    eStatus = MB_ENOREG;
  }
  return eStatus;
}

eMBErrorCode
eMBRegInputCB(UCHAR *pucRegBuffer, USHORT usAddress, USHORT usNRegs)
{
  eMBErrorCode eStatus = MB_ENOERR;
  int iRegIndex;

  if ((usAddress >= REG_INPUT_START) && (usAddress + usNRegs <= REG_INPUT_START + REG_INPUT_NREGS))
  {
    iRegIndex = (int)(usAddress - REG_INPUT_START);
    while (usNRegs > 0)
    {
      *pucRegBuffer++ =
          (unsigned char)(usRegInputBuf[iRegIndex] >> 8);
      *pucRegBuffer++ =
          (unsigned char)(usRegInputBuf[iRegIndex] & 0xFF);
      iRegIndex++;
      usNRegs--;
    }
  }
  else
  {
    eStatus = MB_ENOREG;
  }

  return eStatus;
}

eMBErrorCode
eMBRegCoilsCB(UCHAR *pucRegBuffer, USHORT usAddress, USHORT usNCoils,
              eMBRegisterMode eMode)
{
  eMBErrorCode eStatus = MB_ENOERR;
  int iNCoils = (int)usNCoils;
  unsigned short usBitOffset;

  /* Check if we have registers mapped at this block. */
  if ((usAddress >= REG_COILS_START) &&
      (usAddress + usNCoils <= REG_COILS_START + REG_COILS_SIZE))
  {
    usBitOffset = (unsigned short)(usAddress - REG_COILS_START);
    switch (eMode)
    {
    /* Read current values and pass to protocol stack. */
    case MB_REG_READ:
      while (iNCoils > 0)
      {
        *pucRegBuffer++ =
            xMBUtilGetBits(ucRegCoilsBuf, usBitOffset,
                           (unsigned char)(iNCoils >
                                                   8
                                               ? 8
                                               : iNCoils));
        iNCoils -= 8;
        usBitOffset += 8;
      }
      break;
      /* Update current register values. */
    case MB_REG_WRITE:
      while (iNCoils > 0)
      {
        xMBUtilSetBits(ucRegCoilsBuf, usBitOffset,
                       (unsigned char)(iNCoils > 8 ? 8 : iNCoils),
                       *pucRegBuffer++);
        iNCoils -= 8;
        usBitOffset += 8;
      }
      break;
    }
  }
  else
  {
    eStatus = MB_ENOREG;
  }
  return eStatus;
}

eMBErrorCode
eMBRegDiscreteCB(UCHAR *pucRegBuffer, USHORT usAddress, USHORT usNDiscrete)
{
  eMBErrorCode eStatus = MB_ENOERR;
  short iNDiscrete = (short)usNDiscrete;
  unsigned short usBitOffset;

  /* Check if we have registers mapped at this block. */
  if ((usAddress >= REG_DISCRETE_START) &&
      (usAddress + usNDiscrete <= REG_DISCRETE_START + REG_DISCRETE_SIZE))
  {
    usBitOffset = (unsigned short)(usAddress - REG_DISCRETE_START);
    while (iNDiscrete > 0)
    {
      *pucRegBuffer++ =
          xMBUtilGetBits( ucRegDiscreteBuf, usBitOffset,
                                    ( unsigned char )( iNDiscrete >
                                                       8 ? 8 : iNDiscrete ) );
      iNDiscrete -= 8;
      usBitOffset += 8;
    }
  }
  else
  {
    eStatus = MB_ENOREG;
  }
  return eStatus;
}

int __io_putchar(int ch) {
  ITM_SendChar(ch);
  return ch;
}
