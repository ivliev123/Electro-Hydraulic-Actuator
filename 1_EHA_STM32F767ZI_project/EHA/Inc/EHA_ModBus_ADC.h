/*
 * ModBus_ADC.h
 *
 *  Created on: 26 апр. 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_MODBUS_ADC_H_
#define INC_EHA_MODBUS_ADC_H_

#include <EHA_REG_config.h>
#include "main.h"


typedef struct _MyData{
	uint16_t data_1;
	uint16_t data_2;
	uint16_t data_3;
	uint16_t data_4;
	uint16_t data_5;
	uint16_t data_6;
	uint16_t data_7;
	uint16_t data_8;

	uint16_t data_9;
	uint16_t data_10;
	uint16_t data_11;
	uint16_t data_12;
	uint16_t data_13;
	uint16_t data_14;
	uint16_t data_15;
	uint16_t data_16;

}Struct_MyData;

extern Struct_MyData MyData;

uint16_t update_arr (TIM_HandleTypeDef* htim, uint16_t arr, uint16_t arr_last);
void ADC1_update_d_t(void);
void ModBus_ADC_init(void);
void ModBus_ADC_Callback(void);


#endif /* INC_EHA_MODBUS_ADC_H_ */
