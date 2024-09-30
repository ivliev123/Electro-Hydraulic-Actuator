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



% map = [0 0 0         %---> 1st color 
%        1 0 0         %---> 2nd color
%        0 1 0         %---> 3rd color
%        0 0 1         %---> 4th color
%        1 0.5 1       %---> 5th color
%        0.2 0.5 0.75  %---> 6th color
%        0.5 0.3 0.8]; %---> 7th color
% plot(A_Time4_1, A_PosErr1_4, 'Color',colormap(map(3, :)), 'LineWidth', 1);


map = { '#e41a1c',
        '#377eb8',
        '#4daf4a',
        '#984ea3',
        '#ff7f00',
        '#40E0D0',
        '#a65628',
        '#f781bf'};
    
map_2 = validatecolor(map, 'multiple')

t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 


plot(A_Time1_1, A_PosErr1_1, 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time1_2, A_PosErr1_2, 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time1_3, A_PosErr1_3, 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time1_4, A_PosErr1_4, 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time1_1, C_PosErr1_1, "--", 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time1_2, C_PosErr1_2, "--", 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time1_3, C_PosErr1_3, "--", 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time1_4, C_PosErr1_4, "--", 'Color',colormap(map_2(8,:)), 'LineWidth', 1);


xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p 12.5 mm. ', 'X_e_x_p 25 mm.',  'X_e_x_p 37.5 mm.', 'X_e_x_p 50 mm.', 'X_s_i_m 12.5 mm. ', 'X_s_i_m 25 mm.',  'X_s_i_m 37.5 mm.',  'X_s_i_m 50 mm.');

title('a');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time2_1, A_PosErr2_1, 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time2_2, A_PosErr2_2, 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time2_3, A_PosErr2_3, 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time2_4, A_PosErr2_4, 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time2_1, C_PosErr2_1, "--", 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time2_2, C_PosErr2_2, "--", 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time2_3, C_PosErr2_3, "--", 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time2_4, C_PosErr2_4, "--", 'Color',colormap(map_2(8,:)), 'LineWidth', 1);


xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p 12.5 mm. ', 'X_e_x_p 25 mm.',  'X_e_x_p 37.5 mm.', 'X_e_x_p 50 mm.', 'X_s_i_m 12.5 mm. ', 'X_s_i_m 25 mm.',  'X_s_i_m 37.5 mm.',  'X_s_i_m 50 mm.');


title('b');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time3_1, A_PosErr3_1, 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time3_2, A_PosErr3_2, 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time3_3, A_PosErr3_3, 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time3_4, A_PosErr3_4, 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time3_1, C_PosErr3_1, "--", 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time3_2, C_PosErr3_2, "--", 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time3_3, C_PosErr3_3, "--", 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time3_4, C_PosErr3_4, "--", 'Color',colormap(map_2(8,:)), 'LineWidth', 1);


xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p 12.5 mm. ', 'X_e_x_p 25 mm.',  'X_e_x_p 37.5 mm.', 'X_e_x_p 50 mm.', 'X_s_i_m 12.5 mm. ', 'X_s_i_m 25 mm.',  'X_s_i_m 37.5 mm.',  'X_s_i_m 50 mm.');


title('c');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time4_1, A_PosErr4_1, 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time4_2, A_PosErr4_2, 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time4_3, A_PosErr4_3, 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time4_4, A_PosErr4_4, 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time4_1, C_PosErr4_1, "--", 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time4_2, C_PosErr4_2, "--", 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time4_3, C_PosErr4_3, "--", 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time4_4, C_PosErr4_4, "--", 'Color',colormap(map_2(8,:)), 'LineWidth', 1);


xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p 12.5 mm. ', 'X_e_x_p 25 mm.',  'X_e_x_p 37.5 mm.', 'X_e_x_p 50 mm.', 'X_s_i_m 12.5 mm. ', 'X_s_i_m 25 mm.',  'X_s_i_m 37.5 mm.',  'X_s_i_m 50 mm.');


title('d');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 



