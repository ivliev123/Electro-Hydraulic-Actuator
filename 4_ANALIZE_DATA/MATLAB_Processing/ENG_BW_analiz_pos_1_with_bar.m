clc;
clear all;

path_data_exp = '../DATA_Experiment_Processed/';
% path_data_exp = "../DATA_Experiment/";
path_data_sim = "../DATA_Simulation/";

filename = path_data_exp + "exp_data_1_1.csv";
exp_data_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_2.csv";
exp_data_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_3.csv";
exp_data_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_4.csv";
exp_data_4 = dlmread(filename, ';', 1, 0);


EXP_1_Time          = exp_data_1(:,1)-1.583;
EXP_1_PosRef        = exp_data_1(:,2);
EXP_1_PosFb         = exp_data_1(:,3);
EXP_1_Pressure_A    = exp_data_1(:,4);
EXP_1_Pressure_B    = exp_data_1(:,5);
EXP_1_Speed         = exp_data_1(:,6);
EXP_1_Velocity      = exp_data_1(:,7);
Exp_1_Current       = exp_data_1(:,8);

EXP_2_Time          = exp_data_2(:,1)-0.529;
EXP_2_PosRef        = exp_data_2(:,2);
EXP_2_PosFb         = exp_data_2(:,3);
EXP_2_Pressure_A    = exp_data_2(:,4);
EXP_2_Pressure_B    = exp_data_2(:,5);
EXP_2_Speed         = exp_data_2(:,6);
EXP_2_Velocity      = exp_data_2(:,7);
Exp_2_Current       = exp_data_2(:,8);

EXP_3_Time          = exp_data_3(:,1)-1.599;
EXP_3_PosRef        = exp_data_3(:,2);
EXP_3_PosFb         = exp_data_3(:,3);
EXP_3_Pressure_A    = exp_data_3(:,4);
EXP_3_Pressure_B    = exp_data_3(:,5);
EXP_3_Speed         = exp_data_3(:,6);
EXP_3_Velocity      = exp_data_3(:,7);
Exp_3_Current       = exp_data_3(:,8);

EXP_4_Time          = exp_data_4(:,1)-1.566;
EXP_4_PosRef        = exp_data_4(:,2);
EXP_4_PosFb         = exp_data_4(:,3);
EXP_4_Pressure_A    = exp_data_4(:,4);
EXP_4_Pressure_B    = exp_data_4(:,5);
EXP_4_Speed         = exp_data_4(:,6);
EXP_4_Velocity      = exp_data_4(:,7);
Exp_4_Current       = exp_data_4(:,8);

% % % % % % % % % % % % % % % % % % % % % 

load(path_data_sim + 'sim_data_1_1.mat', 'data');
sim_data_1 = data;
load(path_data_sim + 'sim_data_1_2.mat', 'data');
sim_data_2 = data;
load(path_data_sim + 'sim_data_1_3.mat', 'data');
sim_data_3 = data;
load(path_data_sim + 'sim_data_1_4.mat', 'data');
sim_data_4 = data;

SIM_2_Time          = sim_data_2(1,:) - 1.6;
SIM_2_PosRef        = sim_data_2(2,:) * 1000;
SIM_2_PosFb         = sim_data_2(3,:) * 1000;

SIM_3_Time          = sim_data_3(1,:) - 1.6;
SIM_3_PosRef        = sim_data_3(2,:) * 1000;
SIM_3_PosFb         = sim_data_3(3,:) * 1000;

SIM_4_Time          = sim_data_4(1,:) - 1.6;
SIM_4_PosRef        = sim_data_4(2,:) * 1000;
SIM_4_PosFb         = sim_data_4(3,:) * 1000;

SIM_1_Time          = sim_data_1(1,:) - 1.6;
SIM_1_PosRef        = sim_data_1(2,:) * 1000;
SIM_1_PosFb         = sim_data_1(3,:) * 1000;


t = tiledlayout(2,2);
t.TileSpacing = 'tight';

nexttile
hold on 
yyaxis left
plot(EXP_1_Time, EXP_1_PosRef, '-k', 'LineWidth', 0.5);
plot(EXP_1_Time, EXP_1_PosFb, '-r', 'LineWidth', 0.5);
plot(SIM_1_Time, SIM_1_PosFb, '-g', 'LineWidth', 0.5);
% plot(SIM_1_Time, SIM_1_PosRef, '--r', 'LineWidth', 0.5);

ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(EXP_1_Time, EXP_1_Pressure_A, '-b', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_1_Pressure_A), 'LineWidth', 0.5);
plot(EXP_1_Time, EXP_1_Pressure_B, '-m', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_1_Pressure_B), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 80])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
% legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_t_a_s_k EXP, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd = legend('X_t_a_s_k, mm', 'X_e_x_p, mm', 'X_s_i_m, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('a');
grid on
grid minor
hold off 


nexttile
hold on 
yyaxis left
plot(EXP_2_Time, EXP_2_PosRef, '-k', 'LineWidth', 0.5);
plot(EXP_2_Time, EXP_2_PosFb, '-r', 'LineWidth', 0.5);
plot(SIM_2_Time, SIM_2_PosFb, '-g', 'LineWidth', 0.5);
% plot(SIM_2_Time, SIM_2_PosRef, '--r', 'LineWidth', 0.5);

ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(EXP_2_Time, EXP_2_Pressure_A, '-b', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_2_Pressure_A), 'LineWidth', 0.5);
plot(EXP_2_Time, EXP_2_Pressure_B, '-m', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_2_Pressure_B), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 80])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

% legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd = legend('X_t_a_s_k, mm', 'X_e_x_p, mm', 'X_s_i_m, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 


xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('b');

grid on
grid minor
hold off 




nexttile
hold on 
yyaxis left
plot(EXP_3_Time, EXP_3_PosRef, '-k', 'LineWidth', 0.5);
plot(EXP_3_Time, EXP_3_PosFb, '-r', 'LineWidth', 0.5);
plot(SIM_3_Time, SIM_3_PosFb, '-g', 'LineWidth', 0.5);
% plot(SIM_3_Time, SIM_3_PosRef, '--r', 'LineWidth', 0.5);

ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(EXP_3_Time, EXP_3_Pressure_A, '-b', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_3_Pressure_A), 'LineWidth', 0.5);
plot(EXP_3_Time, EXP_3_Pressure_B, '-m', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_3_Pressure_B), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 80])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

% legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd = legend('X_t_a_s_k, mm', 'X_e_x_p, mm', 'X_s_i_m, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 


xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('c');
grid on
grid minor
hold off 



nexttile
hold on 
yyaxis left
plot(EXP_4_Time, EXP_4_PosRef, '-k', 'LineWidth', 0.5);
plot(EXP_4_Time, EXP_4_PosFb, '-r', 'LineWidth', 0.5);
plot(SIM_4_Time, SIM_4_PosFb, '-g', 'LineWidth', 0.5);
% plot(SIM_4_Time, SIM_4_PosRef, '--r', 'LineWidth', 0.5);

ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(EXP_4_Time, EXP_4_Pressure_A, '-b', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_4_Pressure_A), 'LineWidth', 0.5);
plot(EXP_4_Time, EXP_4_Pressure_B, '-m', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(EXP_4_Pressure_B), 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 80])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';


% legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd = legend('X_t_a_s_k, mm', 'X_e_x_p, mm', 'X_s_i_m, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 10); 
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

xlim([0 25])
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
title('d');

grid on
grid minor
hold off 

%exportgraphics(t,'BW_ENG_NEW/analiz_pos_1_with_bar.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig ../FIGURE/analiz_pos_1_with_bar.png -painters -m3
