clc;
clear all;

path_data_exp = '../DATA_Experiment_Processed/';
% path_data_exp = "../DATA_Experiment/";
path_data_sim = "../DATA_Simulation/";

filename = path_data_exp + "exp_data_1_1.csv";
exp_data_1_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_2.csv";
exp_data_1_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_3.csv";
exp_data_1_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_1_4.csv";
exp_data_1_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_2_1.csv";
exp_data_2_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_2.csv";
exp_data_2_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_3.csv";
exp_data_2_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_2_4.csv";
exp_data_2_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_3_1.csv";
exp_data_3_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_2.csv";
exp_data_3_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_3.csv";
exp_data_3_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_3_4.csv";
exp_data_3_4 = dlmread(filename, ';', 1, 0);

filename = path_data_exp + "exp_data_4_1.csv";
exp_data_4_1 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_2.csv";
exp_data_4_2 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_3.csv";
exp_data_4_3 = dlmread(filename, ';', 1, 0);
filename = path_data_exp + "exp_data_4_4.csv";
exp_data_4_4 = dlmread(filename, ';', 1, 0);


EXP_1_1_Time          = exp_data_1_1(:,1)-1.583;
EXP_1_1_Speed         = exp_data_1_1(:,6);
EXP_1_1_Velocity      = exp_data_1_1(:,7);

EXP_1_2_Time          = exp_data_1_2(:,1)-0.529;
EXP_1_2_Speed         = exp_data_1_2(:,6);
EXP_1_2_Velocity      = exp_data_1_2(:,7);

EXP_1_3_Time          = exp_data_1_3(:,1)-1.599;
EXP_1_3_Speed         = exp_data_1_3(:,6);
EXP_1_3_Velocity      = exp_data_1_3(:,7);

EXP_1_4_Time          = exp_data_1_4(:,1)-1.566;
EXP_1_4_Speed         = exp_data_1_4(:,6);
EXP_1_4_Velocity      = exp_data_1_4(:,7);


EXP_2_1_Time          = exp_data_2_1(:,1)-1.578;
EXP_2_1_Speed         = exp_data_2_1(:,6);
EXP_2_1_Velocity      = exp_data_2_1(:,7);

EXP_2_2_Time          = exp_data_2_2(:,1)-1.528;
EXP_2_2_Speed         = exp_data_2_2(:,6);
EXP_2_2_Velocity      = exp_data_2_2(:,7);

EXP_2_3_Time          = exp_data_2_3(:,1)-1.521;
EXP_2_3_Speed         = exp_data_2_3(:,6);
EXP_2_3_Velocity      = exp_data_2_3(:,7);

EXP_2_4_Time          = exp_data_2_4(:,1)-1.586;
EXP_2_4_Speed         = exp_data_2_4(:,6);
EXP_2_4_Velocity      = exp_data_2_4(:,7);


EXP_3_1_Time          = exp_data_3_1(:,1)-1.550;
EXP_3_1_Speed         = exp_data_3_1(:,6);
EXP_3_1_Velocity      = exp_data_3_1(:,7);

EXP_3_2_Time          = exp_data_3_2(:,1)-1.507;
EXP_3_2_Speed         = exp_data_3_2(:,6);
EXP_3_2_Velocity      = exp_data_3_2(:,7);

EXP_3_3_Time          = exp_data_3_3(:,1)-1.558;
EXP_3_3_Speed         = exp_data_3_3(:,6);
EXP_3_3_Velocity      = exp_data_3_3(:,7);

EXP_3_4_Time          = exp_data_3_4(:,1)-1.545;
EXP_3_4_Speed         = exp_data_3_4(:,6);
EXP_3_4_Velocity      = exp_data_3_4(:,7);


EXP_4_1_Time          = exp_data_4_1(:,1)-1.584;
EXP_4_1_Speed         = exp_data_4_1(:,6);
EXP_4_1_Velocity      = exp_data_4_1(:,7);

EXP_4_2_Time          = exp_data_4_2(:,1)-1.515;
EXP_4_2_Speed         = exp_data_4_2(:,6);
EXP_4_2_Velocity      = exp_data_4_2(:,7);

EXP_4_3_Time          = exp_data_4_3(:,1)-1.615;
EXP_4_3_Speed         = exp_data_4_3(:,6);
EXP_4_3_Velocity      = exp_data_4_3(:,7);

EXP_4_4_Time          = exp_data_4_4(:,1)-1.568;
EXP_4_4_Speed         = exp_data_4_4(:,6);
EXP_4_4_Velocity      = exp_data_4_4(:,7);

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
plot(EXP_1_1_Time, EXP_1_1_Speed, '-r', 'LineWidth', 0.5);
plot(EXP_2_1_Time, EXP_2_1_Speed, '-g', 'LineWidth', 0.5);
plot(EXP_3_1_Time, EXP_3_1_Speed, '-b', 'LineWidth', 0.5);
plot(EXP_4_1_Time, EXP_4_1_Speed, '-m', 'MarkerSize', 3, 'MarkerIndices',1:100:length(EXP_1_4_Velocity), 'LineWidth', 0.5);
% plot(EXP_1_4_Time, EXP_1_4_Speed, '-ok', 'LineWidth', 0.5);

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('a');
ylim([-20 20])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

plot(EXP_1_2_Time, EXP_1_2_Speed, '-r', 'LineWidth', 0.5);
plot(EXP_2_2_Time, EXP_2_2_Speed, '-g', 'LineWidth', 0.5);
plot(EXP_3_2_Time, EXP_3_2_Speed, '-b', 'LineWidth', 0.5);
plot(EXP_4_2_Time, EXP_4_2_Speed, '-m', 'MarkerSize', 3, 'MarkerIndices',1:100:length(EXP_2_4_Velocity), 'LineWidth', 0.5);
% plot(EXP_2_4_Time, EXP_2_4_Speed, '-ok', 'LineWidth', 0.5);




xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('b');
ylim([-20 20])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 


nexttile
hold on 

plot(EXP_1_3_Time, EXP_1_3_Speed, '-r', 'LineWidth', 0.5);
plot(EXP_2_3_Time, EXP_2_3_Speed, '-g', 'LineWidth', 0.5);
plot(EXP_3_3_Time, EXP_3_3_Speed, '-b', 'LineWidth', 0.5);
plot(EXP_4_3_Time, EXP_4_3_Speed, '-m', 'MarkerSize', 3, 'MarkerIndices',1:100:length(EXP_3_4_Velocity), 'LineWidth', 0.5);
% plot(EXP_3_4_Time, EXP_3_4_Speed, '-ok', 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('c');
ylim([-20 20])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 



plot(EXP_1_4_Time, EXP_1_4_Speed, '-r', 'LineWidth', 0.5);
plot(EXP_2_4_Time, EXP_2_4_Speed, '-g', 'LineWidth', 0.5);
plot(EXP_3_4_Time, EXP_3_4_Speed, '-b', 'LineWidth', 0.5);
plot(EXP_4_4_Time, EXP_4_4_Speed, '-m', 'MarkerSize', 3, 'MarkerIndices',1:100:length(EXP_4_4_Velocity), 'LineWidth', 0.5);
% plot(EXP_4_4_Time, EXP_4_4_Speed, '-ok', 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('d');
ylim([-20 20])
xlim([0 25])
ax = gca;
ax.YAxis(1).Color = 'k';
grid on
grid minor
hold off 

set(gcf, 'Color', 'w')
export_fig ../FIGURE/analiz_speed.png -painters -m3
