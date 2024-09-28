/*
 * PWM.h
 *
 *  Created on: 29 апр. 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_PWM_H_
#define INC_EHA_PWM_H_

#include "main.h"

#define EHA_PWM_max 			5398// 4000
#define EHA_TIM_PWM_max 		5398
#define EHA_PWM_max_half 		EHA_TIM_PWM_max / 2


void PWM_Callback(int16_t PWM_OUTPUT);
#endif /* INC_EHA_PWM_H_ */
