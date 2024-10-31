clc;
clear all;

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
EXP_1_1_PosRef        = exp_data_1_1(:,2);
EXP_1_1_PosFb         = exp_data_1_1(:,3);

EXP_1_2_Time          = exp_data_1_2(:,1)-0.529;
EXP_1_2_PosRef        = exp_data_1_2(:,2);
EXP_1_2_PosFb         = exp_data_1_2(:,3);

EXP_1_3_Time          = exp_data_1_3(:,1)-1.599;
EXP_1_3_PosRef        = exp_data_1_3(:,2);
EXP_1_3_PosFb         = exp_data_1_3(:,3);

EXP_1_4_Time          = exp_data_1_4(:,1)-1.566;
EXP_1_4_PosRef        = exp_data_1_4(:,2);
EXP_1_4_PosFb         = exp_data_1_4(:,3);


EXP_2_1_Time          = exp_data_2_1(:,1)-1.578;
EXP_2_1_PosRef        = exp_data_2_1(:,2);
EXP_2_1_PosFb         = exp_data_2_1(:,3);

EXP_2_2_Time          = exp_data_2_2(:,1)-1.528;
EXP_2_2_PosRef        = exp_data_2_2(:,2);
EXP_2_2_PosFb         = exp_data_2_2(:,3);

EXP_2_3_Time          = exp_data_2_3(:,1)-1.521;
EXP_2_3_PosRef        = exp_data_2_3(:,2);
EXP_2_3_PosFb         = exp_data_2_3(:,3);

EXP_2_4_Time          = exp_data_2_4(:,1)-1.586;
EXP_2_4_PosRef        = exp_data_2_4(:,2);
EXP_2_4_PosFb         = exp_data_2_4(:,3);


EXP_3_1_Time          = exp_data_3_1(:,1)-1.550;
EXP_3_1_PosRef        = exp_data_3_1(:,2);
EXP_3_1_PosFb         = exp_data_3_1(:,3);

EXP_3_2_Time          = exp_data_3_2(:,1)-1.507;
EXP_3_2_PosRef        = exp_data_3_2(:,2);
EXP_3_2_PosFb         = exp_data_3_2(:,3);

EXP_3_3_Time          = exp_data_3_3(:,1)-1.558;
EXP_3_3_PosRef        = exp_data_3_3(:,2);
EXP_3_3_PosFb         = exp_data_3_3(:,3);

EXP_3_4_Time          = exp_data_3_4(:,1)-1.545;
EXP_3_4_PosRef        = exp_data_3_4(:,2);
EXP_3_4_PosFb         = exp_data_3_4(:,3);


EXP_4_1_Time          = exp_data_4_1(:,1)-1.584;
EXP_4_1_PosRef        = exp_data_4_1(:,2);
EXP_4_1_PosFb         = exp_data_4_1(:,3);

EXP_4_2_Time          = exp_data_4_2(:,1)-1.515;
EXP_4_2_PosRef        = exp_data_4_2(:,2);
EXP_4_2_PosFb         = exp_data_4_2(:,3);

EXP_4_3_Time          = exp_data_4_3(:,1)-1.615;
EXP_4_3_PosRef        = exp_data_4_3(:,2);
EXP_4_3_PosFb         = exp_data_4_3(:,3);

EXP_4_4_Time          = exp_data_4_4(:,1)-1.568;
EXP_4_4_PosRef        = exp_data_4_4(:,2);
EXP_4_4_PosFb         = exp_data_4_4(:,3);

EXP_1_1_PosErr        = - EXP_1_1_PosFb + EXP_1_1_PosRef;
EXP_1_2_PosErr        = - EXP_1_2_PosFb + EXP_1_2_PosRef;
EXP_1_3_PosErr        = - EXP_1_3_PosFb + EXP_1_3_PosRef;
EXP_1_4_PosErr        = - EXP_1_4_PosFb + EXP_1_4_PosRef;

EXP_2_1_PosErr        = - EXP_2_1_PosFb + EXP_2_1_PosRef;
EXP_2_2_PosErr        = - EXP_2_2_PosFb + EXP_2_2_PosRef;
EXP_2_3_PosErr        = - EXP_2_3_PosFb + EXP_2_3_PosRef;
EXP_2_4_PosErr        = - EXP_2_4_PosFb + EXP_2_4_PosRef;

EXP_3_1_PosErr        = - EXP_3_1_PosFb + EXP_3_1_PosRef;
EXP_3_2_PosErr        = - EXP_3_2_PosFb + EXP_3_2_PosRef;
EXP_3_3_PosErr        = - EXP_3_3_PosFb + EXP_3_3_PosRef;
EXP_3_4_PosErr        = - EXP_3_4_PosFb + EXP_3_4_PosRef;

EXP_4_1_PosErr        = - EXP_4_1_PosFb + EXP_4_1_PosRef;
EXP_4_2_PosErr        = - EXP_4_2_PosFb + EXP_4_2_PosRef;
EXP_4_3_PosErr        = - EXP_4_3_PosFb + EXP_4_3_PosRef;
EXP_4_4_PosErr        = - EXP_4_4_PosFb + EXP_4_4_PosRef;


load(path_data_sim + 'sim_data_1_1.mat', 'data');
sim_data_1_1 = data;
load(path_data_sim + 'sim_data_1_2.mat', 'data');
sim_data_1_2 = data;
load(path_data_sim + 'sim_data_1_3.mat', 'data');
sim_data_1_3 = data;
load(path_data_sim + 'sim_data_1_4.mat', 'data');
sim_data_1_4 = data;

load(path_data_sim + 'sim_data_2_1.mat', 'data');
sim_data_2_1 = data;
load(path_data_sim + 'sim_data_2_2.mat', 'data');
sim_data_2_2 = data;
load(path_data_sim + 'sim_data_2_3.mat', 'data');
sim_data_2_3 = data;
load(path_data_sim + 'sim_data_2_4.mat', 'data');
sim_data_2_4 = data;

load(path_data_sim + 'sim_data_3_1.mat', 'data');
sim_data_3_1 = data;
load(path_data_sim + 'sim_data_3_2.mat', 'data');
sim_data_3_2 = data;
load(path_data_sim + 'sim_data_3_3.mat', 'data');
sim_data_3_3 = data;
load(path_data_sim + 'sim_data_3_4.mat', 'data');
sim_data_3_4 = data;

load(path_data_sim + 'sim_data_4_1.mat', 'data');
sim_data_4_1 = data;
load(path_data_sim + 'sim_data_4_2.mat', 'data');
sim_data_4_2 = data;
load(path_data_sim + 'sim_data_4_3.mat', 'data');
sim_data_4_3 = data;
load(path_data_sim + 'sim_data_4_4.mat', 'data');
sim_data_4_4 = data;


SIM_1_1_Time          = sim_data_1_1(1,:) - 1.6;
SIM_1_1_PosRef        = sim_data_1_1(2,:) * 1000;
SIM_1_1_PosFb         = sim_data_1_1(3,:) * 1000;

SIM_1_2_Time          = sim_data_1_2(1,:) - 1.6;
SIM_1_2_PosRef        = sim_data_1_2(2,:) * 1000;
SIM_1_2_PosFb         = sim_data_1_2(3,:) * 1000;

SIM_1_3_Time          = sim_data_1_3(1,:) - 1.6;
SIM_1_3_PosRef        = sim_data_1_3(2,:) * 1000;
SIM_1_3_PosFb         = sim_data_1_3(3,:) * 1000;

SIM_1_4_Time          = sim_data_1_4(1,:) - 1.6;
SIM_1_4_PosRef        = sim_data_1_4(2,:) * 1000;
SIM_1_4_PosFb         = sim_data_1_4(3,:) * 1000;


SIM_2_1_Time          = sim_data_2_1(1,:) - 1.6;
SIM_2_1_PosRef        = sim_data_2_1(2,:) * 1000;
SIM_2_1_PosFb         = sim_data_2_1(3,:) * 1000;

SIM_2_2_Time          = sim_data_2_2(1,:) - 1.6;
SIM_2_2_PosRef        = sim_data_2_2(2,:) * 1000;
SIM_2_2_PosFb         = sim_data_2_2(3,:) * 1000;

SIM_2_3_Time          = sim_data_2_3(1,:) - 1.6;
SIM_2_3_PosRef        = sim_data_2_3(2,:) * 1000;
SIM_2_3_PosFb         = sim_data_2_3(3,:) * 1000;

SIM_2_4_Time          = sim_data_2_4(1,:) - 1.6;
SIM_2_4_PosRef        = sim_data_2_4(2,:) * 1000;
SIM_2_4_PosFb         = sim_data_2_4(3,:) * 1000;


SIM_3_1_Time          = sim_data_3_1(1,:) - 1.6;
SIM_3_1_PosRef        = sim_data_3_1(2,:) * 1000;
SIM_3_1_PosFb         = sim_data_3_1(3,:) * 1000;

SIM_3_2_Time          = sim_data_3_2(1,:) - 1.6;
SIM_3_2_PosRef        = sim_data_3_2(2,:) * 1000;
SIM_3_2_PosFb         = sim_data_3_2(3,:) * 1000;

SIM_3_3_Time          = sim_data_3_3(1,:) - 1.6;
SIM_3_3_PosRef        = sim_data_3_3(2,:) * 1000;
SIM_3_3_PosFb         = sim_data_3_3(3,:) * 1000;

SIM_3_4_Time          = sim_data_3_4(1,:) - 1.6;
SIM_3_4_PosRef        = sim_data_3_4(2,:) * 1000;
SIM_3_4_PosFb         = sim_data_3_4(3,:) * 1000;

SIM_4_1_Time          = sim_data_4_1(1,:) - 1.6;
SIM_4_1_PosRef        = sim_data_4_1(2,:) * 1000;
SIM_4_1_PosFb         = sim_data_4_1(3,:) * 1000;

SIM_4_2_Time          = sim_data_4_2(1,:) - 1.6;
SIM_4_2_PosRef        = sim_data_4_2(2,:) * 1000;
SIM_4_2_PosFb         = sim_data_4_2(3,:) * 1000;

SIM_4_3_Time          = sim_data_4_3(1,:) - 1.6;
SIM_4_3_PosRef        = sim_data_4_3(2,:) * 1000;
SIM_4_3_PosFb         = sim_data_4_3(3,:) * 1000;

SIM_4_4_Time          = sim_data_4_4(1,:) - 1.6;
SIM_4_4_PosRef        = sim_data_4_4(2,:) * 1000;
SIM_4_4_PosFb         = sim_data_4_4(3,:) * 1000;


SIM_1_1_PosErr        = - SIM_1_1_PosFb + SIM_1_1_PosRef;
SIM_1_2_PosErr        = - SIM_1_2_PosFb + SIM_1_2_PosRef;
SIM_1_3_PosErr        = - SIM_1_3_PosFb + SIM_1_3_PosRef;
SIM_1_4_PosErr        = - SIM_1_4_PosFb + SIM_1_4_PosRef;

SIM_2_1_PosErr        = - SIM_2_1_PosFb + SIM_2_1_PosRef;
SIM_2_2_PosErr        = - SIM_2_2_PosFb + SIM_2_2_PosRef;
SIM_2_3_PosErr        = - SIM_2_3_PosFb + SIM_2_3_PosRef;
SIM_2_4_PosErr        = - SIM_2_4_PosFb + SIM_2_4_PosRef;

SIM_3_1_PosErr        = - SIM_3_1_PosFb + SIM_3_1_PosRef;
SIM_3_2_PosErr        = - SIM_3_2_PosFb + SIM_3_2_PosRef;
SIM_3_3_PosErr        = - SIM_3_3_PosFb + SIM_3_3_PosRef;
SIM_3_4_PosErr        = - SIM_3_4_PosFb + SIM_3_4_PosRef;

SIM_4_1_PosErr        = - SIM_4_1_PosFb + SIM_4_1_PosRef;
SIM_4_2_PosErr        = - SIM_4_2_PosFb + SIM_4_2_PosRef;
SIM_4_3_PosErr        = - SIM_4_3_PosFb + SIM_4_3_PosRef;
SIM_4_4_PosErr        = - SIM_4_4_PosFb + SIM_4_4_PosRef;




 map = { '#000000',
 '#000000',
 '#000000',
 '#000000',
 '#000000',
 '#000000',
 '#000000',
 '#000000'};
 
map_2 = validatecolor(map, 'multiple')

t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
plot(EXP_1_1_Time, EXP_1_1_PosErr,"-r", 'LineWidth', 0.5);
plot(EXP_1_2_Time, EXP_1_2_PosErr,"-g", 'LineWidth', 0.5);
plot(EXP_1_3_Time, EXP_1_3_PosErr,"-b", 'LineWidth', 0.5);
plot(EXP_1_4_Time, EXP_1_4_PosErr,"-m", 'LineWidth', 0.5);


plot(SIM_1_1_Time, SIM_1_1_PosErr, "--r", 'LineWidth', 0.5);
plot(SIM_1_2_Time, SIM_1_2_PosErr, "--g", 'LineWidth', 0.5);
plot(SIM_1_3_Time, SIM_1_3_PosErr, "--b", 'LineWidth', 0.5);
plot(SIM_1_4_Time, SIM_1_4_PosErr, "--m", 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm', 'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm', 'X_s_i_m = 37.5 mm', 'X_s_i_m = 50 mm', 'FontSize', 10, 'NumColumns',4);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('a');
ylim([-6 8]) 
ax = gca;
ax.YAxis(1).Color = 'k';

xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(EXP_2_1_Time, EXP_2_1_PosErr,"-r", 'LineWidth', 0.5);
plot(EXP_2_2_Time, EXP_2_2_PosErr,"-g", 'LineWidth', 0.5);
plot(EXP_2_3_Time, EXP_2_3_PosErr,"-b", 'LineWidth', 0.5);
plot(EXP_2_4_Time, EXP_2_4_PosErr,"-m", 'LineWidth', 0.5);

plot(SIM_2_1_Time, SIM_2_1_PosErr, "--r", 'LineWidth', 0.5);
plot(SIM_2_2_Time, SIM_2_2_PosErr, "--g", 'LineWidth', 0.5);
plot(SIM_2_3_Time, SIM_2_3_PosErr, "--b", 'LineWidth', 0.5);
plot(SIM_2_4_Time, SIM_2_4_PosErr, "--m", 'LineWidth', 0.5);




xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm', 'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm', 'X_s_i_m = 37.5 mm', 'X_s_i_m = 50 mm', 'FontSize', 10, 'NumColumns',4);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 


title('b');
ylim([-6 8]) 
ax = gca;
ax.YAxis(1).Color = 'k';

xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(EXP_3_1_Time, EXP_3_1_PosErr,"-r", 'LineWidth', 0.5);
plot(EXP_3_2_Time, EXP_3_2_PosErr,"-g", 'LineWidth', 0.5);
plot(EXP_3_3_Time, EXP_3_3_PosErr,"-b", 'LineWidth', 0.5);
plot(EXP_3_4_Time, EXP_3_4_PosErr,"-m", 'LineWidth', 0.5);

plot(SIM_3_1_Time, SIM_3_1_PosErr, "--r", 'LineWidth', 0.5);
plot(SIM_3_2_Time, SIM_3_2_PosErr, "--g", 'LineWidth', 0.5);
plot(SIM_3_3_Time, SIM_3_3_PosErr, "--b", 'LineWidth', 0.5);
plot(SIM_3_4_Time, SIM_3_4_PosErr, "--m", 'LineWidth', 0.5);



xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm', 'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm', 'X_s_i_m = 37.5 mm', 'X_s_i_m = 50 mm', 'FontSize', 10, 'NumColumns',4);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 


title('c');
ylim([-6 8]) 
ax = gca;
ax.YAxis(1).Color = 'k';

xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(EXP_4_1_Time, EXP_4_1_PosErr,"-r", 'LineWidth', 0.5);
plot(EXP_4_2_Time, EXP_4_2_PosErr,"-g", 'LineWidth', 0.5);
plot(EXP_4_3_Time, EXP_4_3_PosErr,"-b", 'LineWidth', 0.5);
plot(EXP_4_4_Time, EXP_4_4_PosErr,"-m", 'LineWidth', 0.5);

plot(SIM_4_1_Time, SIM_4_1_PosErr, "--r", 'LineWidth', 0.5);
plot(SIM_4_2_Time, SIM_4_2_PosErr, "--g", 'LineWidth', 0.5);
plot(SIM_4_3_Time, SIM_4_3_PosErr, "--b", 'LineWidth', 0.5);
plot(SIM_4_4_Time, SIM_4_4_PosErr, "--m", 'LineWidth', 0.5);



xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm', 'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm', 'X_s_i_m = 37.5 mm', 'X_s_i_m = 50 mm', 'FontSize', 10, 'NumColumns',4);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 


title('d');
ylim([-6 8]) 
ax = gca;
ax.YAxis(1).Color = 'k';

xlim([0 25])
grid on
grid minor
hold off 



set(gcf, 'Color', 'w')
export_fig ../FIGURE/analiz_pos_error_ALL.png -painters -m3

