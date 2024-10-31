import csv

file_name_array = ["exp_data_1_1", "exp_data_1_2", "exp_data_1_3", "exp_data_1_4", 
                   "exp_data_2_1", "exp_data_2_2", "exp_data_2_3", "exp_data_2_4", 
                   "exp_data_3_1", "exp_data_3_2", "exp_data_3_3", "exp_data_3_4", 
                   "exp_data_4_1", "exp_data_4_2", "exp_data_4_3", "exp_data_4_4"]

file_name_ = file_name_array[2]
file_path = "../DATA_Experiment/"
file_name = file_path + file_name_ + ".csv"

test_array = [0] * 10   # окно значений для проверки одинаковых данных
time_array = []         # временные метки для одинаковых значений
time_diapazon = []      # диапазоны времени, где данные не менялись
count = 0               # счётчик строк

with open(file_name, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    next(reader)  # пропускаем заголовок (если он есть)
    for row in reader:
        count += 1

        # Сдвиг значений в test_array и добавление нового значения из CSV
        if count >= len(test_array):
            for i in range(len(test_array) - 1):
                test_array[i] = test_array[i + 1]
            test_array[-1] = row[2]  # новое значение для анализа

        # Проверка, является ли row[0] числом, и добавление его в time_array
        try:
            timestamp = int(row[0])
            if all(numb == test_array[0] for numb in test_array):
                time_array.append(timestamp)
        except ValueError:
            # Пропускаем строку, если row[0] не является числом
            continue

print(time_array)

# # Формирование временных диапазонов на основе последовательных значений в time_array
# if time_array:
#     start_time = time_array[0]  # начало первого диапазона

#     for i in range(1, len(time_array)):
#         # Если текущая временная метка не является последовательной, закрываем диапазон
#         if time_array[i] - time_array[i - 1] != 1:
#             time_diapazon.append((start_time, time_array[i - 1]))  # добавляем диапазон (начало, конец)
#             start_time = time_array[i]  # начинаем новый диапазон
#     # Добавляем последний диапазон
#     time_diapazon.append((start_time, time_array[-1]))

# # Вывод результатов
# print("Количество элементов в time_array:", len(time_array))
# print("time_array:", time_array)

# print("Количество диапазонов в time_diapazon:", len(time_diapazon))
# print("time_diapazon:", time_diapazon)
