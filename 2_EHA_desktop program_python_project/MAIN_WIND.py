
from PyQt5.QtWidgets import (QWidget, QLabel, QPushButton, QApplication,
    QLineEdit, QMainWindow, QAction, qApp, QVBoxLayout, QHBoxLayout, QGridLayout,
    QTabWidget, QFrame)
from PyQt5.QtGui import QPixmap, QColor, QIcon, QFont
from PyQt5.QtCore import QCoreApplication, QTimer, QSize, QThread
import PyQt5

from pymodbus.constants import Endian
from pymodbus.payload import BinaryPayloadDecoder
from pymodbus.payload import BinaryPayloadBuilder
from pymodbus.client import ModbusSerialClient
import time
from datetime import datetime
import struct
import sys


# import GPIO_modul
import ADC_modul
import SHOW_modul
# import DAC_modul
import COM_modul
# import TIM_modul

import numpy as np
import matplotlib.pyplot as plt

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        # QApplication.__init__(self)

        # self.COM_use = COM_modul.COM_(self)
        self.COM_use = COM_modul.COM_object
        
        self.connect_client_first = 1

        # self.GPIO_ = GPIO_modul.GPIO_(self)
        self.ADC_ = ADC_modul.ADC_(self)
        self.SHOW_ = SHOW_modul.SHOW_(self)
        # self.DAC_ = DAC_modul.DAC_(self)
        # self.TIM_ = TIM_modul.TIM_(self)

        self.initUI()

        self.tab_gpio_status = 1
        self.tab_adc_status  = 0
        self.tab_dac_status  = 0
        self.tab_tim_status  = 0
        self.tab_com_status  = 0 

        self.test_i = 0
    

    def initUI(self):


        self.tabs    = QTabWidget()    

        # self.tab_gpio   = self.GPIO_.GPIO_widget
        self.tab_adc    = self.ADC_.ADC_widget
        self.tab_show    = self.SHOW_.SHOW_widget
        # self.tab_dac    = self.DAC_.DAC_widget
        # self.tab_dac    = self.DAC_
        # self.tab_tim    = self.TIM_.TIM_widget
        self.tab_com    = self.COM_use.COM_widget

        # self.tabs.addTab(self.tab_gpio,"GPIO OUT")
        self.tabs.addTab(self.tab_adc,"ADC")
        self.tabs.addTab(self.tab_show,"SHOW")
        # self.tabs.addTab(self.tab_dac,"DAC")
        # self.tabs.addTab(self.tab_tim,"TIM")
        self.tabs.addTab(self.tab_com,"COM") 

        self.tabs.tabBarClicked.connect(self.tabBar_click)

        self.setCentralWidget(self.tabs)

        self.setGeometry(50, 50, 1800, 950)
        self.setWindowTitle('BoardTester Beta')
        self.setWindowIcon(QIcon('icons/scada-icon.png'))
        self.showMaximized()
        self.show()

        self.statusBarUI()


  


    def tabBar_click(self, index):
        print(index)

        current_datetime = datetime.now()
        hour_str =  str(current_datetime.hour) if current_datetime.hour  > 9 else "0" + str(current_datetime.hour)
        minute_str =  str(current_datetime.minute) if current_datetime.minute  > 9 else "0" + str(current_datetime.minute)
        second_str =  str(current_datetime.second) if current_datetime.second  > 9 else "0" + str(current_datetime.second)

        time_str = hour_str + ":" + minute_str + ":" + second_str + "    " 
        self.statusBar().setStyleSheet("color : #000000;") 

        # if index == 0:
        #     self.update_tab_status(1, 0, 0, 0, 0)
        #     self.statusBar().showMessage(time_str)
        #     self.COM_use.COM_statusBar_msg = ""

        #     self.GPIO_.GPIO_child_1.GPIO_read_from_modbus()
        #     self.GPIO_.GPIO_child_2.GPIO_read_from_modbus()
        #     self.GPIO_.GPIO_child_3.GPIO_read_from_modbus()
        #     self.GPIO_.GPIO_child_4.GPIO_read_from_modbus()
            
        if index == 0:
            self.update_tab_status(0, 1, 0, 0, 0)
            # self.statusBar().showMessage(time_str)
            self.COM_use.COM_statusBar_msg = ""


        # if index == 1:
        #     self.update_tab_status(0, 0, 1, 0, 0)
        #     # self.statusBar().showMessage(time_str)
        #     self.COM_use.COM_statusBar_msg = ""
        # if index == 3:
        #     self.update_tab_status(0, 0, 0, 1, 0)
        #     self.statusBar().showMessage(time_str)
        #     self.COM_use.COM_statusBar_msg = ""

        #     self.TIM_.TIM_read_chanls_status()
        if index == 1:
            self.update_tab_status(0, 0, 0, 0, 1)
            self.statusBar().showMessage(time_str)
            self.COM_use.COM_statusBar_msg = self.get_time()

            # self.COM_use.COM_set_ports()


    def statusBarUI(self):
        print()

        
        self.statusBar().showMessage("")

        self.statusBar().setFont(QFont('Times', 10))

        self.connection = QLabel("Подключение: ")
        self.connection.setFont(QFont('Times', 10))
        self.ID = QLabel("ID устройства: 0")
        self.ID.setFont(QFont('Times', 10))

        self.ID.setMinimumSize(130, 20)
        self.connection.setStyleSheet("color: black;")
        self.ID.setStyleSheet("color: black;")


        self.btn_connection = QPushButton()   # The connection button
        self.btn_connection.setMaximumSize(20, 20)
        self.btn_connection.setIcon(QIcon('icons/bin.png'))
        self.btn_connection.setStyleSheet("background-color:  #dc3545; border-radius: 10px;")
        # self.btn_connection.setStyleSheet("background-color:  #28a745; border-radius: 10px;")

        # self.statusBar().addPermanentWidget(self.MSG)
        self.statusBar().addPermanentWidget(VLine())    # <---
        self.statusBar().addPermanentWidget(self.connection)
        self.statusBar().addPermanentWidget(self.btn_connection)

        self.statusBar().addPermanentWidget(VLine())    # <---
        self.statusBar().addPermanentWidget(self.ID)
        self.statusBar().addPermanentWidget(VLine()) 

        self.statusBar().setFont(QFont('Times', 10))


    def update_statusBar_msg(self):


        # time_str = self.get_time()

        # # self.statusBar().showMessage(str(current_datetime))
        # if self.tab_gpio_status:
        #     self.statusBar().showMessage(time_str)
        # if self.tab_adc_status:
        #     self.statusBar().showMessage(time_str)
        # if self.tab_dac_status:
        #     self.statusBar().showMessage(time_str)
        # if self.tab_tim_status:
        #     self.statusBar().showMessage(time_str)
        if self.tab_com_status:
            self.statusBar().showMessage(self.COM_use.COM_statusBar_msg)

        if self.COM_use.connect_status:      
            self.btn_connection.setStyleSheet("background-color:  #28a745; border-radius: 10px;")
        else:
            self.btn_connection.setStyleSheet("background-color:  #dc3545; border-radius: 10px;")


        # self.ID.setText("ID устройства: " + str(self.COM_use.MODBUS_addr))


    def update_tab_status(self, gpio_status, adc_status, dac_status, tim_status, com_status):
        self.tab_gpio_status = gpio_status
        self.tab_adc_status  = adc_status
        self.tab_dac_status  = dac_status
        self.tab_tim_status  = tim_status
        self.tab_com_status  = com_status


    def get_time(self):

        current_datetime = datetime.now()
        hour_str =  str(current_datetime.hour) if current_datetime.hour  > 9 else "0" + str(current_datetime.hour)
        minute_str =  str(current_datetime.minute) if current_datetime.minute  > 9 else "0" + str(current_datetime.minute)
        second_str =  str(current_datetime.second) if current_datetime.second  > 9 else "0" + str(current_datetime.second)

        time_str = hour_str + ":" + minute_str + ":" + second_str + " " 
        
        return time_str



    
class VLine(QFrame):
    def __init__(self):
        super(VLine, self).__init__()
        self.setFrameShape(self.VLine|self.Sunken)



App = QApplication(sys.argv)
window = MainWindow()
sys.exit(App.exec())