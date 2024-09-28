clc;
clear all;

A_filename = 'M_eksp_1_1_vel.csv';
A1_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_2_vel.csv';
A1_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_3_vel.csv';
A1_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_4_vel.csv';
A1_4 = dlmread(A_filename, ';', 1, 0);

A_filename = 'M_eksp_2_1_vel.csv';
A2_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_2_vel.csv';
A2_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_3_vel.csv';
A2_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_4_vel.csv';
A2_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_3_1_vel.csv';
A3_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_2_vel.csv';
A3_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_3_vel.csv';
A3_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_4_vel.csv';
A3_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_4_1_vel.csv';
A4_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_2_vel.csv';
A4_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_3_vel.csv';
A4_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_4_vel.csv';
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





C_Time1_1 = C1_1(1,:)*1000 + 5; % A_1_1
C_Time1_2 = C1_2(1,:)*1000 + 65; % A_1_2
C_Time1_3 = C1_3(1,:)*1000 + 35; % A_1_3
C_Time1_4 = C1_4(1,:)*1000 +40; % A_1_4

C_Time2_1 = C2_1(1,:)*1000 + 69; % A_2_1
C_Time2_2 = C2_2(1,:)*1000 + 81; % A_2_2
C_Time2_3 = C2_3(1,:)*1000 + 14; % A_2_3
C_Time2_4 = C2_4(1,:)*1000 + 30; % A_2_4

C_Time3_1 = C3_1(1,:)*1000 + 28; % A_3_1
C_Time3_2 = C3_2(1,:)*1000 + 65; % A_3_2
C_Time3_3 = C3_3(1,:)*1000 + 68; % A_3_3
C_Time3_4 = C3_4(1,:)*1000 +80; % A_3_4
% C_Time = C(1,:)*1000 + 80; % A_3_4_45

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

C_Vel1_1 = C1_1(2,:)*1000 + 5; % A_1_1
C_Vel1_2 = C1_2(2,:)*1000 + 65; % A_1_2
C_Vel1_3 = C1_3(2,:)*1000 + 35; % A_1_3
C_Vel1_4 = C1_4(2,:)*1000 +40; % A_1_4

C_Vel2_1 = C2_1(2,:)*1000 + 69; % A_2_1
C_Vel2_2 = C2_2(2,:)*1000 + 81; % A_2_2
C_Vel2_3 = C2_3(2,:)*1000 + 14; % A_2_3
C_Vel2_4 = C2_4(2,:)*1000 + 30; % A_2_4

C_Vel3_1 = C3_1(2,:)*1000 + 28; % A_3_1
C_Vel3_2 = C3_2(2,:)*1000 + 65; % A_3_2
C_Vel3_3 = C3_3(2,:)*1000 + 68; % A_3_3
C_Vel3_4 = C3_4(2,:)*1000 +80; % A_3_4
% C_Vel = C(2,:)*1000 + 80; % A_3_4_45




A_Time1_1 = A1_1(:,1)*0.01;
A_Vel1_1 = A1_1(:,5)* -1 * 4.88; %RPM

A_Time1_2 = A1_2(:,1)*0.01;
A_Vel1_2 = A1_2(:,5)* -1 * 4.88; %RPM

A_Time1_3 = A1_3(:,1)*0.01;
A_Vel1_3 = A1_3(:,5)* -1 * 4.88; %RPM

A_Time1_4 = A1_4(:,1)*0.01;
A_Vel1_4 = A1_4(:,5)* -1 * 4.88; %RPM

A_Time2_1 = A2_1(:,1)*0.01;
A_Vel2_1 = A2_1(:,5)* -1 * 4.88; %RPM

A_Time2_2 = A2_2(:,1)*0.01;
A_Vel2_2 = A2_2(:,5)* -1 * 4.88; %RPM

A_Time2_3 = A2_3(:,1)*0.01;
A_Vel2_3 = A2_3(:,5)* -1 * 4.88; %RPM

A_Time2_4 = A2_4(:,1)*0.01;
A_Vel2_4 = A2_4(:,5)* -1 * 4.88; %RPM

A_Time3_1 = A3_1(:,1)*0.01;
A_Vel3_1 = A3_1(:,5)* -1 * 4.88; %RPM

A_Time3_2 = A3_2(:,1)*0.01;
A_Vel3_2 = A3_2(:,5)* -1 * 4.88; %RPM

A_Time3_3 = A3_3(:,1)*0.01;
A_Vel3_3 = A3_3(:,5)* -1 * 4.88; %RPM

A_Time3_4 = A3_4(:,1)*0.01;
A_Vel3_4 = A3_4(:,5)* -1 * 4.88; %RPM


A_Time4_1 = A4_1(:,1)*0.01;
A_Vel4_1 = A4_1(:,5)* -1 * 4.88; %RPM

A_Time4_2 = A4_2(:,1)*0.01;
A_Vel4_2 = A4_2(:,5)* -1 * 4.88; %RPM

A_Time4_3 = A4_3(:,1)*0.01;
A_Vel4_3 = A4_3(:,5)* -1 * 4.88; %RPM

A_Time4_4 = A4_4(:,1)*0.01;
A_Vel4_4 = A4_4(:,5)* -1 * 4.88; %RPM

map = { '#808080',
 '#323232',
 '#CECECE',
 '#000000',
 '#ff7f00',
 '#40E0D0',
 '#a65628',
 '#f781bf'};
 
map_2 = validatecolor(map, 'multiple')

t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
plot(A_Time1_1, A_Vel1_1, '-k', 'LineWidth', 0.5);
plot(A_Time2_1, A_Vel2_1, '--k', 'LineWidth', 0.5);
plot(A_Time3_1, A_Vel3_1, ':k', 'LineWidth', 0.5);
% plot(A_Time4_1, A_Vel4_1, '-ok', 'LineWidth', 0.5);
plot(A_Time4_1, A_Vel4_1, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_1), 'LineWidth', 0.5);


% plot(A_Time1_1, A_Vel1_1, '-r', 'LineWidth', 0.25);
% plot(A_Time2_1, A_Vel2_1, '-g', 'LineWidth', 0.25);
% plot(A_Time3_1, A_Vel3_1, '--b', 'LineWidth', 0.25);
% plot(A_Time4_1, A_Vel4_1, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_1), 'LineWidth', 0.25);
% plot(A_Time1_1, A_Vel1_1, '-', 'Color',colormap(map_2(1,:)), 'LineWidth', 0.5);
% plot(A_Time2_1, A_Vel2_1, '-', 'Color',colormap(map_2(2,:)), 'LineWidth', 0.5);
% plot(A_Time3_1, A_Vel3_1, '-', 'Color',colormap(map_2(3,:)), 'LineWidth', 0.5);
% plot(A_Time4_1, A_Vel4_1, '-', 'Color',colormap(map_2(4,:)), 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('a');
ylim([-1600 2400])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_2, A_Vel1_2, '-k', 'LineWidth', 0.5);
plot(A_Time2_2, A_Vel2_2, '--k', 'LineWidth', 0.5);
plot(A_Time3_2, A_Vel3_2, ':k', 'LineWidth', 0.5);
% plot(A_Time4_2, A_Vel4_2, '-ok', 'LineWidth', 0.5);
plot(A_Time4_2, A_Vel4_2, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_2), 'LineWidth', 0.5);

% plot(A_Time1_2, A_Vel1_2, '-r', 'LineWidth', 0.25);
% plot(A_Time2_2, A_Vel2_2, '-g', 'LineWidth', 0.25);
% plot(A_Time3_2, A_Vel3_2, '--b', 'LineWidth', 0.25);
% plot(A_Time4_2, A_Vel4_2, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_2), 'LineWidth', 0.25);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('b');
ylim([-1600 2400])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_3, A_Vel1_3, '-k', 'LineWidth', 0.5);
plot(A_Time2_3, A_Vel2_3, '--k', 'LineWidth', 0.5);
plot(A_Time3_3, A_Vel3_3, ':k', 'LineWidth', 0.5);
% plot(A_Time4_3, A_Vel4_3, '-ok', 'LineWidth', 0.5);
plot(A_Time4_3, A_Vel4_3, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_3), 'LineWidth', 0.5);

% plot(A_Time1_3, A_Vel1_3, '-r', 'LineWidth', 0.25);
% plot(A_Time2_3, A_Vel2_3, '-g', 'LineWidth', 0.25);
% plot(A_Time3_3, A_Vel3_3, '--b', 'LineWidth', 0.25);
% plot(A_Time4_3, A_Vel4_3, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_2), 'LineWidth', 0.25);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('c');
ylim([-1600 2400])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 



plot(A_Time1_4, A_Vel1_4, '-k', 'LineWidth', 0.5);
plot(A_Time2_4, A_Vel2_4, '--k', 'LineWidth', 0.5);
plot(A_Time3_4, A_Vel3_4, ':k', 'LineWidth', 0.5);
% plot(A_Time4_3, A_Vel4_3, '-ok', 'LineWidth', 0.5);
plot(A_Time4_4, A_Vel4_4, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_4), 'LineWidth', 0.5);


% plot(A_Time1_4, A_Vel1_4, '-', 'Color',colormap(map_2(1,:)), 'LineWidth', 0.5);
% plot(A_Time2_4, A_Vel2_4, '-', 'Color',colormap(map_2(2,:)), 'LineWidth', 0.5);
% plot(A_Time3_4, A_Vel3_4, '-', 'Color',colormap(map_2(3,:)), 'LineWidth', 0.5);
% plot(A_Time4_4, A_Vel4_4, '-', 'Color',colormap(map_2(4,:)), 'LineWidth', 0.5);

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('d');
ylim([-1600 2400])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 

%exportgraphics(t,'BW_ENG_NEW/analiz_vel.jpg','Resolution',900)
set(gcf, 'Color', 'w')
export_fig BW_ENG_NEW/analiz_vel.png -painters -m3
