import csv
import pandas as pd
import matplotlib.pyplot as plt


file_name_ = "M_OSC_eksp_4_1"
file_name = file_name_ + ".csv"

TIME_array = []
P_A_array = []
P_B_array = []
SINCH_array = []

with open(file_name, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    # print(reader)
    for row in reader:
        try:
            TIME_array.append(int(row[0]))
            P_A_array.append(int(row[1]))
            P_B_array.append(int(row[2]))
            SINCH_array.append(int(row[3]))
        except:
            # print("dd")
            x = 1

# TIME_array.pop(0)
# P_A_array.pop(0)
# P_B_array.pop(0)
# SINCH_array.pop(0)

print(len(TIME_array))

P_A_array_DF = pd.DataFrame(P_A_array)
P_A_arrayMA = P_A_array_DF.rolling(window=100).mean()

P_B_array_DF = pd.DataFrame(P_B_array)
P_B_arrayMA = P_B_array_DF.rolling(window=100).mean()

# plt.plot(P_A_arrayMA)
# plt.plot(P_B_arrayMA)
# 
# plt.show()



P_A_array_2 = P_A_arrayMA.values.tolist()
P_B_array_2 = P_B_arrayMA.values.tolist()



header = ['time', 'ADC1_Channel_1', 'ADC1_Channel_2', 'ADC1_Channel_3', 'ADC1_Channel_4']


file_name_new = file_name_ + "new.csv"

with open(file_name_new, 'w') as f:
    writer = csv.writer(f, delimiter=';')           
    writer.writerow(header)


    len_array = len(TIME_array)


    for i in range(len_array):

        data1 = P_A_array_2[i][0]
        data2 = P_B_array_2[i][0]
        data3 = SINCH_array[i]

        data4 = 0


        row = [i, data1, data2, data3, data4]
        writer.writerow(row)