import csv
import pandas as pd
import matplotlib.pyplot as plt


file_name_ = "M_eksp_4_1"
file_name = file_name_ + ".csv"

TIME_array = []
VelFb_array = []

Speed_array = []


with open(file_name, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    # print(reader)
    for row in reader:
        try:
            TIME_array.append(int(row[0]))
            VelFb_array.append(int(row[4]))

        except:
            x = 1

print(len(TIME_array))

# for i in range(len(TIME_array) - 1):
#     speed = (PosFb_array[i + 1] - PosFb_array[i])/(TIME_array[i + 1] - TIME_array[i])

#     Speed_array.append(speed)

VelFb_array_DF = pd.DataFrame(VelFb_array)
VelFb_array_MA = VelFb_array_DF.rolling(window=10).mean()


# plt.plot(VelFb_array)
# plt.plot(VelFb_array_MA)
# plt.show()



Vel_array_2 = VelFb_array_MA.values.tolist()

header = ['time', 'null', 'null', 'VEL', 'VEL_filter']

file_name_new = file_name_ + "_vel.csv"

with open(file_name_new, 'w') as f:
    writer = csv.writer(f, delimiter=';')           
    writer.writerow(header)


    len_array = len(TIME_array) - 1


    for i in range(len_array):

        time = TIME_array[i]

        data1 = VelFb_array[i]
        data2 = Vel_array_2[i][0]

        row = [time, 0, 0, data1, data2,]
        writer.writerow(row)