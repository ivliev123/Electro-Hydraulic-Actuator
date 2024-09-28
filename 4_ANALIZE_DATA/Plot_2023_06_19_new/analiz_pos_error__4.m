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



%pos % % % % % % % % % % % % % % % % % % % % % 

load('pos_4_1.mat', 'pos');
C_1 = pos;
load('pos_4_2.mat', 'pos');
C_2 = pos;
load('pos_4_3.mat', 'pos');
C_3 = pos;
load('pos_4_4.mat', 'pos');
C_4 = pos;



% load('pos_4_1.mat', 'pos');
% load('pos_4_2.mat', 'pos');
% load('pos_4_3.mat', 'pos');
% load('pos_4_4.mat', 'pos');
% load('pos_4_4_45.mat', 'pos');



% C_Time_1   = C_1(1,:)*1000 + 5; % A_1_1
% C_Time_2   = C_2(1,:)*1000 + 65; % A_1_2
% C_Time_3   = C_3(1,:)*1000 + 35; % A_1_3
% C_Time_4   = C_4(1,:)*1000 +40; % A_1_4

% C_Time_1   = C_1(1,:)*1000 + 69; % A_2_1
% C_Time_2   = C_2(1,:)*1000 + 81; % A_2_2
% C_Time_3   = C_3(1,:)*1000 + 14; % A_2_3
% C_Time_4   = C_4(1,:)*1000  + 30; % A_2_4

C_Time_1   = C_1(1,:)*1000 + 28; % A_4_1
C_Time_2   = C_2(1,:)*1000 + 65; % A_4_2
C_Time_3   = C_3(1,:)*1000 + 68; % A_4_3
C_Time_4   = C_4(1,:)*1000 +80; % A_4_4
% C_Time   = C(1,:)*1000 + 80; % A_4_4_45

C_Time_1 = C_Time_1 / 1000;
C_Time_2 = C_Time_2 / 1000;
C_Time_3 = C_Time_3 / 1000;
C_Time_4 = C_Time_4 / 1000;


C_PosRef_1  = C_1(3,:); 
C_PosFb_1  = C_1(2,:); 
C_PosErr_1 = C_PosRef_1 - C_PosFb_1;
C_PosRef_2  = C_2(3,:); 
C_PosFb_2  = C_2(2,:); 
C_PosErr_2 = C_PosRef_2 - C_PosFb_2;
C_PosRef_3  = C_3(3,:); 
C_PosFb_3  = C_3(2,:); 
C_PosErr_3 = C_PosRef_3 - C_PosFb_3;
C_PosRef_4  = C_4(3,:); 
C_PosFb_4  = C_4(2,:); 
C_PosErr_4 = C_PosRef_4 - C_PosFb_4;


A_Time_1   = A_1(:,1)*0.01;
A_PosRef_1 = A_1(:,2)*0.025 * -1;
A_PosFb_1  = A_1(:,3)*0.025 * -1;
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
plot(A_Time_1, A_PosErr_1, '-g', 'LineWidth', 1);
plot(C_Time_1, C_PosErr_1, '--r', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Displacement error, [mm]');
legend('Experimental data', 'Simulation data');

title('a');
ylim([-10 30])
xlim([0 25])
grid on
grid minor
hold off 

nexttile
hold on 
plot(A_Time_2, A_PosErr_2, '-g', 'LineWidth', 1);
plot(C_Time_2, C_PosErr_2, '--r', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Displacement error, [mm]');
legend('Experimental data', 'Simulation data');

title('b');
ylim([-10 30])
xlim([0 25])
grid on
grid minor
hold off 

nexttile
hold on 
plot(A_Time_3, A_PosErr_3, '-g', 'LineWidth', 1);
plot(C_Time_3, C_PosErr_3, '--r', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Displacement error, [mm]');
legend('Experimental data', 'Simulation data');

title('c');
ylim([-10 30])
xlim([0 25])

grid on
grid minor
hold off 

nexttile
hold on 

plot(A_Time_4, A_PosErr_4, '-g', 'LineWidth', 1);
plot(C_Time_4, C_PosErr_4, '--r', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Displacement error, [mm]');
legend('Experimental data', 'Simulation data');

title('d');
ylim([-10 30])
xlim([0 25])
grid on
grid minor
hold off 


