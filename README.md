# Electro-Hydraulic-Actuator
This repository contains models for simulation of an electrohydraulic actuator, software codes for controlling an electrohydraulic drive, software codes for collecting data from an experimental installation, as well as data from this experimental installation.
You can reproduce these results on your computer .

## Install
### Dependencies
You need dependencies below.
* Matlab 2021a
* Python 3.12.6 
* STM32CubeMX 6.2.1
* SW4STM32 2.9

Using Python 3, create a virtual environment and then install dependancies with:
```
python -m venv myenv
.\myenv\Scripts\activate
```

```
pip install -r requirements.txt
```

## Folder Structure
```
Electro-Hydraulic-Actuator/
├── 1_EHA_STM32F767ZI_project/                 # The project of the control system program on the STM32F767ZIT6 microcontroller
├── 2_EHA_desktop program_python_project/      # The project of the desktop program for communication with the microcontroller and data collection
├── 3_MATLAB_Simulink_model/                   # Simulation model of an electrohydraulic actuator in MATLAB/Simulink
├── 4_ANALIZE_DATA/                            # Data processing scripts
    ├── DATA_Experiment                        # Data obtained from the experimental system
    ├── DATA_Experiment_Processed              # Processed data obtained from the experimental system
    ├── DATA_Simulation                        # Data obtained from the simulation model
    ├── MATLAB_Processing                      # Scripts for processing and visualizing data in Matlab
    └── PYTHON_Processing                      # Data processing scripts in Python
```