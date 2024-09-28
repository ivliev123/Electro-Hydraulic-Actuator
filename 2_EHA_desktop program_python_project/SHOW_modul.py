
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




class SHOW_(QMainWindow):


    data_acquired = pyqtSignal(np.ndarray)



    def __init__(self, MainWindow):
        super().__init__()


        self.MainWindow = MainWindow

        self.COM_use = COM_modul.COM_object

        self.SHOW_num_block_reg_array_last = 0
        self.SHOW_num_block_reg_array_now = 0
        self.i = 0


        self.value = 0


        self.Plot_Data_1 = pg.plot(title="Plot_Data_1")
        self.Plot_Data_1.setRange(yRange=[0, 4000])
        self.Plot_Data_1.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Data_2 = pg.plot(title="Plot_Data_2")
        self.Plot_Data_2.setRange(yRange=[0, 4000])
        self.Plot_Data_2.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Data_3 = pg.plot(title="Plot_Data_3")
        self.Plot_Data_3.setRange(yRange=[0, 4000])
        self.Plot_Data_3.showGrid(x=True, y=True, alpha=0.8)

        self.Plot_Data_4 = pg.plot(title="Plot_Data_4")
        self.Plot_Data_4.setRange(yRange=[0, 4000])
        self.Plot_Data_4.showGrid(x=True, y=True, alpha=0.8)



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
            self.line.append(self.Plot_Data_1.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Data_2.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Data_3.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))
        for i in range(4):
            self.line.append(self.Plot_Data_4.plot(self.xdata, self.ydata[i], pen = self.pen_array[i%4]))

        # self.thread_status = False
        # self.init_thread()

        self.SHOW_UI()



    def SHOW_UI(self):


        SHOW_width = 200
        SHOW_hidht = 25

        font = QFont()
        font.setPointSize(8)

        self.SHOW_widget = QWidget()
        self.SHOW_widget.setObjectName("SHOW_widget")
        self.SHOW_gridLayout = QGridLayout(self.SHOW_widget)
        self.SHOW_gridLayout.setObjectName("SHOW_gridLayout")

        # ############################################################
        self.SHOW_groupBox_add = QGroupBox(self.SHOW_widget)
        self.SHOW_groupBox_add.setMaximumSize(QSize(340, 1000))
        # self.SHOW_groupBox.setObjectName("SHOW_groupBox")
        self.SHOW_groupBox_add.setTitle("ADC доп. панель")

        self.SHOW_panel_add_gridLayout = QGridLayout(self.SHOW_groupBox_add)
        self.SHOW_panel_add_gridLayout.setObjectName("SHOW_panel_add_gridLayout")

        self.SHOW_file_line = QLineEdit(self.SHOW_groupBox_add)
        self.SHOW_file_line.resize(SHOW_width, SHOW_hidht)
        self.SHOW_file_line.setStyleSheet('background : #ddd; ')
        self.SHOW_file_line.setReadOnly(1)
        self.SHOW_panel_add_gridLayout.addWidget(self.SHOW_file_line, 0, 0, 1, 1)
        
        self.SHOW_get_data_button = QPushButton(self.SHOW_groupBox_add)
        self.SHOW_get_data_button.setText("Выбрать файл")
        self.SHOW_get_data_button.resize(SHOW_width, SHOW_hidht)
        self.SHOW_get_data_button.clicked.connect(self.SHOW_read_data_from_file)
        self.SHOW_get_data_button.setIcon(QIcon('icons/open-folder.png'))
        self.SHOW_panel_add_gridLayout.addWidget(self.SHOW_get_data_button, 1, 0, 1, 1)


        spacerItem = QSpacerItem(20, 40, QSizePolicy.Maximum, QSizePolicy.Expanding)
        self.SHOW_panel_add_gridLayout.addItem(spacerItem, 2, 0, 1, 1)       #автозаполнение пустого пространства
        self.SHOW_gridLayout.addWidget(self.SHOW_groupBox_add, 0, 0, 2, 1)


        self.SHOW_gridLayout.addWidget(self.Plot_Data_1,    0, 1, 1, 1)
        self.SHOW_gridLayout.addWidget(self.Plot_Data_2,    1, 1, 1, 1)
        self.SHOW_gridLayout.addWidget(self.Plot_Data_3,    0, 2, 1, 1)
        self.SHOW_gridLayout.addWidget(self.Plot_Data_4,    1, 2, 1, 1)






   # чтение данных с файла
    def SHOW_read_data_from_file(self):
        print("SHOW_read_data_from_file")

        fname = QFileDialog.getOpenFileName(self, 'Open file', '', 'CSV(*.csv)')[0]

        with open(fname , 'r') as f:
            reader = csv.reader(f, delimiter=';')
            i = 0
            read_array = []
            # print(len(reader))
            for row in reader:
                if row != []:
                    read_array.append(row)

            read_array=np.array(read_array)
            header = read_array[0]
            print(header)

            read_array = read_array[1: -1].astype(int)
            # print(read_array)
            

            # заглушка, нужно както покрасивше переписать
            # time_line = read_array[:, 0]
            # col_1 = read_array[:, 1]
            # col_2 = read_array[:, 2]
            # col_3 = read_array[:, 3]
            # col_4 = read_array[:, 4]

            # print(col_1)

        self.SHOW_file_line.setText(fname)

        # self.SHOW_update_data(time_line, col_1, col_2, col_3, col_4, 
        #                            'ADC1_Channel_1', 'ADC1_Channel_2', 'ADC1_Channel_3', 'ADC1_Channel_4')

        self.SHOW_update_data(read_array)

    def SHOW_update_data(self, array):
        len_ = len(array[:,0])
        print('ttt')
        print(len_)
        # print(len(array))

        len_plots = 16
        for i in range(len_plots):
            ydata = array[:, i+1]
            self.line[i].setData(ydata)

        # for i in range(len_plot):
        #     self.array_124[i] = array[i][0:124]
        #     self.ydata[i] = self.ydata[i][124:] + self.array_124[i]
        #     self.line[i].setData(self.ydata[i])







