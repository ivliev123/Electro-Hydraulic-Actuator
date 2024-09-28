/*
 * AS5600.c
 *
 *  Created on: 26 ���. 2024 �.
 *      Author: Ivliev
 */

#include <EHA_AS5600.h>
#include <EHA_AS5600_UART.h>


extern TIM_HandleTypeDef htim7;

uint8_t  AS5600_addr = 0;
uint8_t  AS5600_b1 = 0;
uint8_t  AS5600_b2 = 0;
uint16_t AS5600_Angle_12b = 0;
uint8_t  AS5600_Background_counter = 0;

uint16_t AS5600_Angle_now   = 0;
uint16_t AS5600_Angle_last  = 0;
int16_t AS5600_Angle_delta = 0;
int16_t  AS5600_RPM_val  = 0;	// may be need change to float

uint8_t quadrant_number_now = 0;
uint8_t quadrant_number_last = 0;


uint16_t AS5600_counter_last = 0;
uint16_t AS5600_counter = 0;

uint8_t AS5600_Callback_count = 0;

void AS5600_init(void){
	#if (Sensor_Mode == 'B')
//	  __HAL_UART_ENABLE_IT(&MYUART, UART_IT_RXNE); // �������� ���������� usart'a
	#endif
	
	AS5600_update_Callback_dt();
}

void AS5600_update_Callback_dt(void){

	AS5600_counter = 1000-1;

	if(AS5600_counter != AS5600_counter_last){
		AS5600_counter_last = update_arr(&htim7, AS5600_counter, AS5600_counter_last);

	}
}


//void AS5600_Callback(TIM_HandleTypeDef *htim){
void AS5600_Callback(void){

#if (Sensor_Mode == 'A')

		AS5600_Angle_Callback();
		AS5600_RPM_Callback();

		MyData.data_2 = AS5600_Angle_Get();
		MyData.data_3 = AS5600_RPM_Get();

#elif   (Sensor_Mode  == 'B')
	EHA_AS5400_UART_get_response();
	AS5600_Angle_12b = AS5600_UART_Angle_Get();
	AS5600_RPM_val = AS5600_UART_RPM_Get();

	MyData.data_2 = AS5600_Angle_12b;
	MyData.data_3 = AS5600_RPM_val;
#endif
}



void AS5600_Angle_Callback(void){


	AS5600_addr = (AS5600_SLAVE_ADDRESS << 1) + 0;

	i2c_start_cond ();
	i2c_send_byte (AS5600_addr);
	i2c_send_byte    (AS5600_REGISTER_ANGLE_HIGH);

	i2c_restart_cond ();

	AS5600_addr = (AS5600_SLAVE_ADDRESS << 1) + 1;
	i2c_send_byte (AS5600_addr);
	AS5600_b1 =  i2c_get_byte(0);
	AS5600_b2 = i2c_get_byte(1);

	AS5600_Angle_12b = (AS5600_b1 << 8) + AS5600_b2;
	i2c_stop_cond();

	if(AS5600_Angle_12b < 0){
		AS5600_Angle_12b = AS5600_Angle_last + AS5600_Angle_delta;
	}
}



void AS5600_RPM_Callback(void){

    AS5600_Angle_now  = AS5600_Angle_12b;

    if(AS5600_Angle_12b >= 0 && AS5600_Angle_12b <= 1023){
        quadrant_number_now = 1;
    }
    if(AS5600_Angle_12b > 1024  && AS5600_Angle_12b <= 2047){
        quadrant_number_now = 2;
    }
    if(AS5600_Angle_12b >= 2048 && AS5600_Angle_12b <= 3071){
        quadrant_number_now = 3;
    }
    if(AS5600_Angle_12b >= 3072 && AS5600_Angle_12b <= 4095){
        quadrant_number_now = 4;
    }



    if (quadrant_number_now == 4 && quadrant_number_last == 1){ // 1 --> 4
        AS5600_Angle_delta = (0 - AS5600_Angle_last) + (AS5600_Angle_now - 4095);
//        AS5600_Angle_delta = (0 - AS5600_Angle_now) + (AS5600_Angle_last - 4095);
    }
    else if (quadrant_number_now == 1 && quadrant_number_last == 4){ // 4 --> 1
//        AS5600_Angle_delta = (0 - AS5600_Angle_last) + (AS5600_Angle_now - 4095);
        AS5600_Angle_delta = (0 + AS5600_Angle_now) + (-AS5600_Angle_last + 4095);
    }
    else{
        AS5600_Angle_delta = AS5600_Angle_now - AS5600_Angle_last;
    }

    quadrant_number_last = quadrant_number_now;
    AS5600_Angle_last = AS5600_Angle_now;

    AS5600_RPM_val = (AS5600_Angle_delta * AS5600_CONST_d_angle_to_pwr);
}


int16_t AS5600_Angle_Get(void){
    return AS5600_Angle_12b;
}
int16_t AS5600_RPM_Get(void){
    return AS5600_RPM_val;
}

//int16_t AS5600_Angle_delta_Get(void){
//	return AS5600_Angle_delta;
//}

