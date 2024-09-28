/*
 * EHA_Relay.h
 *
 *  Created on: 10 θών. 2024 γ.
 *      Author: Ivliev
 */

#ifndef INC_EHA_RELAY_H_
#define INC_EHA_RELAY_H_

#include "main.h"

#define GPIO_PORT_Relay_1 	GPIOA
#define GPIO_PORT_Relay_2 	GPIOA
#define GPIO_PORT_Relay_3 	GPIOD
#define GPIO_PORT_Relay_4 	GPIOD


#define GPIO_PIN_Relay_1 	GPIO_PIN_5
#define GPIO_PIN_Relay_2 	GPIO_PIN_6
#define GPIO_PIN_Relay_3 	GPIO_PIN_14
#define GPIO_PIN_Relay_4 	GPIO_PIN_15

#define Relay_1_ON 			HAL_GPIO_WritePin(GPIO_PORT_Relay_1, GPIO_PIN_Relay_1, GPIO_PIN_RESET);
#define Relay_1_OFF			HAL_GPIO_WritePin(GPIO_PORT_Relay_1, GPIO_PIN_Relay_1, GPIO_PIN_SET);
#define Relay_2_ON 			HAL_GPIO_WritePin(GPIO_PORT_Relay_2, GPIO_PIN_Relay_2, GPIO_PIN_RESET);
#define Relay_2_OFF			HAL_GPIO_WritePin(GPIO_PORT_Relay_2, GPIO_PIN_Relay_2, GPIO_PIN_SET);
#define Relay_3_ON 			HAL_GPIO_WritePin(GPIO_PORT_Relay_3, GPIO_PIN_Relay_3, GPIO_PIN_RESET);
#define Relay_3_OFF			HAL_GPIO_WritePin(GPIO_PORT_Relay_3, GPIO_PIN_Relay_3, GPIO_PIN_SET);
#define Relay_4_ON 			HAL_GPIO_WritePin(GPIO_PORT_Relay_4, GPIO_PIN_Relay_4, GPIO_PIN_RESET);
#define Relay_4_OFF			HAL_GPIO_WritePin(GPIO_PORT_Relay_4, GPIO_PIN_Relay_4, GPIO_PIN_SET);


void Relay_init(void);
void Relay_Callback(void);

#endif /* INC_EHA_RELAY_H_ */
