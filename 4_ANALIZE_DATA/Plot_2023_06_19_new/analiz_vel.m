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

%vel % % % % % % % % % % % % % % % % % % % % % 

load('vel_1_1.mat', 'vel');
C1_1 = vel;
load('vel_1_2.mat', 'vel');
C1_2 = vel;
load('vel_1_3.mat', 'vel');
C1_3 = vel;
load('vel_1_4.mat', 'vel');
C1_4 = vel;

load('vel_2_1.mat', 'vel');
C2_1 = vel;
load('vel_2_2.mat', 'vel');
C2_2 = vel;
load('vel_2_3.mat', 'vel');
C2_3 = vel;
load('vel_2_4.mat', 'vel');
C2_4 = vel;

load('vel_3_1.mat', 'vel');
C3_1 = vel;
load('vel_3_2.mat', 'vel');
C3_2 = vel;
load('vel_3_3.mat', 'vel');
C3_3 = vel;
load('vel_3_4.mat', 'vel');
C3_4 = vel;





C_Time1_1   = C1_1(1,:)*1000 + 5; % A_1_1
C_Time1_2   = C1_2(1,:)*1000 + 65; % A_1_2
C_Time1_3   = C1_3(1,:)*1000 + 35; % A_1_3
C_Time1_4   = C1_4(1,:)*1000 +40; % A_1_4

C_Time2_1   = C2_1(1,:)*1000 + 69; % A_2_1
C_Time2_2   = C2_2(1,:)*1000 + 81; % A_2_2
C_Time2_3   = C2_3(1,:)*1000 + 14; % A_2_3
C_Time2_4   = C2_4(1,:)*1000  + 30; % A_2_4

C_Time3_1   = C3_1(1,:)*1000 + 28; % A_3_1
C_Time3_2   = C3_2(1,:)*1000 + 65; % A_3_2
C_Time3_3   = C3_3(1,:)*1000 + 68; % A_3_3
C_Time3_4   = C3_4(1,:)*1000 +80; % A_3_4
% C_Time   = C(1,:)*1000 + 80; % A_3_4_45

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

C_Vel1_1   = C1_1(2,:)*1000 + 5; % A_1_1
C_Vel1_2   = C1_2(2,:)*1000 + 65; % A_1_2
C_Vel1_3   = C1_3(2,:)*1000 + 35; % A_1_3
C_Vel1_4   = C1_4(2,:)*1000 +40; % A_1_4

C_Vel2_1   = C2_1(2,:)*1000 + 69; % A_2_1
C_Vel2_2   = C2_2(2,:)*1000 + 81; % A_2_2
C_Vel2_3   = C2_3(2,:)*1000 + 14; % A_2_3
C_Vel2_4   = C2_4(2,:)*1000  + 30; % A_2_4

C_Vel3_1   = C3_1(2,:)*1000 + 28; % A_3_1
C_Vel3_2   = C3_2(2,:)*1000 + 65; % A_3_2
C_Vel3_3   = C3_3(2,:)*1000 + 68; % A_3_3
C_Vel3_4   = C3_4(2,:)*1000 +80; % A_3_4
% C_Vel   = C(2,:)*1000 + 80; % A_3_4_45




A_Time1_1   = A1_1(:,1)*0.01;
A_Vel1_1    = A1_1(:,5)* -1 * 4.88; %RPM

A_Time1_2   = A1_2(:,1)*0.01;
A_Vel1_2    = A1_2(:,5)* -1 * 4.88; %RPM

A_Time1_3   = A1_3(:,1)*0.01;
A_Vel1_3  = A1_3(:,5)* -1 * 4.88; %RPM

A_Time1_4   = A1_4(:,1)*0.01;
A_Vel1_4    = A1_4(:,5)* -1 * 4.88; %RPM

A_Time2_1   = A2_1(:,1)*0.01;
A_Vel2_1    = A2_1(:,5)* -1 * 4.88; %RPM

A_Time2_2   = A2_2(:,1)*0.01;
A_Vel2_2    = A2_2(:,5)* -1 * 4.88; %RPM

A_Time2_3   = A2_3(:,1)*0.01;
A_Vel2_3  = A2_3(:,5)* -1 * 4.88; %RPM

A_Time2_4   = A2_4(:,1)*0.01;
A_Vel2_4    = A2_4(:,5)* -1 * 4.88; %RPM

A_Time3_1   = A3_1(:,1)*0.01;
A_Vel3_1    = A3_1(:,5)* -1 * 4.88; %RPM

A_Time3_2   = A3_2(:,1)*0.01;
A_Vel3_2    = A3_2(:,5)* -1 * 4.88; %RPM

A_Time3_3   = A3_3(:,1)*0.01;
A_Vel3_3  = A3_3(:,5)* -1 * 4.88; %RPM

A_Time3_4   = A3_4(:,1)*0.01;
A_Vel3_4    = A3_4(:,5)* -1 * 4.88; %RPM


A_Time4_1   = A4_1(:,1)*0.01;
A_Vel4_1    = A4_1(:,5)* -1 * 4.88; %RPM

A_Time4_2   = A4_2(:,1)*0.01;
A_Vel4_2    = A4_2(:,5)* -1 * 4.88; %RPM

A_Time4_3   = A4_3(:,1)*0.01;
A_Vel4_3  = A4_3(:,5)* -1 * 4.88; %RPM

A_Time4_4   = A4_4(:,1)*0.01;
A_Vel4_4    = A4_4(:,5)* -1 * 4.88; %RPM



t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
plot(A_Time1_1, A_Vel1_1, '-r', 'LineWidth', 1);
plot(A_Time2_1, A_Vel2_1, '-g', 'LineWidth', 1);
plot(A_Time3_1, A_Vel3_1, '-b', 'LineWidth', 1);
plot(A_Time4_1, A_Vel4_1, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Angular velocity, [rpm]');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');

title('a');
ylim([-2000 3000])
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_2, A_Vel1_2, '-r', 'LineWidth', 1);
plot(A_Time2_2, A_Vel2_2, '-g', 'LineWidth', 1);
plot(A_Time3_2, A_Vel3_2, '-b', 'LineWidth', 1);
plot(A_Time4_2, A_Vel4_2, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Angular velocity, [rpm]');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');

title('b');
ylim([-2000 3000])
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_3, A_Vel1_3, '-r', 'LineWidth', 1);
plot(A_Time2_3, A_Vel2_3, '-g', 'LineWidth', 1);
plot(A_Time3_3, A_Vel3_3, '-b', 'LineWidth', 1);
plot(A_Time4_3, A_Vel4_3, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Angular velocity, [rpm]');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');

title('c');
ylim([-2000 3000])
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_4, A_Vel1_4, '-r', 'LineWidth', 1);
plot(A_Time2_4, A_Vel2_4, '-g', 'LineWidth', 1);
plot(A_Time3_4, A_Vel3_4, '-b', 'LineWidth', 1);
plot(A_Time4_4, A_Vel4_4, '-k', 'LineWidth', 1);

xlabel('Time, [s]'); 
ylabel('Angular velocity, [rpm]');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');

title('d');
ylim([-2000 3000])
xlim([0 25])
grid on
grid minor
hold off 



% size(A_Vel1_1)
% [row_, col_] = size(C_PosRef1_1);
% error_array(size(C_PosRef1_1)) = 0;
% for i = 1:col_
%     x = A_Vel1_1(i) /C_Vel1_1(i);
%     if x <= 1 & x>=-1
%     error_array(i) = x;
%     else
%     error_array(i) = 0;
%     end
% end
% 
% plot(C_Time1_1, A_Vel1_1, '-b', 'LineWidth', 1);
% plot(C_Time1_1, error_array*100, '-r', 'LineWidth', 1);
% plot(C_Time1_1, absolut_error , '--r', 'LineWidth', 1);
% ylabel('Displacement error, [%]');


