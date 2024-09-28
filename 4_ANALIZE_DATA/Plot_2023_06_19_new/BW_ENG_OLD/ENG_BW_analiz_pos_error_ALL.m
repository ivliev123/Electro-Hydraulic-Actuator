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


Marker_pos_1_1 = [1596, 1627, 1647, 1667, 2983, 3063, 3094, 3114, 3422, 3533, 3579, 3603, 4351, 4416, 5015, 5095, 5131, 5160, 5186, 5209, 5229, 5249, 5269, 5289, 5309, 5329, 5349, 5369, 5389, 5409]
Marker_pos_1_2 = [1596, 1627, 1647, 1667, 2961, 3066, 3120, 3140, 3427, 3524, 3607, 3649, 3676, 4405, 4497, 5063, 5162, 5209, 5239, 5262, 5282, 5302, 5322, 5342, 5362, 5382, 5402, 5422, 5442, 5462]
Marker_pos_1_3 = [1596, 1627, 1647, 1667, 2964, 3053, 3122, 3148, 3174, 3536, 3606, 3678, 3723, 3758, 4469, 4595, 4638, 5225, 5294, 5322, 5342, 5362, 5382, 5402, 5422, 5442, 5462, 5482, 5502, 5522]
Marker_pos_1_4 = [1596, 1627, 1647, 1667, 2961, 3019, 3099, 3148, 3176, 3504, 3601, 3643, 3716, 3772, 3812, 4506, 4605, 4668, 5255, 5330, 5367, 5387, 5407, 5427, 5447, 5467, 5487, 5507, 5527, 5547]
Marker_pos_2_1 = [1596, 1627, 1647, 1667, 2983, 3209, 3240, 3260, 4532, 4640, 4688, 4712, 5250, 5451, 6753, 6831, 6867, 6896, 6922, 6945, 6965, 6985, 7005, 7025, 7045, 7065, 7085, 7105, 7125, 7145]
Marker_pos_2_2 = [1596, 1627, 1647, 1667, 2961, 3231, 3272, 3292, 3318, 4632, 4714, 4753, 4780, 5314, 5533, 6820, 6920, 6967, 6997, 7020, 7040, 7060, 7080, 7100, 7120, 7140, 7160, 7180, 7200, 7220]
Marker_pos_2_3 = [1596, 1627, 1647, 1667, 2964, 3310, 3373, 3400, 3426, 4740, 4808, 4883, 4930, 4965, 5477, 5728, 5772, 7090, 7155, 7184, 7204, 7224, 7244, 7264, 7284, 7304, 7324, 7344, 7364, 7384]
Marker_pos_2_4 = [1596, 1627, 1647, 1667, 2961, 3272, 3355, 3400, 3437, 3469, 4791, 4832, 4908, 4963, 5003, 5513, 5785, 5840, 7120, 7199, 7236, 7256, 7276, 7296, 7316, 7336, 7356, 7376, 7396, 7416]
Marker_pos_3_1 = [1596, 1627, 1647, 1667, 2983, 3239, 3270, 3290, 4481, 4591, 4639, 4663, 5135, 5386, 6580, 6658, 6694, 6723, 6749, 6772, 6792, 6812, 6832, 6852, 6872, 6892, 6912, 6932, 6952, 6972]
Marker_pos_3_2 = [1596, 1627, 1647, 1667, 2961, 3428, 3471, 3491, 3517, 4744, 4827, 4868, 4895, 5358, 5624, 6774, 6868, 6919, 6949, 6972, 6992, 7012, 7032, 7052, 7072, 7092, 7112, 7132, 7152, 7172]
Marker_pos_3_3 = [1596, 1627, 1647, 1667, 2964, 3377, 3461, 3495, 3521, 4868, 4939, 5012, 5061, 5096, 5554, 5842, 5886, 7099, 7166, 7196, 7216, 7236, 7256, 7276, 7296, 7316, 7336, 7356, 7376, 7396]
Marker_pos_3_4 = [1596, 1627, 1647, 1667, 2961, 3374, 3426, 3484, 3522, 3557, 4816, 4859, 4932, 4987, 5027, 5480, 5775, 5833, 7046, 7123, 7160, 7180, 7200, 7220, 7240, 7260, 7280, 7300, 7320, 7340]
Marker_pos_4_1 = [1596, 1627, 1647, 1667, 2983, 3301, 3332, 3352, 4643, 4751, 4795, 4819, 5251, 5500, 6704, 6783, 6816, 6845, 6871, 6894, 6914, 6934, 6954, 6974, 6994, 7014, 7034, 7054, 7074, 7094]
Marker_pos_4_2 = [1596, 1627, 1647, 1667, 2961, 3436, 3489, 3509, 3535, 4945, 5029, 5071, 5098, 5531, 5825, 7097, 7192, 7240, 7270, 7293, 7313, 7333, 7353, 7373, 7393, 7413, 7433, 7453, 7473, 7493]
Marker_pos_4_3 = [1596, 1627, 1647, 1667, 2964, 3406, 3477, 3521, 3556, 4985, 5053, 5124, 5171, 5206, 5626, 5962, 6006, 7344, 7409, 7439, 7459, 7479, 7499, 7519, 7539, 7559, 7579, 7599, 7619, 7639]
Marker_pos_4_4 = [1596, 1627, 1647, 1667, 2961, 3403, 3431, 3490, 3539, 3579, 5118, 5161, 5236, 5291, 5331, 5746, 6050, 6109, 7564, 7640, 7676, 7696, 7716, 7736, 7756, 7776, 7796, 7816, 7836, 7856]

t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 



plot(A_Time1_1, A_PosErr1_1, "-square", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr1_1), 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time1_2, A_PosErr1_2, "-o", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr1_2), 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time1_3, A_PosErr1_3, "-*", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr1_3), 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time1_4, A_PosErr1_4, "-x", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr1_4), 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time1_1, C_PosErr1_1, "--square", 'MarkerSize', 3, 'MarkerIndices', Marker_pos_1_1, 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time1_2, C_PosErr1_2, "--o", 'MarkerSize', 3, 'MarkerIndices', Marker_pos_1_2, 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time1_3, C_PosErr1_3, "--*", 'MarkerSize', 4, 'MarkerIndices', Marker_pos_1_3, 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time1_4, C_PosErr1_4, "--x", 'MarkerSize', 4, 'MarkerIndices', Marker_pos_1_4,'Color',colormap(map_2(8,:)), 'LineWidth', 1);


xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm',  'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm',  'X_s_i_m = 37.5 mm',  'X_s_i_m = 50 mm');

title('a');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time2_1, A_PosErr2_1, "-square", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr2_1), 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time2_2, A_PosErr2_2, "-o", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr2_2), 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time2_3, A_PosErr2_3, "-*", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr2_3), 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time2_4, A_PosErr2_4, "-x", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr2_4), 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time2_1, C_PosErr2_1, "--square", 'MarkerSize', 3, 'MarkerIndices', Marker_pos_2_1, 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time2_2, C_PosErr2_2, "--o", 'MarkerSize', 3, 'MarkerIndices', Marker_pos_2_2, 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time2_3, C_PosErr2_3, "--*", 'MarkerSize', 4, 'MarkerIndices', Marker_pos_2_3, 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time2_4, C_PosErr2_4, "--x", 'MarkerSize', 4, 'MarkerIndices', Marker_pos_2_4,'Color',colormap(map_2(8,:)), 'LineWidth', 1);




xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm',  'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm',  'X_s_i_m = 37.5 mm',  'X_s_i_m = 50 mm');


title('b');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time3_1, A_PosErr3_1, "-square", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr3_1), 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time3_2, A_PosErr3_2, "-o", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr3_2), 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time3_3, A_PosErr3_3, "-*", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr3_3), 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time3_4, A_PosErr3_4, "-x", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr3_4), 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time3_1, C_PosErr3_1, "--square", 'MarkerSize', 3, 'MarkerIndices',Marker_pos_3_1, 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time3_2, C_PosErr3_2, "--o", 'MarkerSize', 3, 'MarkerIndices',Marker_pos_3_2, 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time3_3, C_PosErr3_3, "--*", 'MarkerSize', 4, 'MarkerIndices',Marker_pos_3_3, 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time3_4, C_PosErr3_4, "--x", 'MarkerSize', 4, 'MarkerIndices',Marker_pos_3_4,'Color',colormap(map_2(8,:)), 'LineWidth', 1);




xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm',  'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm',  'X_s_i_m = 37.5 mm',  'X_s_i_m = 50 mm');


title('c');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
plot(A_Time4_1, A_PosErr4_1, "-square", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr4_1), 'Color',colormap(map_2(1,:)), 'LineWidth', 1);
plot(A_Time4_2, A_PosErr4_2, "-o", 'MarkerSize', 3, 'MarkerIndices',1:200:length(A_PosErr4_2), 'Color',colormap(map_2(2,:)), 'LineWidth', 1);
plot(A_Time4_3, A_PosErr4_3, "-*", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr4_3), 'Color',colormap(map_2(3,:)), 'LineWidth', 1);
plot(A_Time4_4, A_PosErr4_4, "-x", 'MarkerSize', 4, 'MarkerIndices',1:200:length(A_PosErr4_4), 'Color',colormap(map_2(4,:)), 'LineWidth', 1);


plot(C_Time4_1, C_PosErr4_1, "--square", 'MarkerSize', 3, 'MarkerIndices',Marker_pos_4_1, 'Color',colormap(map_2(5,:)), 'LineWidth', 1);
plot(C_Time4_2, C_PosErr4_2, "--o", 'MarkerSize', 3, 'MarkerIndices',Marker_pos_4_2, 'Color',colormap(map_2(6,:)), 'LineWidth', 1);
plot(C_Time4_3, C_PosErr4_3, "--*", 'MarkerSize', 4, 'MarkerIndices',Marker_pos_4_3, 'Color',colormap(map_2(7,:)), 'LineWidth', 1);
plot(C_Time4_4, C_PosErr4_4, "--x", 'MarkerSize', 4, 'MarkerIndices',Marker_pos_4_4,'Color',colormap(map_2(8,:)), 'LineWidth', 1);




xlabel('Time, [s]'); 
ylabel('Error, [mm]');
legend('X_e_x_p = 12.5 mm', 'X_e_x_p = 25 mm',  'X_e_x_p = 37.5 mm', 'X_e_x_p = 50 mm', 'X_s_i_m = 12.5 mm', 'X_s_i_m = 25 mm',  'X_s_i_m = 37.5 mm',  'X_s_i_m = 50 mm');


title('d');
ylim([-10 30])  
xlim([0 25])
grid on
grid minor
hold off 


exportgraphics(t,'BW_ENG/analiz_pos_error_ALL.jpg','Resolution',300)



