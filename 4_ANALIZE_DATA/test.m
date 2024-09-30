clc;
clear all;

A_filename = 'M_eksp_4_4.csv';
A_1 = dlmread(A_filename, ';', 1, 0);


A_Time_1   = A_1(:,1)*0.01;
A_PosRef_1 = A_1(:,2)*0.025 * -1;
% A_PosFb_1  = A_1(:,3)*0.025 * -1;

A_PosFb_1  = A_1(:,3) * -1;

A_sinchro_1  = A_1(:,4); %RPM
A_Vel_1  = A_1(:,5)* -1 * 4.88; %RPM
% A_PosErr_1 = A_PosRef_1 - A_PosFb_1;


B_filename = 'M_OSC_eksp_4_4new.csv';
B_1 = dlmread(B_filename, ';', 1, 0);

% B_Time_1   = B_1(:,1)*0.00045 -1.845;
B_Time_1   = B_1(:,1)*0.0006 - 1.71593; %4_4
k_P_A = 36 / 4095 * 400 /10;
k_P_B = 36 / 4095 * 400 /20;

B_P_A_1 = B_1(:,2) * k_P_A;
B_P_B_1  = B_1(:,3)* k_P_B;
B_sinchro_1  = B_1(:,4);



hold on 

yyaxis left

plot(A_Time_1, A_PosFb_1, '-k', 'LineWidth', 1);
% plot(A_Time_1, A_sinchro_1, '-m', 'LineWidth', 1);
% plot(B_Time_1, B_sinchro_1, '-c', 'LineWidth', 1);
ylabel('Displacement, [mm]');

yyaxis right
plot(B_Time_1, B_P_A_1, '-b', 'LineWidth', 1);
plot(B_Time_1, B_P_B_1, '-m', 'LineWidth', 1);
ylabel('Pressure, [bar]');

legend('Displacement task', 'Simulation data', 'Experimental data');
% legend('Displacement task','Sinchro PIC', 'Simulation data', 'Experimental data', 'Sinchro STM32');

% ylim([-5 60])
% xlim([0 25])
xlabel('Time, [s]'); 

grid on
grid minor
hold off 







