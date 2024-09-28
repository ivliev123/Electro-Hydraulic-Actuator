///*
// * I2C.c
// *
// *  Created on: 20 апр. 2023 г.
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
//__STATIC_INLINE void Delay_us (uint32_t __IO us) //Функция задержки в микросекундах us
//{
//us *=(SystemCoreClock/1000000)/5;
//	while(us--);
//}
//
////----------------------------------------------------
//void SCL_in (void) //функция отпускания SCL в 1, порт на вход (необходимо установить используемый порт)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_10;
//	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//}
////----------------------------------------------------
//void SCL_out (void) //функция притягивания SCL в 0 (необходимо установить используемый порт)
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
//void SDA_in (void) //функция отпускания SDA в 1, порт на вход (необходимо установить используемый порт)
//{
//	GPIO_InitTypeDef GPIO_InitStruct;
//	GPIO_InitStruct.Pin = GPIO_PIN_11;
//	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
//	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
//}
////----------------------------------------------------
//void SDA_out (void) //функция притягивания SDA в 0 (необходимо установить используемый порт)
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
//void i2c_stop_cond (void)  // функция генерации условия стоп
//{
//    uint16_t SCL, SDA;
//    I2C_SCL_Hold(); // притянуть SCL (лог.0)
//    I2C_SDA_Hold(); // притянуть SDA (лог.0)
//
//    I2C_SCL_Free(); // отпустить SCL (лог.1)
//    I2C_SDA_Free(); // отпустить SDA (лог.1)
//
////    // проверка фрейм-ошибки
////    i2c_frame_error=0;		// сброс счётчика фрейм-ошибок
////    SCL=SCL_I;
////		SDA=SDA_I;
////		if (SCL == 0) i2c_frame_error++;   // проберяем, чтобы на ноге SDA была лог.1, иначе выдаём ошибку фрейма
////    if (SDA == 0) i2c_frame_error++;   // проберяем, чтобы на ноге SCL была лог.1, иначе выдаём ошибку фрейма
////    Delay_us(40);
//}
//
//void i2c_init (void) // функция инициализации шины
//{
//    i2c_stop_cond();   // стоп шины
//    i2c_stop_cond();   // стоп шины
//}
////----------------------------------------------------
//void i2c_start_cond (void)  // функция генерации условия старт
//{
//	I2C_SDA_Free(); // отпустить SDA (лог.1)
//    I2C_SCL_Free(); // отпустить SCL (лог.1)
//
//    I2C_SCL_Hold(); // притянуть SCL (лог.0)
//    I2C_SDA_Hold(); // притянуть SDA (лог.0)
//
//
//}
////----------------------------------------------------
//void i2c_restart_cond (void)   // функция генерации условия рестарт
//{
//    SDA_in(); // отпустить SDA (лог.1)
//    Delay_us(10);
//    SCL_in(); // отпустить SCL (лог.1)
//    Delay_us(10);
//    SDA_out(); // притянуть SDA (лог.0)
//    Delay_us(10);
//    SCL_out(); // притянуть SCL (лог.0)
//    Delay_us(10);
//}
////----------------------------------------------------
//uint8_t i2c_send_byte (uint8_t data)  // функция  отправки байта
//{
// uint8_t i;
// uint8_t ack=1;           //АСК, если АСК=1 – произошла ошибка
//uint16_t SDA;
//	for (i=0;i<8;i++)
//    {
//        if (data & 0x80)
//		{
//        	I2C_SDA_Free();; // лог.1
//        }
//		else
//		{
//			I2C_SDA_Hold(); // Выставить бит на SDA (лог.0
//		}
//
//        I2C_SCL_Free();   // Записать его импульсом на SCL       // отпустить SCL (лог.1)
//        I2C_SCL_Hold(); // притянуть SCL (лог.0)
//        data<<=1; // сдвигаем на 1 бит влево
//
//    }
//	I2C_SDA_Free(); // отпустить SDA (лог.1), чтобы ведомое устройство смогло сгенерировать ACK
//	I2C_SCL_Free(); // отпустить SCL (лог.1), чтобы ведомое устройство передало ACK
//    SDA=SDA_I;
//	if (SDA==0x00) ack=1; else ack=0;    // Считать ACK
//
//	I2C_SCL_Hold(); // притянуть SCL (лог.0)  // приём ACK завершён
//
//    return ack; // вернуть ACK (0) или NACK (1)
//
//}
////----------------------------------------------------
//uint8_t i2c_get_byte (uint8_t last_byte) // функция принятия байта
//{
// uint8_t i, res=0;
//	uint16_t SDA;
//	I2C_SDA_Free(); // отпустить SDA (лог.1)
//
//    for (i=0;i<8;i++)
//    {
//        res<<=1;
//        I2C_SCL_Free(); // отпустить SCL (лог.1)      //Импульс на SCL
//        I2C_SDA_Free();
//
//		SDA=SDA_I;
//		if (SDA==1) res=res|0x01; // Чтение SDA в переменную  Если SDA=1 то записываем 1
//		I2C_SCL_Hold(); // притянуть SCL (лог.0)
//    }
//
//    if (last_byte==0){ I2C_SDA_Hold();} // притянуть SDA (лог.0)     // Подтверждение, ACK, будем считывать ещё один байт
//    else {I2C_SDA_Free();} // отпустить SDA (лог.1)                 // Без подтверждения, NACK, это последний считанный байт
//    I2C_SCL_Free(); // отпустить SCL (лог.1)
//    I2C_SCL_Hold(); // притянуть SCL (лог.0)
//    I2C_SDA_Free(); // отпустить SDA (лог.1)
//
//    return res; // вернуть считанное значение
//}
