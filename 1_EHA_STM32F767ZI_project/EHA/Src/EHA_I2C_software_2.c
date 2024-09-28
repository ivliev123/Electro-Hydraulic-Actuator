///*
// * I2C.c
// *
// *  Created on: 20 ���. 2023 �.
// *      Author: 123iv
// */
//
//#include "I2C.h"
//
//volatile uint8_t i2c_frame_error=0;
//
//#define I2C_Speed    '6'
////#define I2C_Mode     'S'
//
////------------------------
//// DrvI2C Speed Settings
////------------------------
//// DrvI2C_Speed         '0' -   1 kBit/s ( 1.0 mS per Bit)
//// DrvI2C_Speed         '1' - 100 kBit/s (10.0 uS per Bit)
//// DrvI2C_Speed         '2' - 200 kBit/s ( 5.0 uS per Bit)
//// DrvI2C_Speed         '4' - 400 kBit/s ( 2.5 uS per Bit)
////#define I2C_Speed         'M' //- Max Speed
//
//#if      (I2C_Speed == '0')
// #define  I2C_DELAY_Hold() Delay_us(500);
// #define  I2C_DELAY_Free() Delay_us(500);
//#elif    (I2C_Speed == '1')
// #define  I2C_DELAY_Hold() Delay_us(4);
// #define  I2C_DELAY_Free() Delay_us(6);
//#elif    (I2C_Speed == '2')
// #define  I2C_DELAY_Hold() Delay_us(2);
// #define  I2C_DELAY_Free() Delay_us(3);
//#elif    (I2C_Speed == '4')
// #define  I2C_DELAY_Hold() Delay_us(1);
// #define  I2C_DELAY_Free() Delay_us(2);
//#elif    (I2C_Speed == '6')
// #define  I2C_DELAY_Hold() //Lib_Delay_us(1);
// #define  I2C_DELAY_Free() Delay_us(1);
//#elif    (I2C_Speed == 'M')
// #define  DrvI2C_DELAY_Hold() // NONE
// #define  DrvI2C_DELAY_Free() // NONE
////#else  // DrvI2C_Speed
//// #error  'DrvI2C_Speed' is wrong or not defined
//#endif // DrvI2C_Speed
//
//
//
//
//
////-----------------------------------------------------------
//__STATIC_INLINE void Delay_us (uint32_t __IO us) //������� �������� � ������������� us
//{
//us *=(SystemCoreClock/1000000)/5;
//	while(us--);
//}
//
////----------------------------------------------------
//void SCL_in (void) //������� ���������� SCL � 1, ���� �� ���� (���������� ���������� ������������ ����)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_10;
//	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//}
////----------------------------------------------------
//void SCL_out (void) //������� ������������ SCL � 0 (���������� ���������� ������������ ����)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_10;
//	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//	SCL_O;
//}
////----------------------------------------------------
//void SDA_in (void) //������� ���������� SDA � 1, ���� �� ���� (���������� ���������� ������������ ����)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_11;
//	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//}
////----------------------------------------------------
//void SDA_out (void) //������� ������������ SDA � 0 (���������� ���������� ������������ ����)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_11;
//	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//	SDA_O
//}
//
//void I2C_SCL_Free(void) { SCL_in();  I2C_DELAY_Free(); }
//void I2C_SDA_Free(void) { SDA_in();  I2C_DELAY_Free(); }
//
//void I2C_SCL_Hold(void) { SCL_out(); I2C_DELAY_Hold(); }
//void I2C_SDA_Hold(void) { SDA_out(); I2C_DELAY_Hold(); }
//
////----------------------------------------------------
//void i2c_stop_cond (void)  // ������� ��������� ������� ����
//{
//    uint16_t SCL, SDA;
//    I2C_SCL_Hold(); // ��������� SCL (���.0)
//    I2C_SDA_Hold(); // ��������� SDA (���.0)
//
//    I2C_SCL_Free(); // ��������� SCL (���.1)
//    I2C_SDA_Free(); // ��������� SDA (���.1)
//
////    // �������� �����-������
////    i2c_frame_error=0;		// ����� �������� �����-������
////    SCL=SCL_I;
////		SDA=SDA_I;
////		if (SCL == 0) i2c_frame_error++;   // ���������, ����� �� ���� SDA ���� ���.1, ����� ����� ������ ������
////    if (SDA == 0) i2c_frame_error++;   // ���������, ����� �� ���� SCL ���� ���.1, ����� ����� ������ ������
////    Delay_us(40);
//}
//
//void i2c_init (void) // ������� ������������� ����
//{
//    i2c_stop_cond();   // ���� ����
//    i2c_stop_cond();   // ���� ����
//}
////----------------------------------------------------
//void i2c_start_cond (void)  // ������� ��������� ������� �����
//{
//	I2C_SDA_Free(); // ��������� SDA (���.1)
//    I2C_SCL_Free(); // ��������� SCL (���.1)
//
//    I2C_SCL_Hold(); // ��������� SCL (���.0)
//    I2C_SDA_Hold(); // ��������� SDA (���.0)
//
//
//}
////----------------------------------------------------
//void i2c_restart_cond (void)   // ������� ��������� ������� �������
//{
//    SDA_in(); // ��������� SDA (���.1)
//    Delay_us(10);
//    SCL_in(); // ��������� SCL (���.1)
//    Delay_us(10);
//    SDA_out(); // ��������� SDA (���.0)
//    Delay_us(10);
//    SCL_out(); // ��������� SCL (���.0)
//    Delay_us(10);
//}
////----------------------------------------------------
//uint8_t i2c_send_byte (uint8_t data)  // �������  �������� �����
//{
// uint8_t i;
// uint8_t ack=1;           //���, ���� ���=1 � ��������� ������
//uint16_t SDA;
//	for (i=0;i<8;i++)
//    {
//        if (data & 0x80)
//		{
//        	I2C_SDA_Free();; // ���.1
//        }
//		else
//		{
//			I2C_SDA_Hold(); // ��������� ��� �� SDA (���.0
//		}
//
//        I2C_SCL_Free();   // �������� ��� ��������� �� SCL       // ��������� SCL (���.1)
//        I2C_SCL_Hold(); // ��������� SCL (���.0)
//        data<<=1; // �������� �� 1 ��� �����
//
//    }
//	I2C_SDA_Free(); // ��������� SDA (���.1), ����� ������� ���������� ������ ������������� ACK
//	I2C_SCL_Free(); // ��������� SCL (���.1), ����� ������� ���������� �������� ACK
//    SDA=SDA_I;
//	if (SDA==0x00) ack=1; else ack=0;    // ������� ACK
//
//	I2C_SCL_Hold(); // ��������� SCL (���.0)  // ���� ACK ��������
//
//    return ack; // ������� ACK (0) ��� NACK (1)
//
//}
////----------------------------------------------------
//uint8_t i2c_get_byte (uint8_t last_byte) // ������� �������� �����
//{
// uint8_t i, res=0;
//	uint16_t SDA;
//	I2C_SDA_Free(); // ��������� SDA (���.1)
//
//    for (i=0;i<8;i++)
//    {
//        res<<=1;
//        I2C_SCL_Free(); // ��������� SCL (���.1)      //������� �� SCL
//        I2C_SDA_Free();
//
//		SDA=SDA_I;
//		if (SDA==1) res=res|0x01; // ������ SDA � ����������  ���� SDA=1 �� ���������� 1
//		I2C_SCL_Hold(); // ��������� SCL (���.0)
//    }
//
//    if (last_byte==0){ I2C_SDA_Hold();} // ��������� SDA (���.0)     // �������������, ACK, ����� ��������� ��� ���� ����
//    else {I2C_SDA_Free();} // ��������� SDA (���.1)                 // ��� �������������, NACK, ��� ��������� ��������� ����
//    I2C_SCL_Free(); // ��������� SCL (���.1)
//    I2C_SCL_Hold(); // ��������� SCL (���.0)
//    I2C_SDA_Free(); // ��������� SDA (���.1)
//
//    return res; // ������� ��������� ��������
//}
