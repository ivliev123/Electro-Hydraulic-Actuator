clc;
clear all;

A_filename = 'M_eksp_4_1.csv';
A_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_2.csv';
A_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_3.csv';
A_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_4.csv';
A_4 = dlmread(A_filename, ';', 1, 0);



k_P_A = 36 / 4095 * 400 /10;
k_P_B = 36 / 4095 * 400 /20;

B_filename = 'M_OSC_eksp_4_1new.csv';
B_1 = dlmread(B_filename, ';', 1, 0);
B_Time_1  = B_1(:,1)*0.0006 + 4.4381 - 6.10471; %4_1
B_P_A_1 = B_1(:,2) * k_P_A;
B_P_B_1  = B_1(:,3)* k_P_B;
B_sinchro_1  = B_1(:,4);

B_filename = 'M_OSC_eksp_4_2new.csv';
B_2 = dlmread(B_filename, ';', 1, 0);
B_Time_2  = B_2(:,1)*0.0006 + 4.4085 - 6.1978; %4_2
B_P_A_2 = B_2(:,2) * k_P_A;
B_P_B_2  = B_2(:,3)* k_P_B;
B_sinchro_2  = B_2(:,4);

B_filename = 'M_OSC_eksp_4_3new.csv';
B_3 = dlmread(B_filename, ';', 1, 0);
B_Time_3  = B_3(:,1)*0.0006 +4.42 - 6.16558; %4_2
B_P_A_3 = B_3(:,2) * k_P_A;
B_P_B_3  = B_3(:,3)* k_P_B;
B_sinchro_3  = B_3(:,4);

B_filename = 'M_OSC_eksp_4_4new.csv';
B_4 = dlmread(B_filename, ';', 1, 0);
B_Time_4   = B_4(:,1)*0.0006 - 1.71593; %4_4
B_P_A_4 = B_4(:,2) * k_P_A;
B_P_B_4  = B_4(:,3)* k_P_B;
B_sinchro_4  = B_4(:,4);







%pos % % % % % % % % % % % % % % % % % % % % % 

load('pos_4_1.mat', 'pos');
C_1 = pos;
load('pos_4_2.mat', 'pos');
C_2 = pos;
load('pos_4_3.mat', 'pos');
C_3 = pos;
load('pos_4_4.mat', 'pos');
C_4 = pos;




C_Time_1   = C_1(1,:)*1000 + 60; % A_4_1
C_Time_2   = C_2(1,:)*1000 + 27; % A_4_2
C_Time_3   = C_3(1,:)*1000 + 40; % A_4_3
C_Time_4   = C_4(1,:)*1000 + 20; % A_4_4


C_Time_1 = C_Time_1 / 1000;
C_Time_2 = C_Time_2 / 1000;
C_Time_3 = C_Time_3 / 1000;
C_Time_4 = C_Time_4 / 1000;


C_PosRef_1  = C_1(3,:); 
C_PosFb_1  = C_1(2,:); 
C_PosRef_2  = C_2(3,:); 
C_PosFb_2  = C_2(2,:); 
C_PosRef_3  = C_3(3,:); 
C_PosFb_3  = C_3(2,:); 
C_PosRef_4  = C_4(3,:); 
C_PosFb_4  = C_4(2,:); 



A_Time_1   = A_1(:,1)*0.01;
A_PosRef_1 = A_1(:,2)*0.025 * -1;
A_PosFb_1  = A_1(:,3)*0.025 * -1;
A_sinchro_1  = A_1(:,4);
A_Vel_1  = A_1(:,5)* -1 * 4.88; %RPM
A_PosErr_1 = A_PosRef_1 - A_PosFb_1;


A_Time_2   = A_2(:,1)*0.01;
A_PosRef_2 = A_2(:,2)*0.025 * -1;
A_PosFb_2  = A_2(:,3)*0.025 * -1;
A_Vel_2  = A_2(:,5)* -1 * 4.88; %RPM
A_PosErr_2 = A_PosRef_2 - A_PosFb_2;

A_Time_3   = A_3(:,1)*0.01;
A_PosRef_3 = A_3(:,2)*0.025 * -1;
A_PosFb_3  = A_3(:,3)*0.025 * -1;
A_Vel_3  = A_3(:,5)* -1 * 4.88; %RPM
A_PosErr_3 = A_PosRef_3 - A_PosFb_3;

A_Time_4   = A_4(:,1)*0.01;
A_PosRef_4 = A_4(:,2)*0.025 * -1;
A_PosFb_4 = A_4(:,3)*0.025 * -1;
A_Vel_4  = A_4(:,5)* -1 * 4.88; %RPM
A_PosErr_4 = A_PosRef_4 - A_PosFb_4;

t = tiledlayout(2,2);
t.TileSpacing = 'compact';




nexttile
hold on 
% yyaxis left
% plot(C_Time_1, C_PosRef_1, '-k', 'LineWidth', 1);
% plot(C_Time_1, C_PosFb_1, '-r', 'LineWidth', 1);
% plot(A_Time_1, A_PosFb_1, '-g', 'LineWidth', 1);

% plot(A_Time_1, A_PosRef_1, '--c', 'LineWidth', 1);

% plot(A_Time_1, A_sinchro_1, '--m', 'LineWidth', 1);
% plot(B_Time_1, B_sinchro_1, '--c', 'LineWidth', 1);
% ylim([-5 60])
% ylabel('Displacement, [mm]');
% 
% yyaxis right
plot(B_Time_1, B_P_A_1, '--b', 'LineWidth', 1);
plot(B_Time_1, B_P_B_1, '--m', 'LineWidth', 1);
ylabel('Pressure, [bar]');
ylim([0 60])

legend('P_A_e_x_p [bar]', 'P_B_e_x_p [bar]'); 

xlim([0 25])
xlabel('Time, [s]'); 
grid on
grid minor
hold off 


nexttile
hold on 
% yyaxis left
% plot(C_Time_2, C_PosRef_2, '-k', 'LineWidth', 1);
% plot(C_Time_2, C_PosFb_2, '-r', 'LineWidth', 1);
% plot(A_Time_2, A_PosFb_2, '-g', 'LineWidth', 1);

% plot(A_Time_2, A_PosRef_2, '--c', 'LineWidth', 1);

% plot(A_Time_2, A_sinchro_2, '--m', 'LineWidth', 1);
% plot(B_Time_2, B_sinchro_2, '--c', 'LineWidth', 1);
% ylim([-5 60])
% ylabel('Displacement, [mm]');
% 
% yyaxis right
plot(B_Time_2, B_P_A_2, '--b', 'LineWidth', 1);
plot(B_Time_2, B_P_B_2, '--m', 'LineWidth', 1);
ylabel('Pressure, [bar]');
ylim([0 60])

legend('P_A_e_x_p [bar]', 'P_B_e_x_p [bar]'); 

xlim([0 25])
xlabel('Time, [s]'); 
grid on
grid minor
hold off 




nexttile
hold on 
% yyaxis left
% plot(C_Time_3, C_PosRef_3, '-k', 'LineWidth', 1);
% plot(C_Time_3, C_PosFb_3, '-r', 'LineWidth', 1);
% plot(A_Time_3, A_PosFb_3, '-g', 'LineWidth', 1);

% plot(A_Time_3, A_PosRef_3, '--c', 'LineWidth', 1);

% plot(A_Time_3, A_sinchro_3, '--m', 'LineWidth', 1);
% plot(B_Time_3, B_sinchro_3, '--c', 'LineWidth', 1);
% ylim([-5 60])
% ylabel('Displacement, [mm]');
% 
% yyaxis right
plot(B_Time_3, B_P_A_3, '--b', 'LineWidth', 1);
plot(B_Time_3, B_P_B_3, '--m', 'LineWidth', 1);
ylabel('Pressure, [bar]');
ylim([0 60])

legend('P_A_e_x_p [bar]', 'P_B_e_x_p [bar]'); 

xlim([0 25])
xlabel('Time, [s]'); 
grid on
grid minor
hold off 



nexttile
hold on 
% yyaxis left
% plot(C_Time_4, C_PosRef_4, '-k', 'LineWidth', 1);
% plot(C_Time_4, C_PosFb_4, '-r', 'LineWidth', 1);
% plot(A_Time_4, A_PosFb_4, '-g', 'LineWidth', 1);

% plot(A_Time_4, A_PosRef_4, '--c', 'LineWidth', 1);

% plot(A_Time_4, A_sinchro_4, '--m', 'LineWidth', 1);
% plot(B_Time_4, B_sinchro_4, '--c', 'LineWidth', 1);
% ylim([-5 60])
% ylabel('Displacement, [mm]');
% 
% yyaxis right
plot(B_Time_4, B_P_A_4, '--b', 'LineWidth', 1);
plot(B_Time_4, B_P_B_4, '--m', 'LineWidth', 1);
ylabel('Pressure, [bar]');
ylim([0 60])

legend('P_A_e_x_p [bar]', 'P_B_e_x_p [bar]'); 

xlim([0 25])
xlabel('Time, [s]'); 
grid on
grid minor
hold off 


