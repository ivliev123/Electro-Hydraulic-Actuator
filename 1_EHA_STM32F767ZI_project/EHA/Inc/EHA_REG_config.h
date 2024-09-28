/*
 * H6812.h
 *
 *  Created on: 19 сент. 2022 г.
 *      Author: 123iv
 */

#ifndef INC_EHA_REG_CONFIG_H_
#define INC_EHA_REG_CONFIG_H_

//#define  RESET_ALARM_ON

//#define  TEST_GPIO
#define  TEST_GPIO 'D'
//#define  TEST_GPIO '1'
//#define  TEST_GPIO '2'

/*----------defines----------REGISTERS --BEGIN--*/
#define REG_time 		 				0


#define REG_ADC1_d_t 					22

#define REG_Relay_1 					30
#define REG_Relay_2 					31
#define REG_Relay_3 					32
#define REG_Relay_4 					33

#define REG_START_STOP 					50
#define REG_MOTOR_PWM					51


#define REG_ADC_1_start   				1000								/*Канал №1 ADC*/
#define REG_ADC_2_start   				REG_ADC_1_start + ADC_buffer_size	/*Канал №2 ADC*/
#define REG_ADC_3_start   				REG_ADC_2_start	+ ADC_buffer_size	/*Канал №3 ADC*/
#define REG_ADC_4_start   				REG_ADC_3_start	+ ADC_buffer_size	/*Канал №4 ADC*/

#define REG_ADC_5_start   				REG_ADC_4_start + ADC_buffer_size	/*Канал №5 ADC*/
#define REG_ADC_6_start   				REG_ADC_5_start	+ ADC_buffer_size	/*Канал №6 ADC*/
#define REG_ADC_7_start   				REG_ADC_6_start	+ ADC_buffer_size	/*Канал №7 ADC*/
#define REG_ADC_8_start   				REG_ADC_7_start + ADC_buffer_size	/*Канал №8 ADC*/
#define REG_ADC_9_start   				REG_ADC_8_start	+ ADC_buffer_size	/*Канал №9 ADC*/
#define REG_ADC_10_start   				REG_ADC_9_start	+ ADC_buffer_size	/*Канал №10 ADC*/
#define REG_ADC_11_start   				REG_ADC_10_start + ADC_buffer_size	/*Канал №11 ADC*/
#define REG_ADC_12_start   				REG_ADC_11_start + ADC_buffer_size	/*Канал №12 ADC*/
#define REG_ADC_13_start   				REG_ADC_12_start + ADC_buffer_size	/*Канал №13 ADC*/
#define REG_ADC_14_start   				REG_ADC_13_start + ADC_buffer_size	/*Канал №14 ADC*/
#define REG_ADC_15_start   				REG_ADC_14_start + ADC_buffer_size	/*Канал №15 ADC*/
#define REG_ADC_16_start   				REG_ADC_15_start + ADC_buffer_size	/*Канал №16 ADC*/



/*----------defines----------REGISTERS --END--*/


/*----------defines----------VALUE --BEGIN--*/

#define ADC_bloks_len   9 		/*Количество блоков*/
#define ADC_block_size 	125		/*Размер одного блок. 124 для записи значения ADC. И один для записи значения о том, какой по счету блок был полностью заполнен на текущий момент*/
#define ADC_block_size_m1 ADC_block_size - 1 /**/

#define ADC_buffer_size 			ADC_block_size * ADC_bloks_len


#define ADC_start_reg_1  REG_ADC_1_start
#define ADC_start_reg_2  REG_ADC_2_start
#define ADC_start_reg_3  REG_ADC_3_start
#define ADC_start_reg_4  REG_ADC_4_start

#define ADC_start_reg_5  REG_ADC_5_start
#define ADC_start_reg_6  REG_ADC_6_start
#define ADC_start_reg_7  REG_ADC_7_start
#define ADC_start_reg_8  REG_ADC_8_start
#define ADC_start_reg_9  REG_ADC_9_start
#define ADC_start_reg_10  REG_ADC_10_start
#define ADC_start_reg_11  REG_ADC_11_start
#define ADC_start_reg_12  REG_ADC_12_start
#define ADC_start_reg_13  REG_ADC_13_start
#define ADC_start_reg_14  REG_ADC_14_start
#define ADC_start_reg_15  REG_ADC_15_start
#define ADC_start_reg_16  REG_ADC_16_start


#define ADC_d_t_startup 				1000-1		/*600 µс*/

#define DAC_d_t_startup					1000-1		/*1000 µс*/
#define TIM_1_counter_startup			1000-1		/*1000 µс*/

#define DAC_len   1000

/*----------defines----------VALUE --END--*/






#endif /* INC_EHA_REG_CONFIG_H_ */
