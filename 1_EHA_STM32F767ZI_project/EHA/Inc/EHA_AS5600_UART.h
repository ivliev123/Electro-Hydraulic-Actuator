/*
 * EHA_AS5600_UART.h
 *
 *  Created on: 10 ���. 2024 �.
 *      Author: Ivliev
 */

#ifndef INC_EHA_AS5600_UART_H_
#define INC_EHA_AS5600_UART_H_

#include "main.h"

extern UART_HandleTypeDef huart6;

#define MYUART huart6 // ����������� USART
#define UART_RX_BUFFER_SIZE 128 // ������� ������ �������� ������
#define SIZE_BF 32


void EHA_AS5400_UART_Interrupt(void);
void EHA_AS5400_UART_get_response(void);

int16_t AS5600_UART_Angle_Get(void);
int16_t AS5600_UART_RPM_Get(void);

#endif /* INC_EHA_AS5600_UART_H_ */
