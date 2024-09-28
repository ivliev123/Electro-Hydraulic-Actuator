/*
 * EHA_CONTROL_config.h
 *
 *  Created on: 6 мая 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_CONTROL_SYSTEM_H_
#define INC_EHA_CONTROL_SYSTEM_H_


#import "main.h"

//#define System_Mode		'A' //'PWM_mode'
//#define System_Mode		'B' //'SPEED_mode'
//#define System_Mode			'C' //'POSITION_mode'
#define System_Mode			'D' //'trajectory_mode'


float DC_MOTOR_PI_Calc(void);
void DC_MOTOR_PI_init(void);
float DC_MOTOR_Vel_Fb_Filter(void);
void DC_MOTOR_PI_data_to_monitor(void);



int16_t CYLINDER_GET_Pos (void);
float CYLINDER_PI_Calc(void);
void CYLINDER_PI_init(void);
void CYLINDER_PI_data_to_monitor(void);


int32_t Get_Trajectory(void);
uint16_t Motor_status(void);

void EHA_Control_System(void);

#endif /* INC_EHA_CONTROL_SYSTEM_H_ */
