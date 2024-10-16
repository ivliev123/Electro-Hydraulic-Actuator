/*
 * EHA_AS5600_UART.c
 *
 *  Created on: 10 июл. 2024 г.
 *      Author: Ivliev
 */

#include "EHA_AS5600_UART.h"

#include "stm32f7xx_it.h"
#include "stm32f767xx.h"




/////////////////// USART /////////////////////
volatile uint16_t rx_buffer_head = 0;
volatile uint16_t rx_buffer_tail = 0;
uint8_t rx_buffer[UART_RX_BUFFER_SIZE] = { 0, };



void EHA_AS5400_UART_Interrupt(void){
    if((MYUART.Instance->ISR & USART_ISR_RXNE) != RESET)
    {
            uint8_t rbyte = (uint8_t)(MYUART.Instance->RDR & (uint8_t)0x00FF); // читает байт из регистра
            uint16_t i = (uint16_t)(rx_buffer_head + 1) % UART_RX_BUFFER_SIZE;

            if(i != rx_buffer_tail)
            {
                    rx_buffer[rx_buffer_head] = rbyte;
                    rx_buffer_head = i;
            }
    }
    return;
}



void clear_uart_buff() {
//	__HAL_UART_DISABLE_IT(&MYUART, UART_IT_RXNE);
	rx_buffer_head = 0;
	rx_buffer_tail = 0;
	for(int i = 0; i < UART_RX_BUFFER_SIZE; i++){
		rx_buffer[i] = 0;
	}
//	__HAL_UART_ENABLE_IT(&MYUART, UART_IT_RXNE);
}

uint16_t uart_available(void) {
//	return ((uint16_t) (UART_RX_BUFFER_SIZE + rx_buffer_head - rx_buffer_tail))	% UART_RX_BUFFER_SIZE;
	return 1;
}

uint8_t uart_read(void) {
//	if (rx_buffer_head == rx_buffer_tail) {
//		return 0;
//	} else {
		uint8_t c = rx_buffer[rx_buffer_tail];
		rx_buffer_tail = (uint16_t) (rx_buffer_tail + 1) % UART_RX_BUFFER_SIZE;
		return c;
//	}
}

uint8_t flag_start_b = 0;
uint8_t _byte = 0;
uint8_t _byte_last = 0;
uint8_t _byte_now = 0;
uint8_t buffer[10];
int b_i=0;

uint16_t EHA_AS5400_UART_Angle = 0;
uint16_t EHA_AS5400_UART_RPM = 0;

void EHA_AS5400_UART_get_response(void){

//    uint16_t summ = 0;
    uint8_t summ = 0;
//    uint8_t checksum = 0;

    if(uart_available()){
    	_byte = uart_read();

    	if(b_i > 10){
    		flag_start_b = 0;
    		b_i= 0;
    	}

    	if(flag_start_b){

			for(int j = 0; j < 6; j++){
				buffer[j] = uart_read();
			}
//			MyData.data_2 = buffer[1] * 10;
//			MyData.data_3 = buffer[2] * 10;

			for(int j = 0; j < 5; j++){
				summ = summ + buffer[j];
			}
			summ = summ + 170 + 85;
			if(summ == buffer[5]){
				EHA_AS5400_UART_Angle = buffer[1] * 256 + buffer[2];
				EHA_AS5400_UART_RPM = buffer[3] * 256 + buffer[4];
			}

			clear_uart_buff();
			for(int i = 0 ;i < 10; i++) { buffer[i] = 0;}
			b_i = 0;
			flag_start_b = 0;


//    		buffer[b_i] = _byte;
//    		if(b_i == buffer[1] && b_i != 0){
//    			summ = 0;
//				for(int j = 0; j < b_i; j++){
//					summ = summ + buffer[j];
//				}
//				summ = summ + 170 + 85;
////				checksum = 255 - (summ % 256);
//
//				if(checksum == buffer[b_i]){
//					servo_analyze_data(buffer[0], buffer[2], buffer[3], buffer[4]);
//				}
//
//				clear_uart_buff();
//				for(int i = 0 ;i < 15; i++)  buffer[i] = 0;
//				b_i = 0;
//				flag = 0;
//    		}else{
//    			b_i++;
//    		}
    	}

		_byte_last = _byte_now;
		_byte_now = _byte;

		if(_byte_now == 170 && _byte_last == 85 ){
			flag_start_b = 1;
			b_i = 0;
		}
    }
}

int16_t AS5600_UART_Angle_Get(void){
    return EHA_AS5400_UART_Angle;
}
int16_t AS5600_UART_RPM_Get(void){
    return EHA_AS5400_UART_RPM;
}
