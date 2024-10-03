
from PyQt5.QtWidgets import (QWidget, QLabel, QPushButton, QApplication,
    QLineEdit, QMainWindow, QAction, qApp, QVBoxLayout, QHBoxLayout, QGridLayout,
    QTabWidget,
    QTextEdit,
    QAction, QFileDialog, 
    QGroupBox, QSizePolicy, QSpacerItem,
    QCheckBox,
    QRadioButton, QButtonGroup)
from PyQt5.QtGui import QPixmap, QColor, QIcon, QFont
from PyQt5.QtCore import QCoreApplication, QTimer, QSize, QObject, QThread, pyqtSignal
import PyQt5

from PyQt5.QtCore import pyqtSignal, pyqtSlot


from threading import Thread, Event


from pymodbus.constants import Endian
from pymodbus.payload import BinaryPayloadDecoder
from pymodbus.payload import BinaryPayloadBuilder
from pymodbus.client import ModbusSerialClient
import time
from datetime import datetime
import struct
import sys, csv




import copy

# import MAIN_WIND
import COM_modul
import REG_MAP_modul

import pyqtgraph as pg
import numpy as np


class ADC_Worker(QObject):
    # def __init__(self):
        
    finished = pyqtSignal()
    progress = pyqtSignal(int)
    plot_callback = pyqtSignal(list)

    ADC_num_block_reg_array_last = 0
    ADC_num_block_reg_array_now = 0

    COM_use = COM_modul.COM_object

    def __init__(self, ADC_, ADC_count, ADC_chanal_state_value):

        super().__init__()
        print(ADC_count)
        self.ADC_ = ADC_
        self.ADC_count = ADC_count

        self.ADC_chanal_state_value = ADC_chanal_state_value

        self.REG_ADC_block_len = REG_MAP_modul.REG_MAP_object.REG_ADC_block_len

        len_plot = REG_MAP_modul.REG_MAP_object.count_Cannels
        self.result_error_value = [False] * len_plot


        self.start_flag = None

        self.ADC_count_read = 0
        self.ADC_flag_first_read = 0

        self.ADC1_Channel_array_plot = [[],[],[],[], [],[],[],[], [],[],[],[], [],[],[],[] ]

        COM_use = COM_modul.COM_object



    # def run(self, callback, threadkill):
    def run(self):
        # print((self.ADC_.thread_status))
        # if (self.ADC_.thread_status):
        """Long-running task."""

        self.ADC1_Channel_reg = REG_MAP_modul.REG_MAP_object.REG_ADC1_Channel_reg
        self.ADC_block_size = REG_MAP_modul.REG_MAP_object.REG_ADC_block_size
        self.REG_ADC1_start_reg = REG_MAP_modul.REG_MAP_object.REG_ADC1_start_reg



        size_rx = self.ADC_block_size

        self.ADC_num_block_for_read = 0
        self.i = 0

        len_plot = REG_MAP_modul.REG_MAP_object.count_Cannels


        # заглушка нужно будет както реализовать чтение несколько раз если не считывается
        try: 
            ADC_num_block_for_read_reg = self.REG_ADC1_start_reg + self.ADC_block_size - 1
            result_ = self.COM_use.client.read_holding_registers(ADC_num_block_for_read_reg, 1)
            self.start_flag = result_.isError()
            if result_.isError() == False :                     #вот тут поработать с 4-й
                self.ADC_num_block_for_read = (result_.registers[0] - 4 + self.REG_ADC_block_len) % self.REG_ADC_block_len +1
                print('---------------' + str(self.ADC_num_block_for_read))
                    
            else:
                self.ADC_num_block_for_read = 0

            print("Старт чтения данных ADC")
        except:
            print("Ошибка чтения данных ADC. Проверьте подключение, id устройства и повторите попытку")
        

        if self.start_flag == False:
            while self.i < self.ADC_count :
                try:
                # if 1:
                    r_num_ = []
                    for i in range(len_plot):
                        r_ = self.ADC1_Channel_reg[i] + (self.ADC_num_block_for_read-1)*size_rx
                        r_num_.append(r_)

                    result_array = []
                    time_array = []
                    t1 = time.time()
                    for i in range(len_plot):
                        if self.ADC_chanal_state_value[i]:
                            # t1 = time.time()
                            result = self.COM_use.client.read_holding_registers(r_num_[i], size_rx)
                            result_array.append(result)
                            self.result_error_value[i] = result.isError()
                            if self.result_error_value[i] == False:
                                self.ADC_num_block_reg_array_now = result.registers[124]
                    #         print(i, self.ADC_num_block_reg_array_now)
                    #         t2 = time.time() 
                            # time_array.append(t2-t1)
                    # print(sum(time_array)/len(time_array))
                    # print(time.time() - t1)

                    # t1 = time.time()
                    if( all(self.result_error_value) == False):
                        self.progress.emit(self.ADC_count - self.i )


                        if self.ADC_flag_first_read == 1:
                            d_num = (self.ADC_num_block_reg_array_now + self.REG_ADC_block_len - self.ADC_num_block_reg_array_last) % self.REG_ADC_block_len
                            self.ADC_count_read = self.ADC_count_read +  d_num
                            self.ADC_num_block_reg_array_last = self.ADC_num_block_reg_array_now


                        if (self.ADC_count_read > 0 or self.ADC_flag_first_read == 0):
                            self.ADC_flag_first_read = 1
                            self.ADC_count_read = self.ADC_count_read - 1
                            self.ADC_num_block_reg_array_last = self.ADC_num_block_reg_array_now
                            self.i  = self.i + 1

                            self.ADC_num_block_for_read = (self.ADC_num_block_for_read % self.REG_ADC_block_len) + 1

                            # t1 = time.time()
                            # self.plot_callback.emit(result_array)
                            # print(time.time() - t1)

                            # t1 = time.time()
                            result_array_int16_t = [[],[],[],[], [],[],[],[], [],[],[],[], [],[],[],[] ]
                            for i in range(len_plot):
                                # self.ADC1_Channel_array_plot.append([])
                                for r in range(size_rx - 1):
                                    if self.ADC_chanal_state_value[i]:
                                        decoder = BinaryPayloadDecoder.fromRegisters([result_array[i].registers[r]], byteorder=Endian.BIG, wordorder=Endian.LITTLE)
                                        data  = decoder.decode_16bit_int()
                                        # data = result_array[i].registers[r]
                                        self.ADC1_Channel_array_plot[i].append(data)
                                        result_array_int16_t[i].append(data)
                            self.plot_callback.emit(result_array_int16_t)

                    # print(time.time() - t1)

                except Exception as e: 
                    print(e)

            self.finished.emit()        
        else:
            self.finished.emit()




class ADC_(QMainWindow):


    data_acquired = pyqtSignal(np.ndarray)



    def __init__(self, MainWindow):
        super().__init__()

        self.REG_ADC_block_len = REG_MAP_modul.REG_MAP_object.REG_ADC_block_len

        self.REG_ADC1_mode = REG_MAP_modul.REG_MAP_object.REG_ADC1_mode
        self.REG_ADC1_buf_to_start_pos = REG_MAP_modul.REG_MAP_object.REG_ADC1_buf_to_start_pos
        self.REG_ADC1_d_t = REG_MAP_modul.REG_MAP_object.REG_ADC1_d_t


        self.MainWindow = MainWindow

        self.COM_use = COM_modul.COM_object

        self.ADC_num_block_reg_array_last = 0
        self.ADC_num_block_reg_array_now = 0
        self.i = 0

        self.ADC_count = 0
        self.ADC_set_count_read_value = 0
        self.ADC1_mode_value = 0
        self.ADC_d_t_value = 0


        self.value = 0


        self.Plot_Flow = pg.plot(title="Plot_Flow")
        self.Plot_Flow.setRange(yRange=[0, 4000])
        self.Plot_Flow.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Temperature = pg.plot(title="Plot_Temperature")
        self.Plot_Temperature.setRange(yRange=[0, 4000])
        self.Plot_Temperature.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Pressure_1 = pg.plot(title="Plot_Pressure_1")
        self.Plot_Pressure_1.setRange(yRange=[0, 4000])
        self.Plot_Pressure_1.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Pressure_2 = pg.plot(title="Plot_Pressure_2")
        self.Plot_Pressure_2.setRange(yRange=[0, 4000])
        self.Plot_Pressure_2.showGrid(x=True, y=True, alpha=0.8)



        self.ADC1_Channel_array_plot = [[],[],[],[], [],[],[],[], [],[],[],[], [],[],[],[] ]



        self.n_data = 2000
        self.xdata = list(range(self.n_data))

        len_plot = REG_MAP_modul.REG_MAP_object.count_Cannels


        self.ydata = []
        self.array_124 = []
        for i in range(len_plot):
            self.ydata.append([0] * self.n_data)
            self.array_124.append([])

        self.line = []
        self.pen_array = ['r', 'g', 'b', 'y']

        for i in range(4):
            self.line.append(self.Plot_Flow.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Temperature.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Pressure_1.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Pressure_2.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))

        # self.thread_status = False
        # self.init_thread()

        self.ADC_UI()



    def ADC_UI(self):


        ADC_width = 200
        ADC_hidht = 25

        font = QFont()
        font.setPointSize(8)

        # ############################################################

        self.ADC_widget = QWidget()
        self.ADC_widget.setObjectName("ADC_widget")
        self.ADC_gridLayout = QGridLayout(self.ADC_widget)
        self.ADC_gridLayout.setObjectName("ADC_gridLayout")



        ########

        self.ADC_groupBox = QGroupBox(self.ADC_widget)
        self.ADC_groupBox.setMaximumSize(QSize(340, 600))
        # self.ADC_groupBox.setObjectName("ADC_groupBox")
        # self.ADC_groupBox.setTitle("ADC панель")

        self.ADC_panel_gridLayout = QGridLayout(self.ADC_groupBox)
        self.ADC_panel_gridLayout.setObjectName("ADC_panel_gridLayout")



        self.ADC_count_groupBox = QGroupBox(self.ADC_groupBox)
        self.ADC_count_groupBox.setMaximumSize(QSize(320, 200))

        self.ADC_count_gridLayout = QGridLayout(self.ADC_count_groupBox)
        self.ADC_count_gridLayout.setObjectName("ADC_count_gridLayout")

        self.ADC_line_edit_set_count_read = QLineEdit(self.ADC_count_groupBox)
        self.ADC_line_edit_set_count_read.setPlaceholderText("Ввести количество читаемых посылок") 
        self.ADC_line_edit_set_count_read.resize(ADC_width, ADC_hidht)
        self.ADC_line_edit_set_count_read.textChanged[str].connect(self.onChanged_ADC_line_edit_set_count_read)
        self.ADC_count_gridLayout.addWidget(self.ADC_line_edit_set_count_read, 0, 0, 1, 1)

        self.ADC_button_set_count_read = QPushButton(self.ADC_count_groupBox)
        self.ADC_button_set_count_read.setText("Задать количество читаемых посылок")
        self.ADC_button_set_count_read.resize(ADC_width, ADC_hidht)
        self.ADC_button_set_count_read.clicked.connect(self.ADC_set_count_read)
        self.ADC_button_set_count_read.setIcon(QIcon('icons/counter.png'))
        self.ADC_count_gridLayout.addWidget(self.ADC_button_set_count_read, 1, 0, 1, 1)



        self.ADC_revers_count_timer_label = QLabel(self.ADC_count_groupBox)
        self.ADC_revers_count_timer_label.setFont(font)
        self.ADC_revers_count_timer_label.setText("Обратный счетчик")
        self.ADC_count_gridLayout.addWidget(self.ADC_revers_count_timer_label, 2, 0, 1, 1)

        self.ADC_revers_count_timer_line_edit = QLineEdit(self.ADC_count_groupBox)
        self.ADC_revers_count_timer_line_edit.setStyleSheet('background : #bbb; ')
        self.ADC_revers_count_timer_line_edit.setPlaceholderText('0')
        self.ADC_revers_count_timer_line_edit.setReadOnly(1)
        self.ADC_count_gridLayout.addWidget(self.ADC_revers_count_timer_line_edit, 3, 0, 1, 1)

        self.ADC_read_data_from_modbus_button = QPushButton(self.ADC_count_groupBox)
        self.ADC_read_data_from_modbus_button.setText("Запустить чтение данных")
        self.ADC_read_data_from_modbus_button.clicked.connect(self.run_ADC_read_data_from_modbus)
        self.ADC_read_data_from_modbus_button.setIcon(QIcon('icons/video-play-button.png'))
        self.ADC_count_gridLayout.addWidget(self.ADC_read_data_from_modbus_button, 4, 0, 1, 1)


        self.ADC_write_data_to_file_button = QPushButton(self.ADC_groupBox)
        self.ADC_write_data_to_file_button.setText("Сохранить данные в файл")
        self.ADC_write_data_to_file_button.resize(ADC_width, ADC_hidht)
        self.ADC_write_data_to_file_button.clicked.connect(self.ADC_write_data_to_file)
        self.ADC_write_data_to_file_button.setIcon(QIcon('icons/save.png'))
        self.ADC_panel_gridLayout.addWidget(self.ADC_write_data_to_file_button, 5, 0, 1, 1)


        self.ADC_panel_gridLayout.addWidget(self.ADC_count_groupBox, 2, 0, 1, 1)

        # кнопки
        self.Button_groupBox = QGroupBox(self.ADC_groupBox)
        # self.Button_groupBox.setMaximumSize(QSize(320, 300))
        self.Button_groupBox.setMinimumSize(QSize(320, 95))

        self.Button_gridLayout = QGridLayout(self.Button_groupBox)
        self.Button_gridLayout.setObjectName("Button_gridLayout")

        self.btn_start = QPushButton('', self.ADC_groupBox)
        self.btn_start.clicked.connect(self.start)
        self.btn_start.setStyleSheet("background-color: green")
        self.btn_start.setToolTip('старт')
        self.btn_start.setMinimumSize(QSize(75, 75))
        self.btn_start.setMaximumSize(QSize(75, 75))
        self.Button_gridLayout.addWidget(self.btn_start, 0, 0, 2, 1)


        self.btn_stop = QPushButton('', self.ADC_groupBox)
        self.btn_stop.clicked.connect(self.stop)
        self.btn_stop.setStyleSheet("background-color: red")
        self.btn_stop.setToolTip('стоп')
        self.btn_stop.setMinimumSize(QSize(75, 75))
        self.btn_stop.setMaximumSize(QSize(75, 75))

        self.Button_gridLayout.addWidget(self.btn_stop, 0, 2, 2, 1)

        self.line_edit_1 = QLineEdit(self.ADC_groupBox)
        self.line_edit_1.setMinimumSize(QSize(100, 35))
        self.line_edit_1.textChanged[str].connect(self.onChanged_Setup)
        self.Button_gridLayout.addWidget(self.line_edit_1, 0, 1, 1, 1)

        self.ConnectButton = QPushButton(self.ADC_groupBox)
        self.ConnectButton.setText("Задать ")
        self.ConnectButton.setMinimumSize(QSize(100, 35))
        self.ConnectButton.clicked.connect(self.set_value)
        self.Button_gridLayout.addWidget(self.ConnectButton, 1, 1, 1, 1)


        self.ADC_panel_gridLayout.addWidget(self.Button_groupBox, 6, 0, 1, 1)
# кнопки

# Кнопки Реле

        self.Relay_Button_groupBox = QGroupBox(self.ADC_groupBox)
        # self.Button_groupBox.setMaximumSize(QSize(320, 300))
        self.Relay_Button_groupBox.setMinimumSize(QSize(320, 250))
        
        self.Relay_Button_gridLayout = QGridLayout(self.Relay_Button_groupBox)
        self.Relay_Button_gridLayout.setObjectName("Relay_Button_groupBox")


        self.R1_ON_button = QPushButton(self.Relay_Button_groupBox)
        self.R1_ON_button.setText("R1__ON")
        self.R1_ON_button.resize(ADC_width, ADC_hidht)
        self.R1_ON_button.setMinimumSize(QSize(100, 35))
        self.R1_ON_button.clicked.connect(self.R1_ON)
        self.Relay_Button_gridLayout.addWidget(self.R1_ON_button, 1, 0, 1, 1)

        self.R2_ON_button = QPushButton(self.Relay_Button_groupBox)
        self.R2_ON_button.setText("R2__ON")
        self.R2_ON_button.resize(ADC_width, ADC_hidht)
        self.R2_ON_button.setMinimumSize(QSize(100, 35))
        self.R2_ON_button.clicked.connect(self.R2_ON)
        self.Relay_Button_gridLayout.addWidget(self.R2_ON_button, 2, 0, 1, 1)

        self.R3_ON_button = QPushButton(self.Relay_Button_groupBox)
        self.R3_ON_button.setText("R3__ON")
        self.R3_ON_button.resize(ADC_width, ADC_hidht)
        self.R3_ON_button.setMinimumSize(QSize(100, 35))
        self.R3_ON_button.clicked.connect(self.R3_ON)
        self.Relay_Button_gridLayout.addWidget(self.R3_ON_button, 3, 0, 1, 1)

        self.R4_ON_button = QPushButton(self.Relay_Button_groupBox)
        self.R4_ON_button.setText("R4__ON")
        self.R4_ON_button.resize(ADC_width, ADC_hidht)
        self.R4_ON_button.setMinimumSize(QSize(100, 35))
        self.R4_ON_button.clicked.connect(self.R4_ON)
        self.Relay_Button_gridLayout.addWidget(self.R4_ON_button, 4, 0, 1, 1)

        self.R1_OFF_button = QPushButton(self.Relay_Button_groupBox)
        self.R1_OFF_button.setText("R1__OFF")
        self.R1_OFF_button.resize(ADC_width, ADC_hidht)
        self.R1_OFF_button.setMinimumSize(QSize(100, 35))
        self.R1_OFF_button.clicked.connect(self.R1_OFF)
        self.Relay_Button_gridLayout.addWidget(self.R1_OFF_button, 1, 1, 1, 1)

        self.R2_OFF_button = QPushButton(self.Relay_Button_groupBox)
        self.R2_OFF_button.setText("R2__OFF")
        self.R2_OFF_button.resize(ADC_width, ADC_hidht)
        self.R2_OFF_button.setMinimumSize(QSize(100, 35))
        self.R2_OFF_button.clicked.connect(self.R2_OFF)
        self.Relay_Button_gridLayout.addWidget(self.R2_OFF_button, 2, 1, 1, 1)

        self.R3_OFF_button = QPushButton(self.Relay_Button_groupBox)
        self.R3_OFF_button.setText("R3__OFF")
        self.R3_OFF_button.resize(ADC_width, ADC_hidht)
        self.R3_OFF_button.setMinimumSize(QSize(100, 35))
        self.R3_OFF_button.clicked.connect(self.R3_OFF)
        self.Relay_Button_gridLayout.addWidget(self.R3_OFF_button, 3, 1, 1, 1)

        self.R4_OFF_button = QPushButton(self.Relay_Button_groupBox)
        self.R4_OFF_button.setText("R4__OFF")
        self.R4_OFF_button.resize(ADC_width, ADC_hidht)
        self.R4_OFF_button.setMinimumSize(QSize(100, 35))
        self.R4_OFF_button.clicked.connect(self.R4_OFF)
        self.Relay_Button_gridLayout.addWidget(self.R4_OFF_button, 4, 1, 1, 1)

        # self.ADC_panel_gridLayout.addWidget(self.Relay_Button_groupBox, 7, 0, 1, 1)
# Кнопки Реле


        spacerItem = QSpacerItem(20, 40, QSizePolicy.Maximum, QSizePolicy.Expanding)
        self.ADC_panel_gridLayout.addItem(spacerItem, 9, 0, 1, 1)       #автозаполнение пустого пространства
        self.ADC_gridLayout.addWidget(self.ADC_groupBox, 0, 0, 1, 1)


        self.ADC_groupBox_add = QGroupBox(self.ADC_widget)
        self.ADC_groupBox_add.setMaximumSize(QSize(340, 600))
        # self.ADC_groupBox_add.setTitle("ADC доп. панель")

        self.ADC_panel_add_gridLayout = QGridLayout(self.ADC_groupBox_add)
        self.ADC_panel_add_gridLayout.setObjectName("ADC_panel_add_gridLayout")

        self.ADC_panel_add_gridLayout.addWidget(self.Relay_Button_groupBox, 0, 0, 1, 1)



        # self.ADC_file_line = QLineEdit(self.ADC_groupBox_add)
        # self.ADC_file_line.resize(ADC_width, ADC_hidht)
        # self.ADC_file_line.setStyleSheet('background : #ddd; ')
        # self.ADC_file_line.setReadOnly(1)
        # self.ADC_panel_add_gridLayout.addWidget(self.ADC_file_line, 1, 0, 1, 1)
        
        # self.ADC_get_data_button = QPushButton(self.ADC_groupBox_add)
        # self.ADC_get_data_button.setText("Выбрать файл")
        # self.ADC_get_data_button.resize(ADC_width, ADC_hidht)
        # # self.ADC_get_data_button.clicked.connect(self.ADC_read_data_from_file)
        # self.ADC_get_data_button.setIcon(QIcon('icons/open-folder.png'))



        # self.ADC_panel_add_gridLayout.addWidget(self.ADC_get_data_button, 2, 0, 1, 1)

        spacerItem = QSpacerItem(20, 40, QSizePolicy.Maximum, QSizePolicy.Expanding)
        self.ADC_panel_add_gridLayout.addItem(spacerItem, 3, 0, 1, 1)       #автозаполнение пустого пространства


        self.ADC_gridLayout.addWidget(self.ADC_groupBox_add, 1, 0, 1, 1)


        # self.ADC_gridLayout.addWidget(self.Plot_1, 0, 1, 2, 1)

        self.ADC_gridLayout.addWidget(self.Plot_Flow,           0, 1, 1, 1)
        self.ADC_gridLayout.addWidget(self.Plot_Temperature,    1, 1, 1, 1)
        self.ADC_gridLayout.addWidget(self.Plot_Pressure_1,     0, 2, 1, 1)
        self.ADC_gridLayout.addWidget(self.Plot_Pressure_2,     1, 2, 1, 1)


# функции панели по управлению двигателем

    def start(self):
        reg = [1]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_START_STOP, reg)
        print(write_result)

    def stop(self):
        reg = [0]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_START_STOP, reg)
        print(write_result)

    def set_value(self):
        builder = BinaryPayloadBuilder(byteorder=Endian.BIG, wordorder=Endian.LITTLE)
        builder.add_16bit_int(round(self.value))
        registers = builder.to_registers()
        # reg = round(self.value)
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_MOTOR_PWM, registers)
        print(write_result)

    def onChanged_Setup(self, text):
        try:
            self.value = float(text)
            self.line_edit_1.setStyleSheet('background : #ffffff; ')
        except ValueError:
            self.line_edit_1.setStyleSheet('background : #ff4000; ')
            print("ValueError")

# функции панели по управлению двигателем


# Функции РЕЛЕ
    def R1_ON(self):
        reg = [1]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_1, reg)
    def R2_ON(self):
        reg = [1]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_2, reg)
    def R3_ON(self):
        reg = [1]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_3, reg)
    def R4_ON(self):
        reg = [1]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_4, reg)

    def R1_OFF(self):
        reg = [0]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_1, reg)
    def R2_OFF(self):
        reg = [0]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_2, reg)
    def R3_OFF(self):
        reg = [0]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_3, reg)
    def R4_OFF(self):
        reg = [0]
        write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_Relay_4, reg)
# Функции РЕЛЕ

    def run_ADC_read_data_from_modbus(self):
        if self.COM_use.connect_status:

            # reg = [1]
            # write_result = self.COM_use.client.write_registers(REG_MAP_modul.REG_MAP_object.REG_START_STOP, reg)
            # print(write_result)

            if (self.ADC1_mode_value == 0):

                # write_result = self.COM_use.client.write_registers(50, 1)

                # Step 2: Create a QThread object
                self.thread = QThread()
                # Step 3: Create a worker object

                len_plot = REG_MAP_modul.REG_MAP_object.count_Cannels
                self.ADC_chanal_state_value = [1]*len_plot

                self.worker = ADC_Worker(self, self.ADC_count, self.ADC_chanal_state_value)
                
                self.worker.ADC1_Channel_1_array = []
                self.worker.ADC1_Channel_2_array = []
                self.worker.ADC1_Channel_3_array = []
                self.worker.ADC1_Channel_4_array = []

                # Step 4: Move worker to the thread
                self.worker.moveToThread(self.thread)
                # Step 5: Connect signals and slots
                self.thread.started.connect(self.worker.run)
                self.worker.finished.connect(self.thread.quit)


                self.worker.finished.connect(self.worker.deleteLater)
                self.thread.finished.connect(self.thread.deleteLater)
                self.worker.progress.connect(self.reportProgress)

                self.worker.plot_callback.connect(self.update_data)
                # Step 6: Start the thread
                self.thread.start()

                # Final resets
                self.ADC_read_data_from_modbus_button.setEnabled(False)
                # self.ADC_submit_chanls_button.setEnabled(False)

                self.thread.finished.connect(
                    lambda: self.ADC_read_data_from_modbus_button.setEnabled(True)
                )
                # self.thread.finished.connect(
                #     lambda: self.ADC_submit_chanls_button.setEnabled(True)
                # )
                self.thread.finished.connect(
                    lambda: self.ADC_revers_count_timer_line_edit.setPlaceholderText(str(self.ADC_count))
                )
                self.thread.finished.connect(
                    lambda: self.finish_ADC_read_data_from_modbus()
                )


    def update_data(self, array):
        len_plot = REG_MAP_modul.REG_MAP_object.count_Cannels
        # print('ttt')
        for i in range(len_plot):
            # self.array_124[i] = array[i].registers[0:124]
            self.array_124[i] = array[i][0:124]
            self.ydata[i] = self.ydata[i][124:] + self.array_124[i]
            self.line[i].setData(self.ydata[i])


    def reportProgress(self, n):
        # self.stepLabel.setText(f"Long-Running Step: {n}")
        self.ADC_revers_count_timer_line_edit.setPlaceholderText(f"{n}")

    def finish_ADC_read_data_from_modbus(self):
        # len_ = [len(self.worker.ADC1_Channel_1_array), len(self.worker.ADC1_Channel_2_array), len(self.worker.ADC1_Channel_3_array), len(self.worker.ADC1_Channel_4_array)]
        # print(len_)
        # max_len_ = max(len_)
        max_len_ = len(self.worker.ADC1_Channel_array_plot[0])
        time_line= np.linspace(0, max_len_, max_len_)  # заглушка

        self.ADC1_Channel_array_plot = copy.copy(self.worker.ADC1_Channel_array_plot)


        # self.ADC_update_plot(time_line, self.worker.ADC1_Channel_array_plot )

        # msg = "Финиш чтения данных ADC"
        # self.update_statusBar_msg(msg)

        # self.ADC1_Channel_1_array = copy.copy(self.worker.ADC1_Channel_1_array)
        # self.ADC1_Channel_2_array = copy.copy(self.worker.ADC1_Channel_2_array)
        # self.ADC1_Channel_3_array = copy.copy(self.worker.ADC1_Channel_3_array)
        # self.ADC1_Channel_4_array = copy.copy(self.worker.ADC1_Channel_4_array)




    def ADC_set_count_read(self):
        print("ADC_set_count_read")
        try:
        # if 1:
            
            print(self.ADC_set_count_read_value)
            self.ADC_count =  self.ADC_set_count_read_value
            self.ADC_revers_count_timer_line_edit.setPlaceholderText(str(self.ADC_count))
        except:
            print("e")




    def onChanged_ADC_line_edit_set_count_read(self, text):
        try:
            self.ADC_set_count_read_value = int(text)
            self.ADC_line_edit_set_count_read.setStyleSheet('background : #ffffff;')
        except ValueError:
            self.ADC_line_edit_set_count_read.setStyleSheet('background : #dc3545;')
            self.ADC_set_count_read_value = None
            print("ADC_set_count_read_value Error")




# ВТОРОЙ БЛОК
    # запись данных в файла
    def ADC_write_data_to_file(self):
        print("ADC_write_data_to_file")

        header = ['time', 'ADC1_Channel_1', 'ADC1_Channel_2', 'ADC1_Channel_3', 'ADC1_Channel_4',
                          'ADC1_Channel_5', 'ADC1_Channel_6', 'ADC1_Channel_7', 'ADC1_Channel_8',
                          'ADC1_Channel_9', 'ADC1_Channel_10', 'ADC1_Channel_11', 'ADC1_Channel_12',
                          'ADC1_Channel_13', 'ADC1_Channel_14', 'ADC1_Channel_15', 'ADC1_Channel_16']

        try:
        # if 1:

            path, _ = QFileDialog.getSaveFileName(self, 'Save File', '', 'CSV(*.csv)')
            print(path)

            if path !='':
                with open(path, 'w') as f:
                    writer = csv.writer(f, delimiter=';')           
                    writer.writerow(header)


                    len_array =  len(self.ADC1_Channel_array_plot[0])

                    print(len_array)

                    # for j in range(4):
                    for i in range(len_array):

                        data1 = self.ADC1_Channel_array_plot[0][i]
                        data2 = self.ADC1_Channel_array_plot[1][i]
                        data3 = self.ADC1_Channel_array_plot[2][i]
                        data4 = self.ADC1_Channel_array_plot[3][i]

                        data5 = self.ADC1_Channel_array_plot[4][i]
                        data6 = self.ADC1_Channel_array_plot[5][i]
                        data7 = self.ADC1_Channel_array_plot[6][i]
                        data8 = self.ADC1_Channel_array_plot[7][i]

                        data9 = self.ADC1_Channel_array_plot[8][i]
                        data10 = self.ADC1_Channel_array_plot[9][i]
                        data11 = self.ADC1_Channel_array_plot[10][i]
                        data12 = self.ADC1_Channel_array_plot[11][i]                       

                        data13 = self.ADC1_Channel_array_plot[12][i]
                        data14 = self.ADC1_Channel_array_plot[13][i]
                        data15 = self.ADC1_Channel_array_plot[14][i]
                        data16 = self.ADC1_Channel_array_plot[15][i]

                        row = [i, data1, data2, data3, data4,
                                  data5, data6, data7, data8,
                                  data9, data10, data11, data12,
                                  data13, data14, data15, data16]

                        writer.writerow(row)



            msg = "Файл успешно сохранён"
            print(msg)
            # self.update_statusBar_msg(msg)
        except:
            msg = "Ошибка записи файла"
            print(msg)
            # self.update_statusBar_error(msg)


