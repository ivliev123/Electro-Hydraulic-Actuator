/*
 * w5500_setup.h
 *
 *  Created on: 22 апр. 2024 г.
 *      Author: Ivliev
 */

#ifndef INC_EHA_W5500_SETUP_H_
#define INC_EHA_W5500_SETUP_H_


#include <stdbool.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include "socket.h"
#include "dhcp.h"
#include "dns.h"
#include "sntp.h"
#include "W5500/w5500.h"
#include "mb.h"
#include "mbproto.h"
#include "mbutils.h"



#define HTTP_SOCKET     0
#define PORT_TCPS		    5000
#define DATA_BUF_SIZE   2048
uint8_t gDATABUF[DATA_BUF_SIZE];







#define DHCP_SOCKET     0
#define SNTP_SOCKET      1
#define HTTP_SOCKET     0
#define MBTCP_PORT      502

#define REG_INPUT_START       0x0001
#define REG_INPUT_NREGS       8

#define REG_HOLDING_START     0x0001
//#define REG_HOLDING_NREGS     1000
#define REG_HOLDING_NREGS     REG_ADC_16_start + ADC_buffer_size

#define REG_COILS_START       0x0001
#define REG_COILS_SIZE        16

#define REG_DISCRETE_START    0x0001
#define REG_DISCRETE_SIZE     16


void w5500_init(void);




#endif /* INC_EHA_W5500_SETUP_H_ */
