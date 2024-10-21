clc;
clear all;

% path_data_exp = '../DATA_Experiment_Processed/';
path_data_exp = "../DATA_Experiment/";
path_data_sim = "../DATA_Simulation/";

filename = path_data_exp + "exp_data_1_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);


EXP_1_Time          = exp_data_1(:,1)*0.01;
EXP_1_PosRef        = exp_data_1(:,14)*0.025;
EXP_1_PosFb         = exp_data_1(:,15)*0.025;
EXP_1_Pressure_A    = exp_data_1(:,15);
EXP_1_Pressure_B    = exp_data_1(:,15);

EXP_1_Vel_Motor     = exp_data_1(:,5); %RPM
% EXP_1_Vel_Stock   = A_1(:,5); 
EXP_1_PosErr        = A_PosRef_1 - A_PosFb_1;




% k_P_A = 36 / 4095 * 400 /10;
% k_P_B = 36 / 4095 * 400 /20;
% 
% B_filename = 'M_OSC_eksp_1_1new.csv';
% B_1 = dlmread(B_filename, ';', 1, 0);
% B_Time_1 = B_1(:,1)*0.0006 - 2.222 ; %1_1
% B_P_A_1 = B_1(:,2) * k_P_A;
% B_P_B_1 = B_1(:,3)* k_P_B;
% B_sinchro_1 = B_1(:,4);
% 
% B_filename = 'M_OSC_eksp_1_2new.csv';
% B_2 = dlmread(B_filename, ';', 1, 0);
% B_Time_2 = B_2(:,1)*0.0006 + 4.45838 - 6.40347; %1_2
% B_P_A_2 = B_2(:,2) * k_P_A;
% B_P_B_2 = B_2(:,3)* k_P_B;
% B_sinchro_2 = B_2(:,4);
% 
% B_filename = 'M_OSC_eksp_1_3new.csv';
% B_3 = dlmread(B_filename, ';', 1, 0);
% B_Time_3 = B_3(:,1)*0.0006 + 4.4471 - 5.83657; %1_3
% B_P_A_3 = B_3(:,2) * k_P_A;
% B_P_B_3 = B_3(:,3)* k_P_B;
% B_sinchro_3 = B_3(:,4);
% 
% B_filename = 'M_OSC_eksp_1_4new.csv';
% B_4 = dlmread(B_filename, ';', 1, 0);
% B_Time_4 = B_4(:,1)*0.0006 + 4.3782 - 5.83708; %1_4
% B_P_A_4 = B_4(:,2) * k_P_A;
% B_P_B_4 = B_4(:,3)* k_P_B;
% B_sinchro_4 = B_4(:,4);


%pos % % % % % % % % % % % % % % % % % % % % % 

load(path_data_sim + 'sim_data_1_1.mat', 'data');
sim_data_1 = data;
% load(path_data_sim + 'sim_data_1_2.mat', 'data');
% sim_data_2 = data;
% load(path_data_sim + 'sim_data_1_3.mat', 'data');
% sim_data_3 = data;
% load(path_data_sim + 'sim_data_1_4.mat', 'data');
% sim_data_4 = data;





t = tiledlayout(2,2);
t.TileSpacing = 'tight';

nexttile
hold on 
yyaxis left
plot(C_Time_1, C_PosRef_1, '-k', 'LineWidth', 0.5);
plot(C_Time_1, C_PosFb_1, '--k', 'LineWidth', 0.5);
plot(A_Time_1, A_PosFb_1, ':k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_1, B_P_A_1, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_1), 'LineWidth', 0.5);
plot(B_Time_1, B_P_B_1, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_1), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 60])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';



legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 12); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('a');
grid on
grid minor
hold off 


nexttile
hold on 
yyaxis left
plot(C_Time_2, C_PosRef_2, '-k', 'LineWidth', 0.5);
plot(C_Time_2, C_PosFb_2, '--k', 'LineWidth', 0.5);
plot(A_Time_2, A_PosFb_2, ':k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_2, B_P_A_2, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_2), 'LineWidth', 0.5);
plot(B_Time_2, B_P_B_2, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_2), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 60])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';



legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 12); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('b');

grid on
grid minor
hold off 




nexttile
hold on 
yyaxis left
plot(C_Time_3, C_PosRef_3, '-k', 'LineWidth', 0.5);
plot(C_Time_3, C_PosFb_3, '--k', 'LineWidth', 0.5);
plot(A_Time_3, A_PosFb_3, ':k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_3, B_P_A_3, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_3), 'LineWidth', 0.5);
plot(B_Time_3, B_P_B_3, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_3), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 60])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';



legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 12); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('c');
grid on
grid minor
hold off 



nexttile
hold on 
yyaxis left
plot(C_Time_4, C_PosRef_4, '-k', 'LineWidth', 0.5);
plot(C_Time_4, C_PosFb_4, '--k', 'LineWidth', 0.5);
plot(A_Time_4, A_PosFb_4, ':k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_4, B_P_A_4, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_4), 'LineWidth', 0.5);
plot(B_Time_4, B_P_B_4, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_4), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 60])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';



legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 12); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('d');

grid on
grid minor
hold off 

%exportgraphics(t,'BW_ENG_NEW/analiz_pos_1_with_bar.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig ../FIGURE/analiz_pos_1_with_bar.png -painters -m3
