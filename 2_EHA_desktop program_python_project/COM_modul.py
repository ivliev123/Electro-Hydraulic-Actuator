import sys
import os
from PyQt5.QtWidgets import (QWidget, QLabel,QPushButton, QApplication,
    QLineEdit, QApplication, QMainWindow, QAction, qApp, QComboBox, QDialog,
    QProgressBar)
from PyQt5.QtWidgets import *
from PyQt5.QtGui import QPixmap, QColor, QIcon, QFont
from PyQt5.QtCore import QCoreApplication, QTimer, QSize, QRect
from PyQt5.QtCore import pyqtSlot
from PyQt5.QtCore import QCoreApplication, QTimer, QSize, QObject, QThread, pyqtSignal, Qt
from datetime import datetime


from pymodbus.constants import Endian
from pymodbus.payload import BinaryPayloadDecoder
from pymodbus.payload import BinaryPayloadBuilder
# from pymodbus.client import ModbusSerialClient
from pymodbus.client import ModbusTcpClient

import serial

import REG_MAP_modul






class COM_(QMainWindow):
    def __init__(self):
        super().__init__()


        self.REG_time = REG_MAP_modul.REG_MAP_object.REG_time

        self.connect_status = 0

        self.COM_statusBar_msg = ""

        # self.client = ModbusTcpClient(host='192.168.0.242', port=502)
        # self.client = ModbusTcpClient()
        self.host = ["192.168.0.242"]
        self.port = ['502']


        self.COM_widget = QWidget()
        self.COM_gridLayout = QGridLayout(self.COM_widget)
        self.COM_gridLayout.setObjectName("COM_gridLayout")




        self.COM_UI()
        self.COM_set_connektion_data()



    def COM_UI(self):
        font = QFont()
        font.setPointSize(9)

        self.COM_groupBox = QGroupBox(self.COM_widget)
        self.COM_groupBox.setMaximumSize(QSize(400, 400))
        self.COM_groupBox.setTitle("COM")

        self.COM_panel_gridLayout = QGridLayout(self.COM_groupBox)
        self.COM_panel_gridLayout.setObjectName("COM_panel_gridLayout")

        self.label_1 = QLabel(self.COM_groupBox)
        self.label_1.setFont(font)
        self.label_1.setText("host")
        self.COM_panel_gridLayout.addWidget(self.label_1, 0, 0, 1, 1)

        self.host_box = QComboBox(self.COM_groupBox)
        self.COM_panel_gridLayout.addWidget(self.host_box, 0, 1, 1, 1)

        self.label_2 = QLabel(self.COM_groupBox)
        self.label_2.setFont(font)
        self.label_2.setText("port")
        self.COM_panel_gridLayout.addWidget(self.label_2, 1, 0, 1, 1)

        self.port_box = QComboBox(self.COM_groupBox)
        self.COM_panel_gridLayout.addWidget(self.port_box, 1, 1, 1, 1)

      

        self.ConnectButton = QPushButton(self.COM_groupBox)
        self.ConnectButton.setText("Подключиться")
        self.ConnectButton.clicked.connect(self.COM_connect_modbus)
        self.ConnectButton.setIcon(QIcon('icons/usb.png'))
        self.COM_panel_gridLayout.addWidget(self.ConnectButton, 2, 0, 1, 2)

        self.COM_gridLayout.addWidget(self.COM_groupBox, 0, 0, 1, 1)







    def onChanged_MODBUS_set_dev_manual(self, text):
        try:
            self.MODBUS_set_dev_manual_value = int(text)
            self.MODBUS_set_dev_manual.setStyleSheet('background : #ffffff; ')
            self.MODBUS_button_coose_dev.setEnabled(True)
        except ValueError:
            self.MODBUS_set_dev_manual.setStyleSheet('background : #dc3545; ')
            self.MODBUS_set_dev_manual_value = None
            self.MODBUS_button_coose_dev.setEnabled(False)
            print("MODBUS_set_dev_manual_value Error")


    def COM_set_connektion_data(self):
        # self.host_box.clear()
        # self.port_box.clear()
        self.host_box.addItems(self.host)
        self.port_box.addItems(self.port)



    def COM_connect_modbus(self):
        try:
        # if 1
            self.client = ModbusTcpClient(host=str(self.host_box.currentText()), 
                                          port=int(self.port_box.currentText()))


            self.connect_status = self.client.connect()
            print("Connect_status", self.connect_status)

            self.ConnectButton.setText('Подключено')
            self.ConnectButton.setEnabled(False)

        except Exception as e:
            print(e)




        


    def update_statusBar_msg(self, msg):

        current_datetime = datetime.now()
        hour_str =  str(current_datetime.hour) if current_datetime.hour  > 9 else "0" + str(current_datetime.hour)
        minute_str =  str(current_datetime.minute) if current_datetime.minute  > 9 else "0" + str(current_datetime.minute)
        second_str =  str(current_datetime.second) if current_datetime.second  > 9 else "0" + str(current_datetime.second)

        time_str = hour_str + ":" + minute_str + ":" + second_str + " | " 

        self.COM_statusBar_msg = time_str + msg

        # self.MainWindow.statusBar().setStyleSheet("color : #000000;") 
        # self.MainWindow.statusBar().showMessage(time_str + msg)




app = QApplication(sys.argv)   #заглушка 
COM_object = COM_()