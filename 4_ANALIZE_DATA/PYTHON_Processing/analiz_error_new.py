import csv

# file_name = "M_eksp_1_1.csv"
# file_name = "M_eksp_1_2.csv"
# file_name = "M_eksp_1_3.csv"
# file_name = "M_eksp_1_4.csv"


# file_name = "M_eksp_2_1.csv"
# file_name = "M_eksp_2_2.csv"
# file_name = "M_eksp_2_3.csv"
# file_name = "M_eksp_2_4.csv"


# file_name = "M_eksp_3_1.csv"
# file_name = "M_eksp_3_2.csv"
# file_name = "M_eksp_3_3.csv"
file_name = "M_eksp_3_4.csv"

# test_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
test_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
time_array = []

count = 0
with open(file_name, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    # print(reader)
    for row in reader:
        # print(row)
        count = count + 1

        if count >= len(test_array):
            for i in range(len(test_array) - 1):
                test_array[i] = test_array[i+1]
            test_array[-1] = row[2]

        result = 0

        for numb in test_array:
            if numb == test_array[0]:
                result = result + 1

        # print(result)
        if(result == len(test_array)):
            # print("tyt")
            # print(row[0])
            time_array.append(row[0])

time_diapazon = []

# print(time_array)
time_array.pop(0)
print(len(time_array))

time_array.append(test_array[0])
for i in range(len(time_array)-1):
    # print(i)
    if int(time_array[i+1]) - int(time_array[i]) != 1:
        time_diapazon.append(time_array[i+1])


print(len(time_diapazon))
print(len(time_array))

print(time_diapazon)