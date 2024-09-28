/*
 * EHA_I2C_software.c
 *
 *  Created on: 20 . 2023 .
 *      Author: 123iv
 */

#include <EHA_I2C_software.h>

volatile uint8_t i2c_frame_error=0;

//-----------------------------------------------------------
//void Delay_us (uint32_t us) //    us
//{
//us *=(SystemCoreClock/1000000)/5;
//	while(us--);
//}

//----------------------------------------------------
void SCL_in (void) //  SCL  1,    (   )
{
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_10;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
}
//----------------------------------------------------
void SCL_out (void) //  SCL  0 (   )
{
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_10;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	SCL_O;
}
//----------------------------------------------------
void SDA_in (void) //  SDA  1,    (   )
{
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_11;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
}
//----------------------------------------------------
void SDA_out (void) //  SDA  0 (   )
{
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_11;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	SDA_O;
}

//#define  DrvI2C_DELAY_Hold() Delay_us(1);
#define  DrvI2C_DELAY_Hold() Delay_us(0);
#define  DrvI2C_DELAY_Free() Delay_us(1);



void DrvI2C_SCL_Free(void) { SCL_in(); DrvI2C_DELAY_Free(); }
void DrvI2C_SDA_Free(void) { SDA_in(); DrvI2C_DELAY_Free(); }

void DrvI2C_SCL_Hold(void) { SCL_out(); DrvI2C_DELAY_Hold(); }
void DrvI2C_SDA_Hold(void) { SDA_out(); DrvI2C_DELAY_Hold(); }

//----------------------------------------------------
void i2c_stop_cond (void)  //
{
    uint16_t SCL, SDA;

    DrvI2C_SCL_Hold(); //  SCL (.0)
    DrvI2C_SDA_Hold(); //  SDA (.0)

    DrvI2C_SCL_Free(); //  SCL (.1)
    DrvI2C_SDA_Free(); //  SDA (.1)


//    i2c_frame_error=0;		-
//    SCL=SCL_I;
//	SDA=SDA_I;
//	if (SCL == 0) i2c_frame_error++;   // ,    SDA  .1,
//    if (SDA == 0) i2c_frame_error++;   // ,    SCL  .1,
//    Delay_us(40);
   }

void i2c_init (void) //
{
    i2c_stop_cond();   //
    i2c_stop_cond();   //
}
//----------------------------------------------------
void i2c_start_cond (void)  //
{
	DrvI2C_SDA_Hold(); //  SDA (.0)
    DrvI2C_SCL_Hold(); //  SCL (.0)
}
//----------------------------------------------------
void i2c_restart_cond (void)   //
{
	DrvI2C_SDA_Free(); //  SDA (.1)
    DrvI2C_SCL_Free(); //  SCL (.1)

	DrvI2C_SDA_Hold(); //  SDA (.0)
    DrvI2C_SCL_Hold(); //  SCL (.0)
}
//----------------------------------------------------
uint8_t i2c_send_byte (uint8_t data)  //
{
uint8_t i;
uint8_t ack=1;           //,  =1
uint16_t SDA;

	for (i=0;i<8;i++)
    {
        if (data & 0x80){ DrvI2C_SDA_Free();} else {DrvI2C_SDA_Hold();}
        data<<=1;
        DrvI2C_SCL_Free(); //  SCL (.1)
        DrvI2C_SCL_Hold(); //  SCL (.0)
    }
	DrvI2C_SDA_Free(); //  SDA (.1)
    DrvI2C_SCL_Free(); //  SCL (.1)
    SDA=SDA_I;

	if (SDA==0x00) ack=1; else ack=0;    //  ACK
	DrvI2C_SCL_Hold(); //  SCL (.0)
    return ack;

}
//----------------------------------------------------
uint8_t i2c_get_byte (uint8_t last_byte) //
{
	uint8_t i, res=0;
	uint16_t SDA;

    for (i=0;i<8;i++)
    {
        res<<=1;
        DrvI2C_SCL_Free(); //  SCL (.1)
		SDA=SDA_I;
		if (SDA==1) res=res|0x01; //  SDA     SDA=1   1
		DrvI2C_SCL_Hold(); //  SCL (.0)
    }

    if (last_byte==0){ DrvI2C_SDA_Hold(); /* SDA (.0) */ }
    else {DrvI2C_SDA_Free(); /* SDA (.1) */ ;}

    DrvI2C_SCL_Free(); //  SCL (.1)
    DrvI2C_SCL_Hold(); //  SCL (.0)
    DrvI2C_SDA_Free(); //  SDA (.1)

    return res; //
}
