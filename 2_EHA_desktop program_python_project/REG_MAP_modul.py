

class REG_MAP_():
    def __init__(self):
        self.REG_time = 0   # не используется // используется как небольшая заглушка, которая обновляет состояние подключения
        self.REG_ser_dev = 1  # не используется регистр под № 1 сейчас используется для GPIO
        self.REG_type_dev = 2 # не используется
        

        # self.REG_ADC_mode = 20   #режим ADC переключение между 1 и 3 
        self.REG_ADC1_mode = 20   #режим ADC переключение между AUTO и MANUAL
        self.REG_ADC1_buf_to_start_pos = 21       #перемещение в стартовую позиции буфера 
        self.REG_ADC1_d_t = 22   # задается counter для чтения ADC по времени 
        # self.REG_TIM_3_counter = 22   # задается counter для чтения ADC по времени 
        

        self.REG_ADC1_Channel_1_status = 24     #Регистры активности канала1 АЦП
        self.REG_ADC1_Channel_2_status = 25     #Регистры активности канала2 АЦП
        self.REG_ADC1_Channel_3_status = 26     #Регистры активности канала3 АЦП
        self.REG_ADC1_Channel_4_status = 27     #Регистры активности канала4 АЦП

        
        self.REG_Relay_1 = 30
        self.REG_Relay_2 = 31
        self.REG_Relay_3 = 32
        self.REG_Relay_4 = 33


        self.REG_ADC_block_size = 125 # not register, constant
        self.REG_ADC_block_len = 9 # not register, constant
        self.REG_ADC_buffer_size = self.REG_ADC_block_size * self.REG_ADC_block_len


        self.count_Cannels = 4
        self.REG_ADC1_Channel_reg = []
        self.REG_ADC1_start_reg = 1000
        self.REG_ADC1_Channel_reg.append(self.REG_ADC1_start_reg)
        for i in range(self.count_Cannels - 1):
            self.REG_ADC1_Channel_reg.append(self.REG_ADC1_Channel_reg[i] + self.REG_ADC_buffer_size)

        # self.REG_ADC1_Channel_1_reg = 1000  #ADC1   каждый 125 регистр используется для синхронизации
        # self.REG_ADC1_Channel_2_reg = self.REG_ADC1_Channel_1_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_3_reg = self.REG_ADC1_Channel_2_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_4_reg = self.REG_ADC1_Channel_3_reg + self.REG_ADC_buffer_size #ADC1
        # self.REG_ADC1_Channel_5_reg = self.REG_ADC1_Channel_4_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_6_reg = self.REG_ADC1_Channel_5_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_7_reg = self.REG_ADC1_Channel_6_reg + self.REG_ADC_buffer_size #ADC1
        # self.REG_ADC1_Channel_8_reg = self.REG_ADC1_Channel_7_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_9_reg = self.REG_ADC1_Channel_8_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_10_reg = self.REG_ADC1_Channel_9_reg + self.REG_ADC_buffer_size #ADC1
        # self.REG_ADC1_Channel_11_reg = self.REG_ADC1_Channel_10_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_12_reg = self.REG_ADC1_Channel_11_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_13_reg = self.REG_ADC1_Channel_12_reg + self.REG_ADC_buffer_size #ADC1
        # self.REG_ADC1_Channel_14_reg = self.REG_ADC1_Channel_13_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_15_reg = self.REG_ADC1_Channel_14_reg + self.REG_ADC_buffer_size  #ADC1
        # self.REG_ADC1_Channel_16_reg = self.REG_ADC1_Channel_15_reg + self.REG_ADC_buffer_size #ADC1


        self.REG_START_STOP = 50
        self.REG_MOTOR_PWM = 51

 #заглушка 
REG_MAP_object = REG_MAP_()