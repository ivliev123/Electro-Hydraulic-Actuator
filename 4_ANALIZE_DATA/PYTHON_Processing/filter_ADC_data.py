import csv
import pandas as pd
import matplotlib.pyplot as plt

file_path = "../DATA_Experiment/"
file_name_ = "2024_09_05_test4"
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
            ADC_data_data.append(int(row[3]))
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



header = ['time', 'ADC1_Channel_1', 'ADC1_Channel_2', 'ADC1_Channel_3', 'ADC1_Channel_4']

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

        row = [i, data1, data2, data3, data4]
        writer.writerow(row)