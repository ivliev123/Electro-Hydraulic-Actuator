/*
 * PWM.c
 *
 *  Created on: 29 ���. 2024 �.
 *      Author: Ivliev
 */


#include <EHA_PWM.h>


int16_t setup_pwm = 0; //////////////////////////******* tyt uint sidit
uint16_t pwm_ch1 = 0;
uint16_t pwm_ch2 = 0;

extern TIM_HandleTypeDef htim1;
extern uint16_t usRegHoldingBuf[];

#define PID_PWM_MIN		16

uint32_t CheckCount_1 = 0;

//void PWM_Callback(void){
void PWM_Callback(int16_t PWM_OUTPUT){
	if (usRegHoldingBuf[REG_START_STOP]){
		setup_pwm = PWM_OUTPUT;
	}
	else {
	  setup_pwm = 0;
	  DC_MOTOR_PI_init();
	  CYLINDER_PI_init();
//	  HAL_GPIO_WritePin(LED3_GPIO_Port,LED3_Pin, 0);
	}


//	#if   (System_Mode  == 'A')
//		if (usRegHoldingBuf[REG_START_STOP]){
//			setup_pwm = PWM_OUTPUT;
//		}
//	#elif   (System_Mode  == 'B')
//		if (usRegHoldingBuf[REG_START_STOP]){
//			setup_pwm = PWM_OUTPUT;
//		}
//	#elif   (System_Mode  == 'C')
//		if (usRegHoldingBuf[REG_START_STOP]){
//
//			PID_PWM = DC_MOTOR_PI_Calc();
//			if (PWM_OUTPUT > PID_PWM_MIN) { setup_pwm =  PWM_OUTPUT; Relay_1_OFF; Relay_4_ON;} else
//			if (PWM_OUTPUT < -PID_PWM_MIN){ setup_pwm = -PWM_OUTPUT; Relay_1_ON; Relay_4_OFF;}
//			else{setup_pwm = 0; Relay_1_OFF; Relay_4_OFF}
//
//			PWM_Callback(OUT_PID_PWM);
//		}
//	#else
//		setup_pwm = 0;
//	#endif



	if(setup_pwm > EHA_PWM_max){
	setup_pwm = EHA_PWM_max;
	}
	if(setup_pwm < -EHA_PWM_max){
	setup_pwm = -EHA_PWM_max;
	}

	pwm_ch1 = EHA_PWM_max_half + (setup_pwm * 0.5);
	pwm_ch2 = EHA_PWM_max_half - (setup_pwm * 0.5);

//	uint16_t pwm_ch_max = 2000;
//	uint16_t pwm_ch_max = EHA_PWM_max;



//	if (pwm_ch1 >= pwm_ch_max) {pwm_ch1 = pwm_ch_max;}
//	if (pwm_ch2 >= pwm_ch_max) {pwm_ch2 = pwm_ch_max;}

	// MyData.data_10 = pwm_ch1;
	// MyData.data_11 = pwm_ch2;


	__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, pwm_ch1);
	__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, pwm_ch2);

	// CheckCount_1++;
	// MyData.data_11 = CheckCount_1;
	MyData.data_11 = pwm_ch1;

}
