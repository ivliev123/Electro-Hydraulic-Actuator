import csv

file_name_array = ["exp_data_1_1", "exp_data_1_2", "exp_data_1_3", "exp_data_1_4", 
                   "exp_data_2_1", "exp_data_2_2", "exp_data_2_3", "exp_data_2_4", 
                   "exp_data_3_1", "exp_data_3_2", "exp_data_3_3", "exp_data_3_4", 
                   "exp_data_4_1", "exp_data_4_2", "exp_data_4_3", "exp_data_4_4"] 
                #    "exp_data_5_1", "exp_data_5_2", "exp_data_5_3", "exp_data_5_4" ]

file_name_ = file_name_array[2]

# file_path = "../DATA_Experiment_Processed/"
file_path = "../DATA_Experiment/"
file_name = file_path + file_name_ + ".csv"


time_pass_array =  [-1.583, -0.529, -1.599, -1.566, 
                    -1.578, -1.528, -1.521, -1.586,
                    -1.550, -1.507, -1.558, -1.545,
                    -1.584, -1.515, -1.615, -1.568]

time_start = 2 

# test_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
test_array = [0] * 10
time_array = []

count = 0
with open(file_name, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    for row in reader:
        count = count + 1

        if count >= len(test_array):
            for i in range(len(test_array) - 1):
                test_array[i] = test_array[i+1]
            test_array[-1] = row[2]

        result = 0

        for numb in test_array:
            if numb == test_array[0]:
                result = result + 1

        if(result == len(test_array)):
            time_array.append(row[0])

time_diapazon = []


time_array.pop(0)
print(len(time_array))

time_array.append(test_array[0])
for i in range(len(time_array)-1):
    if int(time_array[i+1]) - int(time_array[i]) != 1:
        time_diapazon.append(time_array[i+1])



print(len(time_array))
print(time_array)

print(len(time_diapazon))
print(time_diapazon)