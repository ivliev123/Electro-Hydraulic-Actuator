import csv
import scipy.io
import mat73

  

def marker_make( array):

    step_up = 1
    output_array = []
    for i in range(len(array)):
        if array[i]>= step_up:
            output_array.append(i)
            step_up = step_up + 1
            # print(output_array)
    return output_array

array_pos_1 = []  
with open("M_eksp_4_4_speed.csv", 'r') as file:
  csvreader = csv.reader(file, delimiter=';')
  for row in csvreader:
    # print(row)
    try:
        x = float(row[0])
        # print(row[0])
        array_pos_1.append(x)
    except:
        print('_')

# print(array_pos_1)
out = marker_make(array_pos_1)        

print('Markers_A_Vel4_4 =' , out )

# mat = scipy.io.loadmat('pos_1_1.mat')


# def marker_make( name):

#     data_dict = mat73.loadmat(name + '.mat')
#     # print(len(data_dict['pos'][2]))

#     time = data_dict['pos'][0]
#     pos = data_dict['pos'][1]

#     step_up = 1
#     output_array = []
#     for i in range(len(time)):
#         if time[i]>= step_up:
#             output_array.append(i)
#             step_up = step_up + 2
#             # print(output_array)
#     return output_array

# name_array = ['pos_1_1','pos_1_2','pos_1_3','pos_1_4',
#               'pos_2_1','pos_2_2','pos_2_3','pos_2_4', 
#               'pos_3_1','pos_3_2','pos_3_3','pos_3_4',
#               'pos_4_1','pos_4_2','pos_4_3','pos_4_4',]

# for i in range(len(name_array)):
#     x = marker_make(name_array[i])
#     print('Marker_' + name_array[i] + ' =' , x )

