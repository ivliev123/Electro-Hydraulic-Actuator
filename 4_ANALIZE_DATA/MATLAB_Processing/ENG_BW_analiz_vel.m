clc;
clear all;

filename = path_data_exp + "exp_data_1_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_2_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_3_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_4_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);







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
% plot(A_Time1_1, A_Vel1_1, '-r', 'LineWidth', 0.5);
% plot(A_Time2_1, A_Vel2_1, '-g', 'LineWidth', 0.5);
% plot(A_Time3_1, A_Vel3_1, '-b', 'LineWidth', 0.5);
% plot(A_Time4_1, A_Vel4_1, '-k', 'LineWidth', 0.5);
% plot(A_Time1_1, A_Vel1_1, '-r', 'LineWidth', 0.25);
% plot(A_Time2_1, A_Vel2_1, '-g', 'LineWidth', 0.25);
% plot(A_Time3_1, A_Vel3_1, '--b', 'LineWidth', 0.25);
% plot(A_Time4_1, A_Vel4_1, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_1), 'LineWidth', 0.25);
plot(A_Time1_1, A_Vel1_1, '-', 'Color',colormap(map_2(1,:)), 'LineWidth', 0.5);
plot(A_Time2_1, A_Vel2_1, '-', 'Color',colormap(map_2(2,:)), 'LineWidth', 0.5);
plot(A_Time3_1, A_Vel3_1, '-', 'Color',colormap(map_2(3,:)), 'LineWidth', 0.5);
plot(A_Time4_1, A_Vel4_1, '-', 'Color',colormap(map_2(4,:)), 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('a');
ylim([-2000 3000])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

% plot(A_Time1_2, A_Vel1_2, '-r', 'LineWidth', 0.5);
% plot(A_Time2_2, A_Vel2_2, '-g', 'LineWidth', 0.5);
% plot(A_Time3_2, A_Vel3_2, '-b', 'LineWidth', 0.5);
% plot(A_Time4_2, A_Vel4_2, '-k', 'LineWidth', 0.5);
plot(A_Time1_2, A_Vel1_2, '-r', 'LineWidth', 0.25);
plot(A_Time2_2, A_Vel2_2, '-g', 'LineWidth', 0.25);
plot(A_Time3_2, A_Vel3_2, '--b', 'LineWidth', 0.25);
plot(A_Time4_2, A_Vel4_2, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_2), 'LineWidth', 0.25);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('b');
ylim([-2000 3000])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

% plot(A_Time1_3, A_Vel1_3, '-r', 'LineWidth', 0.5);
% plot(A_Time2_3, A_Vel2_3, '-g', 'LineWidth', 0.5);
% plot(A_Time3_3, A_Vel3_3, '-b', 'LineWidth', 0.5);
% plot(A_Time4_3, A_Vel4_3, '-k', 'LineWidth', 0.5);
plot(A_Time1_3, A_Vel1_3, '-r', 'LineWidth', 0.25);
plot(A_Time2_3, A_Vel2_3, '-g', 'LineWidth', 0.25);
plot(A_Time3_3, A_Vel3_3, '--b', 'LineWidth', 0.25);
plot(A_Time4_3, A_Vel4_3, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_2), 'LineWidth', 0.25);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('c');
ylim([-2000 3000])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 



% plot(A_Time1_4, A_Vel1_4, '-r', 'LineWidth', 0.25);
% plot(A_Time2_4, A_Vel2_4, '-g', 'LineWidth', 0.25);
% plot(A_Time3_4, A_Vel3_4, '--b', 'LineWidth', 0.25);
% plot(A_Time4_4, A_Vel4_4, '--', 'Color',colormap(map_2(1,:)), 'MarkerSize', 3, 'MarkerIndices',1:100:length(A_Vel4_4), 'LineWidth', 0.25);
plot(A_Time1_4, A_Vel1_4, '-', 'Color',colormap(map_2(1,:)), 'LineWidth', 0.5);
plot(A_Time2_4, A_Vel2_4, '-', 'Color',colormap(map_2(2,:)), 'LineWidth', 0.5);
plot(A_Time3_4, A_Vel3_4, '-', 'Color',colormap(map_2(3,:)), 'LineWidth', 0.5);
plot(A_Time4_4, A_Vel4_4, '-', 'Color',colormap(map_2(4,:)), 'LineWidth', 0.5);

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Angular velocity, rpm', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('d');
ylim([-2000 3000])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 

exportgraphics(t,'BW_ENG_NEW/analiz_vel.jpg','Resolution',900)


% size(A_Vel1_1)
% [row_, col_] = size(C_PosRef1_1);
% error_array(size(C_PosRef1_1)) = 0;
% for i = 1:col_
% x = A_Vel1_1(i) /C_Vel1_1(i);
% if x <= 1 & x>=-1
% error_array(i) = x;
% else
% error_array(i) = 0;
% end
% end
% 
% plot(C_Time1_1, A_Vel1_1, '-b', 'LineWidth', 0.5);
% plot(C_Time1_1, error_array*100, '-r', 'LineWidth', 0.5);
% plot(C_Time1_1, absolut_error, '--r', 'LineWidth', 0.5);
% ylabel('Displacement error, [%]');


