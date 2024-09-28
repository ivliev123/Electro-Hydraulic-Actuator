/*
 * EHA_Relay.c
 *
 *  Created on: 10 θών. 2024 γ.
 *      Author: Ivliev
 */

#include <EHA_Relay.h>
#include <main.h>

extern uint16_t usRegHoldingBuf[];

void Relay_init(void){
	  Relay_1_OFF;
	  Relay_2_OFF;
	  Relay_3_OFF;
	  Relay_4_OFF;
}

void Relay_Callback(void){
	if(usRegHoldingBuf[REG_Relay_1]){Relay_1_ON;} else {Relay_1_OFF;}
	if(usRegHoldingBuf[REG_Relay_2]){Relay_2_ON;} else {Relay_2_OFF;}
	if(usRegHoldingBuf[REG_Relay_3]){Relay_3_ON;} else {Relay_3_OFF;}
	if(usRegHoldingBuf[REG_Relay_4]){Relay_4_ON;} else {Relay_4_OFF;}
}
