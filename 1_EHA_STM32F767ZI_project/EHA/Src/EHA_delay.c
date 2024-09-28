/*
 * delay.c
 *
 *  Created on: 29 апр. 2024 г.
 *      Author: Ivliev
 */

#include <EHA_delay.h>

extern TIM_HandleTypeDef htim10;


void TimerDelay_Init(void)
{
//	uint16_t gu32_ticks = (HAL_RCC_GetHCLKFreq() / 1000000);
//	uint16_t gu32_ticks = 108;
//	uint16_t gu32_ticks = 216;
	uint16_t gu32_ticks = 180;
	htim10.Instance = TIM10;
	htim10.Init.Prescaler = gu32_ticks-1;
	htim10.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim10.Init.Period = 10000;
	htim10.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim10.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
	if (HAL_TIM_Base_Init(&htim10) != HAL_OK)
	{
	Error_Handler();
	}

    HAL_TIM_Base_Start(&htim10);

}


void Delay_us(uint16_t au16_us)
{
	htim10.Instance->CNT = 0;
    while (htim10.Instance->CNT < au16_us);
}


void Delay_ms(uint16_t au16_ms)
{
    while(au16_ms > 0)
    {
    	htim10.Instance->CNT = 0;
		au16_ms--;
		while (htim10.Instance->CNT < 1000);
    }
}
