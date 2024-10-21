/*
 * EHA_Control_System.c
 *
 *  Created on: 6 ��� 2024 �.
 *      Author: Ivliev
 */

#include <EHA_Control_System.h>
#include "stdlib.h"


//#define PID_PWM_MIN		32
#define PID_PWM_MIN		112
#define CYLINDER_Sign_Lim		PID_PWM_MIN

int16_t PID_PWM = 0;
int16_t OUT_PID_PWM = 0;

int8_t CYLINDER_Dir = 0;




#if   (System_Mode  == 'A')
	#define DC_MOTOR_PI_Kp        0
	#define DC_MOTOR_PI_Ki        0.0

	#define CYLINDER_PI_Kp        0
	#define CYLINDER_PI_Ki        0
#elif   (System_Mode  == 'B')
	#define DC_MOTOR_PI_Kp        0.2 		// 1
	#define DC_MOTOR_PI_Ki        0.05 	// 0.025
	#define CYLINDER_PI_Kp        0
	#define CYLINDER_PI_Ki        0
#elif   (System_Mode  == 'C')
	#define DC_MOTOR_PI_Kp        1 //0.2
	#define DC_MOTOR_PI_Ki        0.05

	#define CYLINDER_PI_Kp        1
	#define CYLINDER_PI_Ki        0
#elif   (System_Mode  == 'D')
	#define DC_MOTOR_PI_Kp        1	//1
	#define DC_MOTOR_PI_Ki        0.1	//0.1

	#define CYLINDER_PI_Kp        10		//10
	#define CYLINDER_PI_Ki        0

#else
	#define DC_MOTOR_PI_Kp        0
	#define DC_MOTOR_PI_Ki        0
#endif

extern uint16_t usRegHoldingBuf[];


float DC_MOTOR_Vel = 0;
float DC_MOTOR_Vel_Fb = 0;
float DC_MOTOR_Vel_Fb_F = 0;
float DC_MOTOR_PI_Err = 0;

float DC_MOTOR_P_OUT = 0;
float DC_MOTOR_I_OUT = 0;
float DC_MOTOR_PI_OUT = 0;

uint8_t DC_MOTOR_I = 1;

#define DC_MOTOR_Vel_MAX  2000  //1500 //700 //3000
//#define DC_MOTOR_PI_Calc_MAX	32767
//#define DC_MOTOR_PI_Calc_MIN	-32767
//#define DC_MOTOR_PI_Calc_MAX	5000
//#define DC_MOTOR_PI_Calc_MIN	-5000
#define DC_MOTOR_PI_Calc_MAX	10000
#define DC_MOTOR_PI_Calc_MIN	-10000

float DC_MOTOR_PI_Calc(void){
	#if   (System_Mode  == 'A')
		DC_MOTOR_Vel = reg_to_int16(usRegHoldingBuf[REG_MOTOR_PWM]);

	#elif   (System_Mode  == 'B')
		DC_MOTOR_Vel = reg_to_int16(usRegHoldingBuf[REG_MOTOR_PWM]);

		if(DC_MOTOR_Vel >= DC_MOTOR_Vel_MAX){
			DC_MOTOR_Vel = DC_MOTOR_Vel_MAX;
		}

		DC_MOTOR_Vel_Fb = AS5600_RPM_Get();

	#elif   (System_Mode  == 'C')
		DC_MOTOR_Vel = CYLINDER_PI_Calc();

		if(DC_MOTOR_Vel >= DC_MOTOR_Vel_MAX){
			DC_MOTOR_Vel = DC_MOTOR_Vel_MAX;
		}
		if(DC_MOTOR_Vel <= DC_MOTOR_PI_Calc_MIN){
			DC_MOTOR_Vel = DC_MOTOR_PI_Calc_MIN;
		}

		DC_MOTOR_Vel_Fb = CYLINDER_Dir * AS5600_RPM_Get();

	#elif   (System_Mode  == 'D')
		DC_MOTOR_Vel = CYLINDER_PI_Calc();

		if(DC_MOTOR_Vel >= DC_MOTOR_Vel_MAX){
			DC_MOTOR_Vel = DC_MOTOR_Vel_MAX;
		}
		if(DC_MOTOR_Vel <= DC_MOTOR_PI_Calc_MIN){
			DC_MOTOR_Vel = DC_MOTOR_PI_Calc_MIN;
		}

		DC_MOTOR_Vel_Fb = CYLINDER_Dir * AS5600_RPM_Get();

	#else
		DC_MOTOR_Vel = 0;
	#endif

//	DC_MOTOR_Vel_Fb = AS5600_RPM_Get();
	DC_MOTOR_Vel_Fb_F = DC_MOTOR_Vel_Fb_Filter();
//	DC_MOTOR_Vel_Fb_F = DC_MOTOR_Vel_Fb;

    DC_MOTOR_PI_Err = DC_MOTOR_Vel - DC_MOTOR_Vel_Fb_F;

    DC_MOTOR_P_OUT 	=					DC_MOTOR_PI_Kp * DC_MOTOR_PI_Err;
    if(DC_MOTOR_I){
        DC_MOTOR_I_OUT 	= DC_MOTOR_I_OUT  + 	DC_MOTOR_PI_Ki * DC_MOTOR_PI_Err;
    }
    DC_MOTOR_PI_OUT = DC_MOTOR_P_OUT + DC_MOTOR_I_OUT;

	if(DC_MOTOR_PI_OUT >= DC_MOTOR_PI_Calc_MAX){
		DC_MOTOR_PI_OUT = DC_MOTOR_PI_Calc_MAX;
		DC_MOTOR_I = 0;
	}
	else if(DC_MOTOR_PI_OUT <= DC_MOTOR_PI_Calc_MIN){
		DC_MOTOR_PI_OUT = DC_MOTOR_PI_Calc_MIN;
		DC_MOTOR_I = 0;
	}
	else{
		DC_MOTOR_I = 1;
	}

//	else{
//	    DC_MOTOR_P_OUT 	=					DC_MOTOR_PI_Kp * DC_MOTOR_PI_Err;
//	    DC_MOTOR_I_OUT 	= DC_MOTOR_I_OUT  + 	DC_MOTOR_PI_Ki * DC_MOTOR_PI_Err;
//	    DC_MOTOR_PI_OUT = DC_MOTOR_P_OUT + DC_MOTOR_I_OUT;
//	}

	
    DC_MOTOR_PI_data_to_monitor();

    return DC_MOTOR_PI_OUT;
}

void DC_MOTOR_PI_data_to_monitor(void){
	MyData.data_5 = (int16_t)DC_MOTOR_Vel;
//	MyData.data_6 = (int16_t)DC_MOTOR_Vel_Fb;
	MyData.data_6 = (int16_t)DC_MOTOR_Vel_Fb_F;
	MyData.data_7 = (int16_t)DC_MOTOR_PI_Err;
	MyData.data_8 = (int16_t)DC_MOTOR_PI_OUT;

}

#define  DC_MOTOR_Vel_Fb_filter_count	 8
int16_t DC_MOTOR_Vel_Fb_array_filter[DC_MOTOR_Vel_Fb_filter_count]= {0,};
int16_t DC_MOTOR_Vel_mid_f = 0;

#define FILTER_THRESHOLD 20  // ����� (� ���������) ��� ���������� ������ �������

// float DC_MOTOR_Vel_Ff_mid = 0;
float DC_MOTOR_Vel_Ff_mid_f_LAST = 0;

float DC_MOTOR_Vel_Fb_Filter(void){
	float DC_MOTOR_Vel_Ff_mid = 0;
	for(int i = 0; i < DC_MOTOR_Vel_Fb_filter_count - 1; i++){
		DC_MOTOR_Vel_Fb_array_filter[i] = DC_MOTOR_Vel_Fb_array_filter[i + 1];
		DC_MOTOR_Vel_Ff_mid += DC_MOTOR_Vel_Fb_array_filter[i];
	}
//	if(abs(DC_MOTOR_Vel_Fb) > DC_MOTOR_Vel_mid_f + 500){
	if(abs(DC_MOTOR_Vel_Fb - DC_MOTOR_Vel_mid_f) > 500){
		DC_MOTOR_Vel_Fb_array_filter[DC_MOTOR_Vel_Fb_filter_count-1] = DC_MOTOR_Vel_Ff_mid_f_LAST;
		DC_MOTOR_Vel_Ff_mid += DC_MOTOR_Vel_Ff_mid;
	}else{
		DC_MOTOR_Vel_Fb_array_filter[DC_MOTOR_Vel_Fb_filter_count-1] = DC_MOTOR_Vel_Fb;
		DC_MOTOR_Vel_Ff_mid += DC_MOTOR_Vel_Fb_array_filter[DC_MOTOR_Vel_Fb_filter_count-1];

	}



	DC_MOTOR_Vel_mid_f = DC_MOTOR_Vel_Ff_mid / DC_MOTOR_Vel_Fb_filter_count;
	DC_MOTOR_Vel_Ff_mid_f_LAST = DC_MOTOR_Vel_mid_f;

	return DC_MOTOR_Vel_mid_f;
}




void DC_MOTOR_PI_init(void){
	DC_MOTOR_Vel = 0;
	DC_MOTOR_Vel_Fb = 0;
	DC_MOTOR_PI_Err = 0;

	DC_MOTOR_P_OUT = 0;
	DC_MOTOR_I_OUT = 0;
	DC_MOTOR_PI_OUT = 0;

	CYLINDER_Dir = 0;

}



int16_t count_tim = 0, count_tim_last = 0;
//float CYLINDER_Tim_Pos = 0;

int16_t CYLINDER_GET_Pos (void){
	int16_t count_tim = TIM4->CNT; //
//	CYLINDER_Tim_Pos = count_tim;
	return count_tim;
}




float CYLINDER_Pos = 0;
float CYLINDER_Pos_Fb = 0;
float CYLINDER_Pos_Fb_F = 0;
float CYLINDER_Pos_PI_Err = 0;

float CYLINDER_P_OUT = 0;
float CYLINDER_I_OUT = 0;
float CYLINDER_PI_OUT = 0;
float CYLINDER_PI_OUT_MAX = 2000;
float CYLINDER_PI_OUT_MIN = -2000;

uint8_t  CYLINDER_I_FLAG = 1;

float CYLINDER_PI_Calc(void){
	#if   (System_Mode  == 'C')
		CYLINDER_Pos = reg_to_int16(usRegHoldingBuf[REG_MOTOR_PWM]);
	#elif   (System_Mode  == 'D')
		 CYLINDER_Pos = -0.5 * (float)Get_Trajectory();
//		CYLINDER_Pos = -1.0 * (float)Get_Trajectory();
	#else
		CYLINDER_Pos = 0;
	#endif

	CYLINDER_Pos_Fb = -1 * CYLINDER_GET_Pos();
	CYLINDER_Pos_Fb_F = CYLINDER_Pos_Fb;

    CYLINDER_Pos_PI_Err = CYLINDER_Pos - CYLINDER_Pos_Fb_F;

    CYLINDER_P_OUT 	=						CYLINDER_PI_Kp * CYLINDER_Pos_PI_Err;
    if(CYLINDER_I_FLAG){
    	CYLINDER_I_OUT 	= CYLINDER_I_OUT  + 	CYLINDER_PI_Ki * CYLINDER_Pos_PI_Err;
    }
	CYLINDER_PI_OUT = CYLINDER_P_OUT + CYLINDER_I_OUT;

    if(CYLINDER_PI_OUT >= CYLINDER_PI_OUT_MAX){
    	CYLINDER_PI_OUT = CYLINDER_PI_OUT_MAX;
    	CYLINDER_I_FLAG = 0;
    }
    else if(CYLINDER_PI_OUT <= -CYLINDER_PI_OUT_MAX){
    	CYLINDER_PI_OUT = -CYLINDER_PI_OUT_MAX;
    	CYLINDER_I_FLAG = 0;
    }
    else{
    	CYLINDER_I_FLAG = 1;
    }
//    else{
//        CYLINDER_P_OUT 	=						CYLINDER_PI_Kp * CYLINDER_Pos_PI_Err;
//        CYLINDER_I_OUT 	= CYLINDER_I_OUT  + 	CYLINDER_PI_Ki * CYLINDER_Pos_PI_Err;
//        CYLINDER_PI_OUT = CYLINDER_P_OUT + CYLINDER_I_OUT;
//    }

   CYLINDER_PI_data_to_monitor();


    return CYLINDER_PI_OUT;
}

void CYLINDER_PI_data_to_monitor(void){
	// MyData.data_5 = (uint16_t)CYLINDER_Pos;
	// MyData.data_6 = (uint16_t)CYLINDER_Pos_Fb;
	// MyData.data_7 = (uint16_t)CYLINDER_Pos_PI_Err;
	// MyData.data_8 = (uint16_t)CYLINDER_PI_OUT;

	// MyData.data_9 = (uint16_t)CYLINDER_I_OUT;

	MyData.data_9  = (int16_t)CYLINDER_Pos;
	MyData.data_10 = (int16_t)CYLINDER_Pos_Fb;
//	MyData.data_11 = (int16_t)CYLINDER_P_OUT;
//	MyData.data_11 = (int16_t)CYLINDER_Pos_PI_Err;
//	MyData.data_12 = (int16_t)CYLINDER_PI_OUT;
}

//int16_t CYLINDER_Pos_Fb_array_filter[10]= {0,};


void CYLINDER_PI_init(void){
	CYLINDER_Pos = 0;
	CYLINDER_Pos_Fb = 0;
	CYLINDER_Pos_PI_Err = 0;

	CYLINDER_P_OUT = 0;
	CYLINDER_I_OUT = 0;
	CYLINDER_PI_OUT = 0;
}





void EHA_Control_System(void){
	AS5600_Callback();

	#if   (System_Mode  == 'A')
		PID_PWM = reg_to_int16(usRegHoldingBuf[REG_MOTOR_PWM]);
		PWM_Callback(PID_PWM);

	#elif   (System_Mode  == 'B')
		PID_PWM = DC_MOTOR_PI_Calc();
		PWM_Callback(PID_PWM);
		Relay_Callback();

	#elif   (System_Mode  == 'C')

		PID_PWM = DC_MOTOR_PI_Calc();
		MyData.data_4 = PID_PWM;
		if (usRegHoldingBuf[REG_START_STOP]){
		    if      (PID_PWM > CYLINDER_Sign_Lim) {CYLINDER_Dir = 1;}
		    else if (PID_PWM < -CYLINDER_Sign_Lim){CYLINDER_Dir = -1;}
		    else                                  {CYLINDER_Dir = 0;}

			if (PID_PWM > PID_PWM_MIN) {
				OUT_PID_PWM = PID_PWM;
				Relay_1_OFF;
				Relay_4_ON;
				#if (Accum_status == 'A')
					Relay_2_ON;
					Relay_3_OFF;
				#endif
				MyData.data_12 = 1000;
			}
			else if (PID_PWM < -PID_PWM_MIN){
				OUT_PID_PWM = -PID_PWM;
				Relay_1_ON;
				Relay_4_OFF;
				#if (Accum_status == 'A')
					Relay_2_OFF;
					Relay_3_ON;
				#endif
				MyData.data_12 = -1000;
			}
			else{
				OUT_PID_PWM = 0;
				Relay_1_OFF;
				Relay_4_OFF;
				#if (Accum_status == 'A')
					Relay_2_OFF;
					Relay_3_OFF;
				#endif
				MyData.data_12 = 0;
			}
		}
		else{
			OUT_PID_PWM = 0;
			Relay_init();
		}
		PWM_Callback(OUT_PID_PWM);

	#elif   (System_Mode  == 'D')
		PID_PWM = DC_MOTOR_PI_Calc();
		MyData.data_4 = PID_PWM;
		if (usRegHoldingBuf[REG_START_STOP]){

		    if      (PID_PWM > CYLINDER_Sign_Lim) {CYLINDER_Dir = 1;}
		    else if (PID_PWM < -CYLINDER_Sign_Lim){CYLINDER_Dir = -1;}
		    else                                  {CYLINDER_Dir = 0;}

			if (PID_PWM > PID_PWM_MIN) {
				OUT_PID_PWM = PID_PWM;
				Relay_1_OFF;
				Relay_4_ON;
				#if (Accum_status == 'A')
					Relay_2_OFF;
					Relay_3_ON;
				#endif
				MyData.data_12 = 1000;
			}
			else if (PID_PWM < -PID_PWM_MIN){
				OUT_PID_PWM = -PID_PWM;
				Relay_1_ON;
				Relay_4_OFF;
				#if (Accum_status == 'A')
					Relay_2_ON;
					Relay_3_OFF;
				#endif
				MyData.data_12 = -1000;
			}
			else{
				OUT_PID_PWM = 0;
				Relay_1_OFF;
				Relay_4_OFF;
				#if (Accum_status == 'A')
					Relay_2_OFF;
					Relay_3_OFF;
				#endif
				MyData.data_12 = 0;
			}
		}
		else{
			OUT_PID_PWM = 0;
			Relay_init();
		}
		PWM_Callback(OUT_PID_PWM);

		int8_t Motor_status_val = Motor_status();


	#else
		PWM_Callback(0);
	#endif
}

int32_t pos = 0;
//float pos = 0;
uint32_t pos_count = 0;
uint8_t pos_flag = 0;
uint8_t pos_stage = 0;


//#define amplitude  1000
#define amplitude  1000
#define half_amplitude  amplitude/2

#define time_0  0
#define time_1  time_0 + 1000
#define time_2  time_1 + amplitude
#define time_3  time_2 + 4000
#define time_4  time_3 + amplitude
#define time_5  time_4 + 3000
#define time_6  time_5 + half_amplitude
#define time_7  time_6 + 2000
#define time_8  time_7 + half_amplitude
#define time_9  time_8 + 3000


int32_t Get_Trajectory(void){

//	usRegHoldingBuf[24] = pos_stage;


    if (pos_flag){

        if(pos_count >=time_0 && pos_count <time_1){pos_stage = 1;}
        if(pos_count >=time_1 && pos_count <time_2){pos_stage = 2;}
        if(pos_count >=time_2 && pos_count <time_3){pos_stage = 3;}
        if(pos_count >=time_3 && pos_count <time_4){pos_stage = 4;}
        if(pos_count >=time_4 && pos_count <time_5){pos_stage = 5;}

        if(pos_count >=time_5 && pos_count <time_6){pos_stage = 6;}
        if(pos_count >=time_6 && pos_count <time_7){pos_stage = 7;}
        if(pos_count >=time_7 && pos_count <time_8){pos_stage = 8;}
        if(pos_count >=time_8 && pos_count <time_9){pos_stage = 9;}

        if(pos_count >=time_9){pos_stage = 10;}

        pos_count++;
//        mb_RegHoldBuf[24] = pos_count;

//        if (pos_stage == 1){pos = 0;}
//        if(pos_count % 2 == 0){
			switch(pos_stage)
			{
				case 1:
					pos = 0;
					break;
				case 2:
					pos = pos - 1;
					break;
				case 3:
					pos = -1 * amplitude;
//					pos = -1 * amplitude * 0.5;
					break;
				case 4:
					pos = pos + 1;
					break;
				case 5:
					pos = 0;
					break;
				case 6:
					pos = pos - 1;
					break;
				case 7:
//					pos = -1 * half_amplitude * 0.5;
					pos = -1 * half_amplitude;
					break;
				case 8:
					pos = pos + 1;
					break;
				case 9:
					pos = 0;
					break;
				case 10:
					pos_count = 0;
					pos_stage = 1;
					pos_flag = 0;
					usRegHoldingBuf[REG_START_STOP] = 0;
					break;
			}
//        }
    }

//    pos = -0.5 * pos;
//    pos = -1 * pos;

    return pos;
}


//extern uint8_t pos_flag;
int16_t  mb_plot_array_i = 0;
uint16_t start_count = 0;

uint16_t Motor_status(void){
    if(usRegHoldingBuf[REG_START_STOP] == 0)
    {
        mb_plot_array_i = 0;
        pos_flag = 0;
    }

    #if      (System_Mode == 'D')
    if(usRegHoldingBuf[REG_START_STOP] == 1){
        start_count ++;
    }
    if(start_count >2000){
        pos_flag = 1;
        start_count = 0;
    }
    #endif

    return usRegHoldingBuf[REG_START_STOP];
}
