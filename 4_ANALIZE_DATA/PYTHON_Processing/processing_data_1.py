import csv
import pandas as pd
import matplotlib.pyplot as plt


file_name_array = ["exp_data_1_1", "exp_data_1_2", "exp_data_1_3", "exp_data_1_4", 
                   "exp_data_2_1", "exp_data_2_2", "exp_data_2_3", "exp_data_2_4", 
                   "exp_data_3_1", "exp_data_3_2", "exp_data_3_3", "exp_data_3_4", 
                   "exp_data_4_1", "exp_data_4_2", "exp_data_4_3", "exp_data_4_4", 
                   "exp_data_5_1", "exp_data_5_2", "exp_data_5_3", "exp_data_5_4" ]

print(len(file_name_array))

file_name_ = "exp_data_1_1"


def processing_data(file_name_):

    file_path = "../DATA_Experiment/"
    file_name = file_path + file_name_ + ".csv"

    TIME_array = []
    ADC_data_Current = []
    ADC_data_P_A = []
    ADC_data_P_B = []
    ADC_data_data = []

    with open(file_name, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        # print(reader)
        for row in reader:
            try:
                TIME_array.append(int(row[0]))
                ADC_data_Current.append(int(row[1]))
                ADC_data_P_A.append(int(row[2]))
                ADC_data_P_B.append(int(row[3]))
                ADC_data_data.append(int(row[4]))


                EXP_Velocity_data.append(int(row[10]))
                EXP_PosRef_data.append(int(row[13]))
                EXP_PosFb_data.append(int(row[14]))
            except:
                # print("dd")
                x = 1


    print(len(TIME_array))

    ADC_data_Current_DF = pd.DataFrame(ADC_data_Current)
    ADC_data_Current_MA = ADC_data_Current_DF.rolling(window=20).mean()

    ADC_data_P_A_DF = pd.DataFrame(ADC_data_P_A)
    ADC_data_P_A_MA = ADC_data_P_A_DF.rolling(window=20).mean()

    ADC_data_P_B_DF = pd.DataFrame(ADC_data_P_B)
    ADC_data_P_B_MA = ADC_data_P_B_DF.rolling(window=20).mean()

    ADC_data_data_DF = pd.DataFrame(ADC_data_data)
    ADC_data_data_MA = ADC_data_data_DF.rolling(window=20).mean()


    ADC_data_Current_2 = ADC_data_Current_MA.values.tolist()
    ADC_data_P_A_2 = ADC_data_P_A_MA.values.tolist()
    ADC_data_P_B_2 = ADC_data_P_B_MA.values.tolist()
    ADC_data_data_2 = ADC_data_data_MA.values.tolist()

    ADC_data_P_A_2 = ADC_data_P_A_2 * 0.0625 - 0.625
    ADC_data_P_B_2 = ADC_data_P_B_2 * 0.07576 - 18.333



    header = ['EXP_Time', 'EXP_PosRef', 'EXP_PosFb', 'EXP_Pressure_A', 'EXP_Pressure_B', 'EXP_Speed', 'EXP_Velocity', 'Exp_Current']

    file_path = "../DATA_Experiment_Processed/"
    file_name_new = file_path + file_name_ + ".csv"

    with open(file_name_new, 'w') as f:
        writer = csv.writer(f, delimiter=';')           
        writer.writerow(header)


        len_array = len(TIME_array)

        for i in range(len_array):
            data1 = ADC_data_Current_2[i][0]
            data2 = ADC_data_P_A_2[i][0]
            data3 = ADC_data_P_B_2[i][0]
            data4 = ADC_data_data_2[i][0]

            data1 = ADC_data_Current_2[i][0]

            row = [i, data1, data2, data3, data4]
            writer.writerow(row)



processing_data(file_name_)
