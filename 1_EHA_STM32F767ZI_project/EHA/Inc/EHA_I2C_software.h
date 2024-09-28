/*
 * I2C.h
 *
 *  Created on: 20 ���. 2023 �.
 *      Author: 123iv
 */

#ifndef INC_EHA_I2C_SOFTWARE_H_
#define INC_EHA_I2C_SOFTWARE_H_


// ���������� ���������� ������ �����������

#include "stm32f7xx_hal.h"

// � CUBE MX ����� I2C ��������� �� ����� (���� � main.c ������ ������ ������������ �� ����� GPIO)

//---����������� ���� � �����-----------------------------------------------------
//#define SCL_I HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_5);
//#define SDA_I HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_4);
//#define SCL_O HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);
//#define SDA_O HAL_GPIO_WritePin(GPIOA, GPIO_PIN_4, GPIO_PIN_RESET);
#define SCL_I HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_10);
#define SDA_I HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_11);
#define SCL_O HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);
#define SDA_O HAL_GPIO_WritePin(GPIOB, GPIO_PIN_11, GPIO_PIN_RESET);
//--------------------------------------------------------------------------------

void SCL_in (void);
void SCL_out (void);
void SDA_in (void);
void SDA_out (void);

// void Delay_us (uint32_t  us);

void i2c_init (void);               // ������������� ����
void i2c_start_cond (void);        // ��������� ������� �����
void i2c_restart_cond (void);      // ��������� ������� �������
void i2c_stop_cond (void) ;       // ��������� ������� ����
uint8_t i2c_send_byte (uint8_t data) ;      //�������� ���� (��. �������� ������������ ����) (���������� 0 - ���, 1 - NACK)
uint8_t i2c_get_byte (uint8_t last_byte) ;  //������� ���� (���� ��������� ���� �� ������� �������� = 1, ���� ����� ��������� ��� �� 0)(���������� �������� ����)
//--------------------------------------------------------------------------------
// ������ �������������
//=========================================================================================
//   ������ uint16_t �� ������� ������ (FRAM FM24CL64) ��� ����� ������ 24LC ������,
//	 ��� ������,  ����������� ����� ������ ������, ��������� ���� adr++
//=========================================================================================
//
//void FRAM_W_INT(uint16_t adr, uint16_t dat){
//i2c_start_cond ();
//i2c_send_byte (0xA2); //����� ���� + ��� ����� ������ (����������)
//i2c_send_byte    ((adr & 0xFF00) >> 8);
//i2c_send_byte    (adr & 0x00FF);
//i2c_send_byte    ((dat & 0xFF00) >> 8);
//i2c_send_byte    (dat & 0x00FF);
//i2c_stop_cond();
//}

//=========================================================================================
//   ���������� uint16_t �� ������� ������ (FRAM FM24CL64) ��� ����� ������ 24LC ������,
//	 ��� ������,  ����������� ����� ������ ������, ��������� ���� adr++
//=========================================================================================
//uint16_t FRAM_R_INT(uint16_t adr){
//uint16_t dat;
//i2c_start_cond ();
//i2c_send_byte (0xA2);
//i2c_send_byte    ((adr & 0xFF00) >> 8);
//i2c_send_byte    (adr & 0x00FF);
//i2c_restart_cond ();
//i2c_send_byte (0xA3);
//dat =  i2c_get_byte(0);
//dat <<= 8;
//dat |= i2c_get_byte(1);
//i2c_stop_cond();
//return dat;
//}



#endif /* INC_EHA_I2C_SOFTWARE_H_ */
