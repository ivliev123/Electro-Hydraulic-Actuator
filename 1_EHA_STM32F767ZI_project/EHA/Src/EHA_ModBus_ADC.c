/*
 * ModBus_ADC.c
 *
 *  Created on: 26 апр. 2024 г.
 *      Author: Ivliev
 */
#include <EHA_ModBus_ADC.h>


uint16_t update_arr (TIM_HandleTypeDef* htim, uint16_t arr, uint16_t arr_last) {
	uint16_t arr_last_out = 0;
	__HAL_TIM_SET_AUTORELOAD(htim, arr);
    if (__HAL_TIM_GET_COUNTER(htim) >= __HAL_TIM_GET_AUTORELOAD(htim)) {
        htim->Instance->EGR  |= TIM_EGR_UG;

        arr_last_out = arr;
    }else{
    	arr_last_out = arr_last;
    }
    return arr_last_out;
}


extern TIM_HandleTypeDef htim6;
extern ADC_HandleTypeDef hadc3;

extern uint16_t usRegHoldingBuf[];
Struct_MyData MyData;


uint16_t ADC1_counter_last = ADC_d_t_startup;
uint16_t ADC1_counter = ADC_d_t_startup;

volatile uint16_t adc[5] = {0,};
volatile uint8_t flag = 0;

uint16_t ADC_mode = 0; // 0 - AUTO; 1 - MANUAL
uint8_t  ADC_i = 0;
uint8_t  ADC_num_blok_reg_array = 0;
uint16_t ADC_pos_reg_array = 0;

uint16_t count = 0;




/*функция установки времени дискрктизации ADC*/
void ADC1_update_d_t(void){

	ADC1_counter = usRegHoldingBuf[REG_ADC1_d_t];

	if(ADC1_counter != ADC1_counter_last){
		ADC1_counter_last = update_arr(&htim6, ADC1_counter, ADC1_counter_last);

	}
}

/*Функцуия установки режима работы ADC   НЕ ПОНАДОБИТСЯ*/
//void ADC_update_mode(void){
//	ADC_mode = usRegHoldingBuf[REG_ADC1_mode];
//}

void ModBus_ADC_init(void){
	usRegHoldingBuf[REG_ADC1_d_t] = ADC_d_t_startup;
	ADC1_counter = ADC_d_t_startup;
	ADC1_counter_last = ADC_d_t_startup;

    HAL_TIM_Base_Start(&htim6);
//    HAL_ADCEx_Calibration_Start(&hadc3);
    HAL_ADC_Start_DMA(&hadc3, (uint32_t *)adc, 4);
}


void ModBus_ADC_Callback(void){

	ADC_pos_reg_array = (ADC_num_blok_reg_array % ADC_bloks_len) * ADC_block_size + ADC_i;

	count++;
//	uint16_t x = count%2000;
	/*Запись в регистры Modbus значений с каналов ADC*/
	usRegHoldingBuf[ADC_start_reg_1 + ADC_pos_reg_array] = adc[0];
	usRegHoldingBuf[ADC_start_reg_2 + ADC_pos_reg_array] = adc[1];
	usRegHoldingBuf[ADC_start_reg_3 + ADC_pos_reg_array] = adc[2];
	usRegHoldingBuf[ADC_start_reg_4 + ADC_pos_reg_array] = adc[3];

//		usRegHoldingBuf[ADC_start_reg_5 + ADC_pos_reg_array] = sin(count*0.15)*1000 + 1000;
//		usRegHoldingBuf[ADC_start_reg_6 + ADC_pos_reg_array] = sin(count*0.20)*900 + 1000;
//		usRegHoldingBuf[ADC_start_reg_7 + ADC_pos_reg_array] = sin(count*0.35)*800 + 1000;
//		usRegHoldingBuf[ADC_start_reg_8 + ADC_pos_reg_array] = sin(count*0.30)*700 + 1000;
//		usRegHoldingBuf[ADC_start_reg_9 + ADC_pos_reg_array] = sin(count*0.35)*600 + 1000;
//		usRegHoldingBuf[ADC_start_reg_10 + ADC_pos_reg_array] = sin(count*0.40)*500 + 1000;
//		usRegHoldingBuf[ADC_start_reg_11 + ADC_pos_reg_array] = sin(count*0.45)*400 + 1000;
//		usRegHoldingBuf[ADC_start_reg_12 + ADC_pos_reg_array] = sin(count*0.50)*300 + 1000;
//		usRegHoldingBuf[ADC_start_reg_13 + ADC_pos_reg_array] = sin(count*0.65)*200 + 1000;
//		usRegHoldingBuf[ADC_start_reg_14 + ADC_pos_reg_array] = sin(count*0.60)*100 + 1000;

	usRegHoldingBuf[ADC_start_reg_5 + ADC_pos_reg_array] = MyData.data_1;
	usRegHoldingBuf[ADC_start_reg_6 + ADC_pos_reg_array] = MyData.data_2;
	usRegHoldingBuf[ADC_start_reg_7 + ADC_pos_reg_array] = MyData.data_3;
	usRegHoldingBuf[ADC_start_reg_8 + ADC_pos_reg_array] = MyData.data_4;
	usRegHoldingBuf[ADC_start_reg_9 + ADC_pos_reg_array] = MyData.data_5;
	usRegHoldingBuf[ADC_start_reg_10 + ADC_pos_reg_array] = MyData.data_6;
	usRegHoldingBuf[ADC_start_reg_11 + ADC_pos_reg_array] = MyData.data_7;
	usRegHoldingBuf[ADC_start_reg_12 + ADC_pos_reg_array] = MyData.data_8;
	usRegHoldingBuf[ADC_start_reg_13 + ADC_pos_reg_array] = MyData.data_9;
	usRegHoldingBuf[ADC_start_reg_14 + ADC_pos_reg_array] = MyData.data_10;
	usRegHoldingBuf[ADC_start_reg_15 + ADC_pos_reg_array] = MyData.data_11;
	usRegHoldingBuf[ADC_start_reg_16 + ADC_pos_reg_array] = MyData.data_12;

	ADC_i++;
	if(ADC_i >= ADC_block_size_m1){
		ADC_i = 0;

		ADC_num_blok_reg_array = (ADC_num_blok_reg_array % ADC_bloks_len) + 1;
		for(int i = 0; i < ADC_bloks_len; i++){
			/*Записб значения о том, какой по счету блок был полностью заполнен на текущий момент*/
			usRegHoldingBuf[ADC_start_reg_1 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_2 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_3 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_4 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_5 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_6 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_7 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_8 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_9 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_10 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_11 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_12 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_13 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_14 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_15 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;
			usRegHoldingBuf[ADC_start_reg_16 + ADC_block_size * i + ADC_block_size_m1] = ADC_num_blok_reg_array;

		}
	}
}
