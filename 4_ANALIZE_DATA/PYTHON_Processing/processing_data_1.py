import csv
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


file_name_array = ["exp_data_1_1", "exp_data_1_2", "exp_data_1_3", "exp_data_1_4", 
                   "exp_data_2_1", "exp_data_2_2", "exp_data_2_3", "exp_data_2_4", 
                   "exp_data_3_1", "exp_data_3_2", "exp_data_3_3", "exp_data_3_4", 
                   "exp_data_4_1", "exp_data_4_2", "exp_data_4_3", "exp_data_4_4", 
                   "exp_data_5_1", "exp_data_5_2", "exp_data_5_3", "exp_data_5_4" ]

print(len(file_name_array))

# file_name_ = "exp_data_1_1"

def fix_some_data(file_name_, EXP_PosFb_data):

    if file_name_ == "exp_data_1_2":
        for i in range(len(EXP_PosFb_data)):

            if i >= 11798 and i<= 11893:
                EXP_PosFb_data[i] = 1 * 0.025
            if i >= 18812:
                EXP_PosFb_data[i] = -1 * 0.025


def processing_data(file_name_):

    file_path = "../DATA_Experiment/"
    file_name = file_path + file_name_ + ".csv"

    EXP_TIME_data = []
    EXP_Current_data = []
    EXP_Pressure_A_data = []
    EXP_Pressure_B_data = []
    EXP_ADC_data = []

    EXP_Velocity_data = []
    EXP_PosRef_data = []
    EXP_PosFb_data =[]

    with open(file_name, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        # print(reader)
        for row in reader:
            try:
                EXP_TIME_data.append(int(row[0]) * 0.001)
                EXP_Current_data.append(int(row[1]))
                EXP_Pressure_A_data.append(int(row[2]))
                EXP_Pressure_B_data.append(int(row[3]))
                EXP_ADC_data.append(int(row[4]))


                EXP_Velocity_data.append(int(row[10]))
                EXP_PosRef_data.append(int(row[13]) * 0.025)
                EXP_PosFb_data.append(int(row[14]) * 0.025)
            except:
                # print("dd")
                x = 1

    fix_some_data(file_name_, EXP_PosFb_data)

    print(len(EXP_TIME_data))

    EXP_Current_data_DF = pd.DataFrame(EXP_Current_data)
    EXP_Current_data_MA = EXP_Current_data_DF.rolling(window=20).mean()

    EXP_Pressure_A_data_DF = pd.DataFrame(EXP_Pressure_A_data)
    EXP_Pressure_A_data_MA = EXP_Pressure_A_data_DF.rolling(window=20).mean()

    EXP_Pressure_B_data_DF = pd.DataFrame(EXP_Pressure_B_data)
    EXP_Pressure_B_data_MA = EXP_Pressure_B_data_DF.rolling(window=60).mean()

    EXP_ADC_data_DF = pd.DataFrame(EXP_ADC_data)
    EXP_ADC_data_MA = EXP_ADC_data_DF.rolling(window=20).mean()


    EXP_Current_data_2 = EXP_Current_data_MA.values.tolist()
    EXP_Pressure_A_data_2 = EXP_Pressure_A_data_MA.values.tolist()
    EXP_Pressure_B_data_2 = EXP_Pressure_B_data_MA.values.tolist()
    EXP_ADC_data_2 = EXP_ADC_data_MA.values.tolist()

    # EXP_Pressure_A_data_2 = EXP_Pressure_A_data_2 * 0.0625 - 0.625
    # EXP_Pressure_B_data_2 = EXP_Pressure_B_data_2 * 0.07576 - 18.333


    EXP_Speed_data = []
    window = 20
    for i in range(window):
        # EXP_Speed_data.append(None)
        EXP_Speed_data.append(0.0)
    for i in range(len(EXP_TIME_data) - window):
        speed = (EXP_PosFb_data[i + window] - EXP_PosFb_data[i])/(EXP_TIME_data[i + window] - EXP_TIME_data[i])

        EXP_Speed_data.append(speed)

    EXP_Speed_data_DF = pd.DataFrame(EXP_Speed_data)
    EXP_Speed_data_MA = EXP_Speed_data_DF.rolling(window=100).mean()

    EXP_Speed_data_2 = EXP_Speed_data_MA.values.tolist()



    header = ['EXP_Time', 'EXP_PosRef', 'EXP_PosFb', 'EXP_Pressure_A', 'EXP_Pressure_B', 'EXP_Speed', 'EXP_Velocity', 'Exp_Current']

    file_path = "../DATA_Experiment_Processed/"
    file_name_new = file_path + file_name_ + ".csv"

    with open(file_name_new, 'w') as f:
        writer = csv.writer(f, delimiter=';')           
        writer.writerow(header)


        len_array = len(EXP_TIME_data)

        print(EXP_Pressure_A_data_2[0][0])

        for i in range(len_array):
            EXP_TIME_data_OUT           = "{:.3f}".format(EXP_TIME_data[i])
            EXP_PosRef_OUT              = "{:.3f}".format(EXP_PosRef_data[i])
            EXP_PosFb_OUT               = "{:.3f}".format(EXP_PosFb_data[i])
            EXP_Pressure_A_data_OUT     = "{:.3f}".format(EXP_Pressure_A_data_2[i][0] * 0.0625 - 0.625)
            EXP_Pressure_B_data_OUT     = "{:.3f}".format(EXP_Pressure_B_data_2[i][0] * 0.07576 - 18.333)
            EXP_Speed_data_OUT          = "{:.3f}".format(EXP_Speed_data_2[i][0])
            EXP_Velocity_data_OUT       = "{:.3f}".format(EXP_Velocity_data[i])
            EXP_Current_data_OUT        = "{:.3f}".format(EXP_Current_data_2[i][0])
            # EXP_ADC_data_OUT = EXP_ADC_data_2[i][0]

            EXP_TIME_data_OUT           = "{:.3f}".format(0.000) if np.isnan(float(EXP_TIME_data_OUT      ))   else EXP_TIME_data_OUT       
            EXP_PosRef_OUT              = "{:.3f}".format(0.000) if np.isnan(float(EXP_PosRef_OUT         ))   else EXP_PosRef_OUT          
            EXP_PosFb_OUT               = "{:.3f}".format(0.000) if np.isnan(float(EXP_PosFb_OUT          ))   else EXP_PosFb_OUT           
            EXP_Pressure_A_data_OUT     = "{:.3f}".format(0.000) if np.isnan(float(EXP_Pressure_A_data_OUT))   else EXP_Pressure_A_data_OUT 
            EXP_Pressure_B_data_OUT     = "{:.3f}".format(0.000) if np.isnan(float(EXP_Pressure_B_data_OUT))   else EXP_Pressure_B_data_OUT 
            EXP_Speed_data_OUT          = "{:.3f}".format(0.000) if np.isnan(float(EXP_Speed_data_OUT     ))   else EXP_Speed_data_OUT      
            EXP_Velocity_data_OUT       = "{:.3f}".format(0.000) if np.isnan(float(EXP_Velocity_data_OUT  ))   else EXP_Velocity_data_OUT   
            EXP_Current_data_OUT        = "{:.3f}".format(0.000) if np.isnan(float(EXP_Current_data_OUT   ))   else EXP_Current_data_OUT    
    
            row = [EXP_TIME_data_OUT, EXP_PosRef_OUT, EXP_PosFb_OUT, 
                   EXP_Pressure_A_data_OUT, EXP_Pressure_B_data_OUT, 
                   EXP_Speed_data_OUT, EXP_Velocity_data_OUT, EXP_Current_data_OUT]
            # row = [i, data1, data2, data3, data4]
            writer.writerow(row)

for file_name_ in file_name_array:
    processing_data(file_name_)
