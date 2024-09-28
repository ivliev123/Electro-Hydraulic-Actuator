clc;
clear all;

A_filename = 'M_eksp_1_1.csv';
A1_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_2.csv';
A1_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_3.csv';
A1_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_4.csv';
A1_4 = dlmread(A_filename, ';', 1, 0);

A_filename = 'M_eksp_2_1.csv';
A2_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_2.csv';
A2_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_3.csv';
A2_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_4.csv';
A2_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_3_1.csv';
A3_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_2.csv';
A3_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_3.csv';
A3_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_4.csv';
A3_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_4_1.csv';
A4_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_2.csv';
A4_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_3.csv';
A4_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_4.csv';
A4_4 = dlmread(A_filename, ';', 1, 0);

%pos % % % % % % % % % % % % % % % % % % % % % 

load('pos_1_1.mat', 'pos');
C1_1 = pos;
load('pos_1_2.mat', 'pos');
C1_2 = pos;
load('pos_1_3.mat', 'pos');
C1_3 = pos;
load('pos_1_4.mat', 'pos');
C1_4 = pos;

load('pos_2_1.mat', 'pos');
C2_1 = pos;
load('pos_2_2.mat', 'pos');
C2_2 = pos;
load('pos_2_3.mat', 'pos');
C2_3 = pos;
load('pos_2_4.mat', 'pos');
C2_4 = pos;

load('pos_3_1.mat', 'pos');
C3_1 = pos;
load('pos_3_2.mat', 'pos');
C3_2 = pos;
load('pos_3_3.mat', 'pos');
C3_3 = pos;
load('pos_3_4.mat', 'pos');
C3_4 = pos;

load('pos_4_1.mat', 'pos');
C4_1 = pos;
load('pos_4_2.mat', 'pos');
C4_2 = pos;
load('pos_4_3.mat', 'pos');
C4_3 = pos;
load('pos_4_4.mat', 'pos');
C4_4 = pos;


C_Time1_1   = C1_1(1,:)*1000 + 30; % A_1_1
C_Time1_2   = C1_2(1,:)*1000 + 80; % A_1_2
C_Time1_3   = C1_3(1,:)*1000 + 66; % A_1_3
C_Time1_4   = C1_4(1,:)*1000 ; % A_1_4

C_Time2_1   = C2_1(1,:)*1000 +35; % A_2_1
C_Time2_2   = C2_2(1,:)*1000 +60; % A_2_2
C_Time2_3   = C2_3(1,:)*1000 +40; % A_2_3
C_Time2_4   = C2_4(1,:)*1000 +88; % A_2_4


C_Time3_1   = C3_1(1,:)*1000 + 90; % A_3_1
C_Time3_2   = C3_2(1,:)*1000 + 30; % A_3_2
C_Time3_3   = C3_3(1,:)*1000 + 80; % A_3_3
C_Time3_4   = C3_4(1,:)*1000 + 40; % A_3_4


C_Time4_1   = C4_1(1,:)*1000 + 60; % A_4_1
C_Time4_2   = C4_2(1,:)*1000 + 27; % A_4_2
C_Time4_3   = C4_3(1,:)*1000 + 40; % A_4_3
C_Time4_4   = C4_4(1,:)*1000 + 20; % A_4_4


C_Time1_1 = C_Time1_1 / 1000;
C_Time1_2 = C_Time1_2 / 1000;
C_Time1_3 = C_Time1_3 / 1000;
C_Time1_4 = C_Time1_4 / 1000;

C_Time2_1 = C_Time2_1 / 1000;
C_Time2_2 = C_Time2_2 / 1000;
C_Time2_3 = C_Time2_3 / 1000;
C_Time2_4 = C_Time2_4 / 1000;

C_Time3_1 = C_Time3_1 / 1000;
C_Time3_2 = C_Time3_2 / 1000;
C_Time3_3 = C_Time3_3 / 1000;
C_Time3_4 = C_Time3_4 / 1000;

C_Time4_1 = C_Time4_1 / 1000;
C_Time4_2 = C_Time4_2 / 1000;
C_Time4_3 = C_Time4_3 / 1000;
C_Time4_4 = C_Time4_4 / 1000;

C_PosRef1_1  = C1_1(3,:); 
C_PosFb1_1  = C1_1(2,:); 
C_PosErr1_1 = C_PosRef1_1 - C_PosFb1_1;
% C_PosErr_exp_sim1_1 = 
C_PosRef1_2  = C1_2(3,:); 
C_PosFb1_2  = C1_2(2,:); 
C_PosErr1_2 = C_PosRef1_2 - C_PosFb1_2;
C_PosRef1_3  = C1_3(3,:); 
C_PosFb1_3  = C1_3(2,:); 
C_PosErr1_3 = C_PosRef1_3 - C_PosFb1_3;
C_PosRef1_4  = C1_4(3,:); 
C_PosFb1_4  = C1_4(2,:); 
C_PosErr1_4 = C_PosRef1_4 - C_PosFb1_4;

C_PosRef2_1  = C2_1(3,:); 
C_PosFb2_1  = C2_1(2,:); 
C_PosErr2_1 = C_PosRef2_1 - C_PosFb2_1;
C_PosRef2_2  = C2_2(3,:); 
C_PosFb2_2  = C2_2(2,:); 
C_PosErr2_2 = C_PosRef2_2 - C_PosFb2_2;
C_PosRef2_3  = C2_3(3,:); 
C_PosFb2_3  = C2_3(2,:); 
C_PosErr2_3 = C_PosRef2_3 - C_PosFb2_3;
C_PosRef2_4  = C2_4(3,:); 
C_PosFb2_4  = C2_4(2,:); 
C_PosErr2_4 = C_PosRef2_4 - C_PosFb2_4;

C_PosRef3_1  = C3_1(3,:); 
C_PosFb3_1  = C3_1(2,:); 
C_PosErr3_1 = C_PosRef3_1 - C_PosFb3_1;
% C_PosErr_exp_sim3_1 = 
C_PosRef3_2  = C3_2(3,:); 
C_PosFb3_2  = C3_2(2,:); 
C_PosErr3_2 = C_PosRef3_2 - C_PosFb3_2;
C_PosRef3_3  = C3_3(3,:); 
C_PosFb3_3  = C3_3(2,:); 
C_PosErr3_3 = C_PosRef3_3 - C_PosFb3_3;
C_PosRef3_4  = C3_4(3,:); 
C_PosFb3_4  = C3_4(2,:); 
C_PosErr3_4 = C_PosRef3_4 - C_PosFb3_4;


C_PosRef4_1  = C4_1(3,:); 
C_PosFb4_1  = C4_1(2,:); 
C_PosErr4_1 = C_PosRef4_1 - C_PosFb4_1;
% C_PosErr_exp_sim4_1 = 
C_PosRef4_2  = C4_2(3,:); 
C_PosFb4_2  = C4_2(2,:); 
C_PosErr4_2 = C_PosRef4_2 - C_PosFb4_2;
C_PosRef4_3  = C4_3(3,:); 
C_PosFb4_3  = C4_3(2,:); 
C_PosErr4_3 = C_PosRef4_3 - C_PosFb4_3;
C_PosRef4_4  = C4_4(3,:); 
C_PosFb4_4  = C4_4(2,:); 
C_PosErr4_4 = C_PosRef4_4 - C_PosFb4_4;



A_Time1_1   = A1_1(:,1)*0.01;
A_PosRef1_1 = A1_1(:,2)*0.025 * -1;
A_PosFb1_1  = A1_1(:,3)*0.025 * -1;
A_Vel1_1    = A1_1(:,5)* -1 * 4.88; %RPM
A_PosErr1_1 = A_PosRef1_1 - A_PosFb1_1;

A_Time1_2   = A1_2(:,1)*0.01;
A_PosRef1_2 = A1_2(:,2)*0.025 * -1;
A_PosFb1_2  = A1_2(:,3)*0.025 * -1;
A_Vel1_2    = A1_2(:,5)* -1 * 4.88; %RPM
A_PosErr1_2 = A_PosRef1_2 - A_PosFb1_2;

A_Time1_3   = A1_3(:,1)*0.01;
A_PosRef1_3 = A1_3(:,2)*0.025 * -1;
A_PosFb1_3  = A1_3(:,3)*0.025 * -1;
A_Vel1_3  = A1_3(:,5)* -1 * 4.88; %RPM
A_PosErr1_3 = A_PosRef1_3 - A_PosFb1_3;

A_Time1_4   = A1_4(:,1)*0.01;
A_PosRef1_4 = A1_4(:,2)*0.025 * -1;
A_PosFb1_4  = A1_4(:,3)*0.025 * -1;
A_Vel1_4    = A1_4(:,5)* -1 * 4.88; %RPM
A_PosErr1_4 = A_PosRef1_4 - A_PosFb1_4;

A_Time2_1   = A2_1(:,1)*0.01;
A_PosRef2_1 = A2_1(:,2)*0.025 * -1;
A_PosFb2_1  = A2_1(:,3)*0.025 * -1;
A_Vel2_1    = A2_1(:,5)* -1 * 4.88; %RPM
A_PosErr2_1 = A_PosRef2_1 - A_PosFb2_1;

A_Time2_2   = A2_2(:,1)*0.01;
A_PosRef2_2 = A2_2(:,2)*0.025 * -1;
A_PosFb2_2  = A2_2(:,3)*0.025 * -1;
A_Vel2_2    = A2_2(:,5)* -1 * 4.88; %RPM
A_PosErr2_2 = A_PosRef2_2 - A_PosFb2_2;

A_Time2_3   = A2_3(:,1)*0.01;
A_PosRef2_3 = A2_3(:,2)*0.025 * -1;
A_PosFb2_3  = A2_3(:,3)*0.025 * -1;
A_Vel2_3  = A2_3(:,5)* -1 * 4.88; %RPM
A_PosErr2_3 = A_PosRef2_3 - A_PosFb2_3;

A_Time2_4   = A2_4(:,1)*0.01;
A_PosRef2_4 = A2_4(:,2)*0.025 * -1;
A_PosFb2_4  = A2_4(:,3)*0.025 * -1;
A_Vel2_4    = A2_4(:,5)* -1 * 4.88; %RPM
A_PosErr2_4 = A_PosRef2_4 - A_PosFb2_4;

A_Time3_1   = A3_1(:,1)*0.01;
A_PosRef3_1 = A3_1(:,2)*0.025 * -1;
A_PosFb3_1  = A3_1(:,3)*0.025 * -1;
A_Vel3_1    = A3_1(:,5)* -1 * 4.88; %RPM
A_PosErr3_1 = A_PosRef3_1 - A_PosFb3_1;

A_Time3_2   = A3_2(:,1)*0.01;
A_PosRef3_2 = A3_2(:,2)*0.025 * -1;
A_PosFb3_2  = A3_2(:,3)*0.025 * -1;
A_Vel3_2    = A3_2(:,5)* -1 * 4.88; %RPM
A_PosErr3_2 = A_PosRef3_2 - A_PosFb3_2;

A_Time3_3   = A3_3(:,1)*0.01;
A_PosRef3_3 = A3_3(:,2)*0.025 * -1;
A_PosFb3_3  = A3_3(:,3)*0.025 * -1;
A_Vel3_3  = A3_3(:,5)* -1 * 4.88; %RPM
A_PosErr3_3 = A_PosRef3_3 - A_PosFb3_3;

A_Time3_4   = A3_4(:,1)*0.01;
A_PosRef3_4 = A3_4(:,2)*0.025 * -1;
A_PosFb3_4  = A3_4(:,3)*0.025 * -1;
A_Vel3_4    = A3_4(:,5)* -1 * 4.88; %RPM
A_PosErr3_4 = A_PosRef3_4 - A_PosFb3_4;





A_Time4_1   = A4_1(:,1)*0.01;
A_PosRef4_1 = A4_1(:,2)*0.025 * -1;
A_PosFb4_1  = A4_1(:,3)*0.025 * -1;
A_Vel4_1    = A4_1(:,5)* -1 * 4.88; %RPM
A_PosErr4_1 = A_PosRef4_1 - A_PosFb4_1;

A_Time4_2   = A4_2(:,1)*0.01;
A_PosRef4_2 = A4_2(:,2)*0.025 * -1;
A_PosFb4_2  = A4_2(:,3)*0.025 * -1;
A_Vel4_2    = A4_2(:,5)* -1 * 4.88; %RPM
A_PosErr4_2 = A_PosRef4_2 - A_PosFb4_2;

A_Time4_3   = A4_3(:,1)*0.01;
A_PosRef4_3 = A4_3(:,2)*0.025 * -1;
A_PosFb4_3  = A4_3(:,3)*0.025 * -1;
A_Vel4_3  = A4_3(:,5)* -1 * 4.88; %RPM
A_PosErr4_3 = A_PosRef4_3 - A_PosFb4_3;

A_Time4_4   = A4_4(:,1)*0.01;
A_PosRef4_4 = A4_4(:,2)*0.025 * -1;
A_PosFb4_4  = A4_4(:,3)*0.025 * -1;
A_Vel4_4    = A4_4(:,5)* -1 * 4.88; %RPM
A_PosErr4_4 = A_PosRef4_4 - A_PosFb4_4;



t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
A_PosErr1_1_NEW= interp1(A_Time1_1, A_PosErr1_1, C_Time1_1);
A_PosErr1_1_between = A_PosErr1_1_NEW - C_PosErr1_1;
plot(C_Time1_1, A_PosErr1_1_between, '-r', 'LineWidth', 1);

A_PosErr2_1_NEW= interp1(A_Time2_1, A_PosErr2_1, C_Time2_1);
A_PosErr2_1_between = A_PosErr2_1_NEW - C_PosErr2_1;
plot(C_Time2_1, A_PosErr2_1_between, '-g', 'LineWidth', 1);

A_PosErr3_1_NEW= interp1(A_Time3_1, A_PosErr3_1, C_Time3_1);
A_PosErr3_1_between = A_PosErr3_1_NEW - C_PosErr3_1;
plot(C_Time3_1, A_PosErr3_1_between, '-b', 'LineWidth', 1);

A_PosErr4_1_NEW= interp1(A_Time4_1, A_PosErr4_1, C_Time4_1);
A_PosErr4_1_between = A_PosErr4_1_NEW - C_PosErr4_1;
plot(C_Time4_1, A_PosErr4_1_between, '-k', 'LineWidth', 1); 

xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N');

title('a');
ylim([-2 10])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_2_NEW= interp1(A_Time1_2, A_PosErr1_2, C_Time1_2);
A_PosErr1_2_between = A_PosErr1_2_NEW - C_PosErr1_2;
plot(C_Time1_2, A_PosErr1_2_between, '-r', 'LineWidth', 1);

A_PosErr2_2_NEW= interp1(A_Time2_2, A_PosErr2_2, C_Time2_2);
size(A_PosErr2_2_NEW)
size(C_PosErr2_2)
A_PosErr2_2_between = A_PosErr2_2_NEW - C_PosErr2_2;
plot(C_Time2_2, A_PosErr2_2_between, '-g', 'LineWidth', 1);

A_PosErr3_2_NEW= interp1(A_Time3_2, A_PosErr3_2, C_Time3_2);
A_PosErr3_2_between = A_PosErr3_2_NEW - C_PosErr3_2;
plot(C_Time3_2, A_PosErr3_2_between, '-b', 'LineWidth', 1);

A_PosErr4_2_NEW= interp1(A_Time4_2, A_PosErr4_2, C_Time4_2);
A_PosErr4_2_between = A_PosErr4_2_NEW - C_PosErr4_2;
plot(C_Time4_2, A_PosErr4_2_between, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N');

title('b');
ylim([-2 10])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_3_NEW= interp1(A_Time1_3, A_PosErr1_3, C_Time1_3);
A_PosErr1_3_between = A_PosErr1_3_NEW - C_PosErr1_3;
plot(C_Time1_3, A_PosErr1_3_between, '-r', 'LineWidth', 1);

A_PosErr2_3_NEW= interp1(A_Time2_3, A_PosErr2_3, C_Time2_3);
A_PosErr2_3_between = A_PosErr2_3_NEW - C_PosErr2_3;
plot(C_Time2_3, A_PosErr2_3_between, '-g', 'LineWidth', 1);

A_PosErr3_3_NEW= interp1(A_Time3_3, A_PosErr3_3, C_Time3_3);
A_PosErr3_3_between = A_PosErr3_3_NEW - C_PosErr3_3;
plot(C_Time3_3, A_PosErr3_3_between, '-b', 'LineWidth', 1);

A_PosErr4_3_NEW= interp1(A_Time4_3, A_PosErr4_3, C_Time4_3);
A_PosErr4_3_between = A_PosErr4_3_NEW - C_PosErr4_3;
plot(C_Time4_3, A_PosErr4_3_between, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N');

title('c');
ylim([-2 10])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_4_NEW= interp1(A_Time1_4, A_PosErr1_4, C_Time1_4);
A_PosErr1_4_between = A_PosErr1_4_NEW - C_PosErr1_4;
plot(C_Time1_4, A_PosErr1_4_between, '-r', 'LineWidth', 1);

A_PosErr2_4_NEW= interp1(A_Time2_4, A_PosErr2_4, C_Time2_4);
A_PosErr2_4_between = A_PosErr2_4_NEW - C_PosErr2_4;
plot(C_Time2_4, A_PosErr2_4_between, '-g', 'LineWidth', 1);

A_PosErr3_4_NEW= interp1(A_Time3_4, A_PosErr3_4, C_Time3_4);
A_PosErr3_4_between = A_PosErr3_4_NEW - C_PosErr3_4;
plot(C_Time3_4, A_PosErr3_4_between, '-b', 'LineWidth', 1);

A_PosErr4_4_NEW= interp1(A_Time4_4, A_PosErr4_4, C_Time4_4);
A_PosErr4_4_between = A_PosErr4_4_NEW - C_PosErr4_4;
plot(C_Time4_4, A_PosErr4_4_between, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N');


title('d');
ylim([-2 10])  
xlim([0 25])
grid on
grid minor
hold off 


% m_1_1 = max(A_PosErr1_1_between) / 12.5 * 100
% m_1_2 = max(A_PosErr1_2_between) / 12.5 * 100
% m_1_3 = max(A_PosErr1_3_between) / 12.5 * 100
% m_1_4 = max(A_PosErr1_4_between) / 12.5 * 100
% 
% m_2_1 = max(A_PosErr2_1_between) / 25 * 100
% m_2_2 = max(A_PosErr2_2_between) / 25 * 100
% m_2_3 = max(A_PosErr2_3_between) / 25 * 100
% m_2_4 = max(A_PosErr2_4_between) / 25 * 100
% 
% m_3_1 = max(A_PosErr3_1_between) / 37.5 * 100
% m_3_2 = max(A_PosErr3_2_between) / 37.5 * 100
% m_3_3 = max(A_PosErr3_3_between) / 37.5 * 100
% m_3_4 = max(A_PosErr3_4_between) / 37.5 * 100
% 
% m_4_1 = max(A_PosErr4_1_between) / 50 * 100
% m_4_2 = max(A_PosErr4_2_between) / 50 * 100
% m_4_3 = max(A_PosErr4_3_between) / 50 * 100
% m_4_4 = max(A_PosErr4_4_between) / 50 * 100

% A_PosErr1_1_between = abs(rmmissing(A_PosErr1_1_between));
% m_1_1 = mean(A_PosErr1_1_between, 'all') / 12.5 * 100
% A_PosErr2_1_between = abs(rmmissing(A_PosErr2_1_between));
% m_2_1 = mean(A_PosErr2_1_between, 'all') / 12.5 * 100
% A_PosErr3_1_between = abs(rmmissing(A_PosErr3_1_between));
% m_3_1 = mean(A_PosErr3_1_between, 'all') / 12.5 * 100
% A_PosErr4_1_between = abs(rmmissing(A_PosErr4_1_between));
% m_4_1 = mean(A_PosErr4_1_between, 'all') / 12.5 * 100
% 
% A_PosErr1_2_between = abs(rmmissing(A_PosErr1_2_between));
% m_1_2 = mean(A_PosErr1_2_between, 'all') / 25 * 100
% A_PosErr2_2_between = abs(rmmissing(A_PosErr2_2_between));
% m_2_2 = mean(A_PosErr2_2_between, 'all') / 25 * 100
% A_PosErr3_2_between = abs(rmmissing(A_PosErr3_2_between));
% m_3_2 = mean(A_PosErr3_2_between, 'all') / 25 * 100
% A_PosErr4_2_between = abs(rmmissing(A_PosErr4_2_between));
% m_4_2 = mean(A_PosErr4_2_between, 'all') / 25 * 100
% 
% A_PosErr1_3_between = abs(rmmissing(A_PosErr1_3_between));
% m_1_3 = mean(A_PosErr1_3_between, 'all') / 37.5 * 100
% A_PosErr2_3_between = abs(rmmissing(A_PosErr2_3_between));
% m_2_3 = mean(A_PosErr2_3_between, 'all') / 37.5 * 100
% A_PosErr3_3_between = abs(rmmissing(A_PosErr3_3_between));
% m_3_3 = mean(A_PosErr3_3_between, 'all') / 37.5 * 100
% A_PosErr4_3_between = abs(rmmissing(A_PosErr4_3_between));
% m_4_3 = mean(A_PosErr4_3_between, 'all') / 37.5 * 100
% 
% 
A_PosErr1_4_between = abs(rmmissing(A_PosErr1_4_between));
m_1_4 = mean(A_PosErr1_4_between, 'all') / 50 * 100
A_PosErr2_4_between = abs(rmmissing(A_PosErr2_4_between));
m_2_4 = mean(A_PosErr2_4_between, 'all') / 50 * 100
A_PosErr3_4_between = abs(rmmissing(A_PosErr3_4_between));
m_3_4 = mean(A_PosErr3_4_between, 'all') / 50 * 100
A_PosErr4_4_between = abs(rmmissing(A_PosErr4_4_between));
m_4_4 = mean(A_PosErr4_4_between, 'all') / 50 * 100




% m_1_1 = max(A_PosErr1_1_between) / 12.5 * 100
% m_2_1 = max(A_PosErr2_1_between) / 12.5 * 100 
% m_3_1 = max(A_PosErr3_1_between) / 12.5 * 100
% m_4_1 = max(A_PosErr4_1_between) / 12.5 * 100

% m_1_2 = max(A_PosErr1_2_between) / 25 * 100
% m_2_2 = max(A_PosErr2_2_between) / 25 * 100
% m_3_2 = max(A_PosErr3_2_between) / 25 * 100
% m_4_2 = max(A_PosErr4_2_between) / 25 * 100

% m_1_3 = max(A_PosErr1_3_between) / 37.5 * 100
% m_2_3 = max(A_PosErr2_3_between) / 37.5 * 100
% m_3_3 = max(A_PosErr3_3_between) / 37.5 * 100
% m_4_3 = max(A_PosErr4_3_between) / 37.5 * 100
% 
% m_1_4 = max(A_PosErr1_4_between) / 50 * 100
% m_2_4 = max(A_PosErr2_4_between) / 50 * 100
% m_3_4 = max(A_PosErr3_4_between) / 50 * 100
% m_4_4 = max(A_PosErr4_4_between) / 50 * 100 


