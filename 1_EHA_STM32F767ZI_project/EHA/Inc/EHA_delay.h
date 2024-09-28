/*
 * delay.h
 *
 *  Created on: 29 апр. 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_DELAY_H_
#define INC_EHA_DELAY_H_

#include "main.h"


void TimerDelay_Init(void);
void Delay_us(uint16_t au16_us);
void Delay_ms(uint16_t au16_ms);


#endif /* INC_EHA_DELAY_H_ */
