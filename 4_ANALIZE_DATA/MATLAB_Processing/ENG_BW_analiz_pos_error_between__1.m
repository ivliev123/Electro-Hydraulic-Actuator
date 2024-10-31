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



EXP_1_1_PosFb_NEW        = interp1(EXP_1_1_Time, EXP_1_1_PosFb, SIM_1_1_Time);
EXP_1_2_PosFb_NEW        = interp1(EXP_1_2_Time, EXP_1_2_PosFb, SIM_1_2_Time);
EXP_1_3_PosFb_NEW        = interp1(EXP_1_3_Time, EXP_1_3_PosFb, SIM_1_3_Time);
EXP_1_4_PosFb_NEW        = interp1(EXP_1_4_Time, EXP_1_4_PosFb, SIM_1_4_Time);

EXP_2_1_PosFb_NEW        = interp1(EXP_2_1_Time, EXP_2_1_PosFb, SIM_2_1_Time);
EXP_2_2_PosFb_NEW        = interp1(EXP_2_2_Time, EXP_2_2_PosFb, SIM_2_2_Time);
EXP_2_3_PosFb_NEW        = interp1(EXP_2_3_Time, EXP_2_3_PosFb, SIM_2_3_Time);
EXP_2_4_PosFb_NEW        = interp1(EXP_2_4_Time, EXP_2_4_PosFb, SIM_2_4_Time);

EXP_3_1_PosFb_NEW        = interp1(EXP_3_1_Time, EXP_3_1_PosFb, SIM_3_1_Time);
EXP_3_2_PosFb_NEW        = interp1(EXP_3_2_Time, EXP_3_2_PosFb, SIM_3_2_Time);
EXP_3_3_PosFb_NEW        = interp1(EXP_3_3_Time, EXP_3_3_PosFb, SIM_3_3_Time);
EXP_3_4_PosFb_NEW        = interp1(EXP_3_4_Time, EXP_3_4_PosFb, SIM_3_4_Time);

EXP_4_1_PosFb_NEW        = interp1(EXP_4_1_Time, EXP_4_1_PosFb, SIM_4_1_Time);
EXP_4_2_PosFb_NEW        = interp1(EXP_4_2_Time, EXP_4_2_PosFb, SIM_4_2_Time);
EXP_4_3_PosFb_NEW        = interp1(EXP_4_3_Time, EXP_4_3_PosFb, SIM_4_3_Time);
EXP_4_4_PosFb_NEW        = interp1(EXP_4_4_Time, EXP_4_4_PosFb, SIM_4_4_Time);


EXP_1_1_PosFb_between    = SIM_1_1_PosFb - EXP_1_1_PosFb_NEW;
EXP_1_2_PosFb_between    = SIM_1_2_PosFb - EXP_1_2_PosFb_NEW;
EXP_1_3_PosFb_between    = SIM_1_3_PosFb - EXP_1_3_PosFb_NEW;
EXP_1_4_PosFb_between    = SIM_1_4_PosFb - EXP_1_4_PosFb_NEW;

EXP_2_1_PosFb_between    = SIM_2_1_PosFb - EXP_2_1_PosFb_NEW;
EXP_2_2_PosFb_between    = SIM_2_2_PosFb - EXP_2_2_PosFb_NEW;
EXP_2_3_PosFb_between    = SIM_2_3_PosFb - EXP_2_3_PosFb_NEW;
EXP_2_4_PosFb_between    = SIM_2_4_PosFb - EXP_2_4_PosFb_NEW;

EXP_3_1_PosFb_between    = SIM_3_1_PosFb - EXP_3_1_PosFb_NEW;
EXP_3_2_PosFb_between    = SIM_3_2_PosFb - EXP_3_2_PosFb_NEW;
EXP_3_3_PosFb_between    = SIM_3_3_PosFb - EXP_3_3_PosFb_NEW;
EXP_3_4_PosFb_between    = SIM_3_4_PosFb - EXP_3_4_PosFb_NEW;

EXP_4_1_PosFb_between    = SIM_4_1_PosFb - EXP_4_1_PosFb_NEW;
EXP_4_2_PosFb_between    = SIM_4_2_PosFb - EXP_4_2_PosFb_NEW;
EXP_4_3_PosFb_between    = SIM_4_3_PosFb - EXP_4_3_PosFb_NEW;
EXP_4_4_PosFb_between    = SIM_4_4_PosFb - EXP_4_4_PosFb_NEW;


t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
plot(SIM_1_1_Time, EXP_1_1_PosFb_between,"-r", 'LineWidth', 0.5);
plot(SIM_1_2_Time, EXP_1_2_PosFb_between,"-g", 'LineWidth', 0.5);
plot(SIM_1_3_Time, EXP_1_3_PosFb_between,"-b", 'LineWidth', 0.5);
plot(SIM_1_4_Time, EXP_1_4_PosFb_between,"-m", 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 
title('a');
ylim([-2 3]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(SIM_2_1_Time, EXP_2_1_PosFb_between,"-r", 'LineWidth', 0.5);
plot(SIM_2_2_Time, EXP_2_2_PosFb_between,"-g", 'LineWidth', 0.5);
plot(SIM_2_3_Time, EXP_2_3_PosFb_between,"-b", 'LineWidth', 0.5);
plot(SIM_2_4_Time, EXP_2_4_PosFb_between,"-m", 'LineWidth', 0.5);


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 
title('b');
ylim([-2 3]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(SIM_3_1_Time, EXP_3_1_PosFb_between,"-r", 'LineWidth', 0.5);
plot(SIM_3_2_Time, EXP_3_2_PosFb_between,"-g", 'LineWidth', 0.5);
plot(SIM_3_3_Time, EXP_3_3_PosFb_between,"-b", 'LineWidth', 0.5);
plot(SIM_3_4_Time, EXP_3_4_PosFb_between,"-m", 'LineWidth', 0.5);

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 
title('c');
ylim([-2 3]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(SIM_4_1_Time, EXP_4_1_PosFb_between,"-r", 'LineWidth', 0.5);
plot(SIM_4_2_Time, EXP_4_2_PosFb_between,"-g", 'LineWidth', 0.5);
plot(SIM_4_3_Time, EXP_4_3_PosFb_between,"-b", 'LineWidth', 0.5);
plot(SIM_4_4_Time, EXP_4_4_PosFb_between,"-m", 'LineWidth', 0.5);

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Error, mm', 'FontSize', 12, 'Color','k');
xlabel('Time, s', 'FontSize', 12, 'Color','k'); 

lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

title('d');
ylim([-2 3]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 



% size(A_PosErr1_1_between)
% [row_, col_] = size(C_PosRef1_1);
% error_array(size(C_PosRef1_1)) = 0;
% for i = 1:col_
% x = A_PosErr1_1_between(i) /C_PosErr1_1(i);
% if x <= 1 & x>=-1
% error_array(i) = x;
% else
% error_array(i) = 0;
% end
% end
% 
% plot(C_Time1_1, A_PosErr1_1_between, '-b', 'LineWidth', 0.5);
% plot(C_Time1_1, error_array*100, '-k', 'LineWidth', 0.5);
% plot(C_Time1_1, absolut_error, '--r', 'LineWidth', 0.5);
% ylabel('Displacement error, [%]');


set(gcf, 'Color', 'w')
export_fig ../FIGURE/analiz_pos_error_between.png -painters -m3