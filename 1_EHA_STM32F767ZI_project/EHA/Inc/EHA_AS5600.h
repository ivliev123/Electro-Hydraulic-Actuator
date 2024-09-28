/*
 * AS5600.h
 *
 *  Created on: 26 апр. 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_AS5600_H_
#define INC_EHA_AS5600_H_

#include "main.h"

#define Sensor_Mode		'A'	//I2C
//#define Sensor_Mode		'B'	//UART

#define AS5600_SLAVE_ADDRESS 0x36
#define AS5600_REGISTER_ANGLE_HIGH 	0x0E


#define  AS5600_CONST_d_angle_to_pwr -16.65			//			1 obr		1000 ms
													//16.65  =  -----	x	-----		x	60 (sec)
													//			4095		1 ms

//void Delay_us (uint32_t us);

void AS5600_init(void);
void AS5600_update_Callback_dt(void);
//void AS5600_Callback(TIM_HandleTypeDef *htim);
void AS5600_Callback(void);
void AS5600_Angle_Callback(void);
void AS5600_RPM_Callback(void);
int16_t AS5600_Angle_Get(void);
int16_t AS5600_RPM_Get(void);



#endif /* INC_EHA_AS5600_H_ */
