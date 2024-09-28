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


C_Time1_1 = C1_1(1,:)*1000 + 30; % A_1_1
C_Time1_2 = C1_2(1,:)*1000 + 80; % A_1_2
C_Time1_3 = C1_3(1,:)*1000 + 66; % A_1_3
C_Time1_4 = C1_4(1,:)*1000 ; % A_1_4

C_Time2_1 = C2_1(1,:)*1000 +35; % A_2_1
C_Time2_2 = C2_2(1,:)*1000 +60; % A_2_2
C_Time2_3 = C2_3(1,:)*1000 +40; % A_2_3
C_Time2_4 = C2_4(1,:)*1000 +88; % A_2_4


C_Time3_1 = C3_1(1,:)*1000 + 90; % A_3_1
C_Time3_2 = C3_2(1,:)*1000 + 30; % A_3_2
C_Time3_3 = C3_3(1,:)*1000 + 80; % A_3_3
C_Time3_4 = C3_4(1,:)*1000 + 40; % A_3_4


C_Time4_1 = C4_1(1,:)*1000 + 60; % A_4_1
C_Time4_2 = C4_2(1,:)*1000 + 27; % A_4_2
C_Time4_3 = C4_3(1,:)*1000 + 40; % A_4_3
C_Time4_4 = C4_4(1,:)*1000 + 20; % A_4_4


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

C_PosRef1_1 = C1_1(3,:); 
C_PosFb1_1 = C1_1(2,:); 
C_PosErr1_1 = C_PosRef1_1 - C_PosFb1_1;
% C_PosErr_exp_sim1_1 = 
C_PosRef1_2 = C1_2(3,:); 
C_PosFb1_2 = C1_2(2,:); 
C_PosErr1_2 = C_PosRef1_2 - C_PosFb1_2;
C_PosRef1_3 = C1_3(3,:); 
C_PosFb1_3 = C1_3(2,:); 
C_PosErr1_3 = C_PosRef1_3 - C_PosFb1_3;
C_PosRef1_4 = C1_4(3,:); 
C_PosFb1_4 = C1_4(2,:); 
C_PosErr1_4 = C_PosRef1_4 - C_PosFb1_4;

C_PosRef2_1 = C2_1(3,:); 
C_PosFb2_1 = C2_1(2,:); 
C_PosErr2_1 = C_PosRef2_1 - C_PosFb2_1;
C_PosRef2_2 = C2_2(3,:); 
C_PosFb2_2 = C2_2(2,:); 
C_PosErr2_2 = C_PosRef2_2 - C_PosFb2_2;
C_PosRef2_3 = C2_3(3,:); 
C_PosFb2_3 = C2_3(2,:); 
C_PosErr2_3 = C_PosRef2_3 - C_PosFb2_3;
C_PosRef2_4 = C2_4(3,:); 
C_PosFb2_4 = C2_4(2,:); 
C_PosErr2_4 = C_PosRef2_4 - C_PosFb2_4;

C_PosRef3_1 = C3_1(3,:); 
C_PosFb3_1 = C3_1(2,:); 
C_PosErr3_1 = C_PosRef3_1 - C_PosFb3_1;
% C_PosErr_exp_sim3_1 = 
C_PosRef3_2 = C3_2(3,:); 
C_PosFb3_2 = C3_2(2,:); 
C_PosErr3_2 = C_PosRef3_2 - C_PosFb3_2;
C_PosRef3_3 = C3_3(3,:); 
C_PosFb3_3 = C3_3(2,:); 
C_PosErr3_3 = C_PosRef3_3 - C_PosFb3_3;
C_PosRef3_4 = C3_4(3,:); 
C_PosFb3_4 = C3_4(2,:); 
C_PosErr3_4 = C_PosRef3_4 - C_PosFb3_4;


C_PosRef4_1 = C4_1(3,:); 
C_PosFb4_1 = C4_1(2,:); 
C_PosErr4_1 = C_PosRef4_1 - C_PosFb4_1;
% C_PosErr_exp_sim4_1 = 
C_PosRef4_2 = C4_2(3,:); 
C_PosFb4_2 = C4_2(2,:); 
C_PosErr4_2 = C_PosRef4_2 - C_PosFb4_2;
C_PosRef4_3 = C4_3(3,:); 
C_PosFb4_3 = C4_3(2,:); 
C_PosErr4_3 = C_PosRef4_3 - C_PosFb4_3;
C_PosRef4_4 = C4_4(3,:); 
C_PosFb4_4 = C4_4(2,:); 
C_PosErr4_4 = C_PosRef4_4 - C_PosFb4_4;



A_Time1_1 = A1_1(:,1)*0.01;
A_PosRef1_1 = A1_1(:,2)*0.025 * -1;
A_PosFb1_1 = A1_1(:,3)*0.025 * -1;
A_Vel1_1 = A1_1(:,5)* -1 * 4.88; %RPM
A_PosErr1_1 = A_PosRef1_1 - A_PosFb1_1;

A_Time1_2 = A1_2(:,1)*0.01;
A_PosRef1_2 = A1_2(:,2)*0.025 * -1;
A_PosFb1_2 = A1_2(:,3)*0.025 * -1;
A_Vel1_2 = A1_2(:,5)* -1 * 4.88; %RPM
A_PosErr1_2 = A_PosRef1_2 - A_PosFb1_2;

A_Time1_3 = A1_3(:,1)*0.01;
A_PosRef1_3 = A1_3(:,2)*0.025 * -1;
A_PosFb1_3 = A1_3(:,3)*0.025 * -1;
A_Vel1_3 = A1_3(:,5)* -1 * 4.88; %RPM
A_PosErr1_3 = A_PosRef1_3 - A_PosFb1_3;

A_Time1_4 = A1_4(:,1)*0.01;
A_PosRef1_4 = A1_4(:,2)*0.025 * -1;
A_PosFb1_4 = A1_4(:,3)*0.025 * -1;
A_Vel1_4 = A1_4(:,5)* -1 * 4.88; %RPM
A_PosErr1_4 = A_PosRef1_4 - A_PosFb1_4;

A_Time2_1 = A2_1(:,1)*0.01;
A_PosRef2_1 = A2_1(:,2)*0.025 * -1;
A_PosFb2_1 = A2_1(:,3)*0.025 * -1;
A_Vel2_1 = A2_1(:,5)* -1 * 4.88; %RPM
A_PosErr2_1 = A_PosRef2_1 - A_PosFb2_1;

A_Time2_2 = A2_2(:,1)*0.01;
A_PosRef2_2 = A2_2(:,2)*0.025 * -1;
A_PosFb2_2 = A2_2(:,3)*0.025 * -1;
A_Vel2_2 = A2_2(:,5)* -1 * 4.88; %RPM
A_PosErr2_2 = A_PosRef2_2 - A_PosFb2_2;

A_Time2_3 = A2_3(:,1)*0.01;
A_PosRef2_3 = A2_3(:,2)*0.025 * -1;
A_PosFb2_3 = A2_3(:,3)*0.025 * -1;
A_Vel2_3 = A2_3(:,5)* -1 * 4.88; %RPM
A_PosErr2_3 = A_PosRef2_3 - A_PosFb2_3;

A_Time2_4 = A2_4(:,1)*0.01;
A_PosRef2_4 = A2_4(:,2)*0.025 * -1;
A_PosFb2_4 = A2_4(:,3)*0.025 * -1;
A_Vel2_4 = A2_4(:,5)* -1 * 4.88; %RPM
A_PosErr2_4 = A_PosRef2_4 - A_PosFb2_4;

A_Time3_1 = A3_1(:,1)*0.01;
A_PosRef3_1 = A3_1(:,2)*0.025 * -1;
A_PosFb3_1 = A3_1(:,3)*0.025 * -1;
A_Vel3_1 = A3_1(:,5)* -1 * 4.88; %RPM
A_PosErr3_1 = A_PosRef3_1 - A_PosFb3_1;

A_Time3_2 = A3_2(:,1)*0.01;
A_PosRef3_2 = A3_2(:,2)*0.025 * -1;
A_PosFb3_2 = A3_2(:,3)*0.025 * -1;
A_Vel3_2 = A3_2(:,5)* -1 * 4.88; %RPM
A_PosErr3_2 = A_PosRef3_2 - A_PosFb3_2;

A_Time3_3 = A3_3(:,1)*0.01;
A_PosRef3_3 = A3_3(:,2)*0.025 * -1;
A_PosFb3_3 = A3_3(:,3)*0.025 * -1;
A_Vel3_3 = A3_3(:,5)* -1 * 4.88; %RPM
A_PosErr3_3 = A_PosRef3_3 - A_PosFb3_3;

A_Time3_4 = A3_4(:,1)*0.01;
A_PosRef3_4 = A3_4(:,2)*0.025 * -1;
A_PosFb3_4 = A3_4(:,3)*0.025 * -1;
A_Vel3_4 = A3_4(:,5)* -1 * 4.88; %RPM
A_PosErr3_4 = A_PosRef3_4 - A_PosFb3_4;





A_Time4_1 = A4_1(:,1)*0.01;
A_PosRef4_1 = A4_1(:,2)*0.025 * -1;
A_PosFb4_1 = A4_1(:,3)*0.025 * -1;
A_Vel4_1 = A4_1(:,5)* -1 * 4.88; %RPM
A_PosErr4_1 = A_PosRef4_1 - A_PosFb4_1;

A_Time4_2 = A4_2(:,1)*0.01;
A_PosRef4_2 = A4_2(:,2)*0.025 * -1;
A_PosFb4_2 = A4_2(:,3)*0.025 * -1;
A_Vel4_2 = A4_2(:,5)* -1 * 4.88; %RPM
A_PosErr4_2 = A_PosRef4_2 - A_PosFb4_2;

A_Time4_3 = A4_3(:,1)*0.01;
A_PosRef4_3 = A4_3(:,2)*0.025 * -1;
A_PosFb4_3 = A4_3(:,3)*0.025 * -1;
A_Vel4_3 = A4_3(:,5)* -1 * 4.88; %RPM
A_PosErr4_3 = A_PosRef4_3 - A_PosFb4_3;

A_Time4_4 = A4_4(:,1)*0.01;
A_PosRef4_4 = A4_4(:,2)*0.025 * -1;
A_PosFb4_4 = A4_4(:,3)*0.025 * -1;
A_Vel4_4 = A4_4(:,5)* -1 * 4.88; %RPM
A_PosErr4_4 = A_PosRef4_4 - A_PosFb4_4;



t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
A_PosErr1_1_NEW= interp1(A_Time1_1, A_PosErr1_1, C_Time1_1);
A_PosErr1_1_between = A_PosErr1_1_NEW - C_PosErr1_1;
plot(C_Time1_1, A_PosErr1_1_between, '-k', 'LineWidth', 0.5);

A_PosErr2_1_NEW= interp1(A_Time2_1, A_PosErr2_1, C_Time2_1);
A_PosErr2_1_between = A_PosErr2_1_NEW - C_PosErr2_1;
plot(C_Time2_1, A_PosErr2_1_between, '--k', 'LineWidth', 0.5);

A_PosErr3_1_NEW= interp1(A_Time3_1, A_PosErr3_1, C_Time3_1);
A_PosErr3_1_between = A_PosErr3_1_NEW - C_PosErr3_1;
plot(C_Time3_1, A_PosErr3_1_between, ':k', 'LineWidth', 0.5);

A_PosErr4_1_NEW= interp1(A_Time4_1, A_PosErr4_1, C_Time4_1);
A_PosErr4_1_between = A_PosErr4_1_NEW - C_PosErr4_1;
MarkerInd = [1596, 1627, 1647, 1667, 2983, 3301, 3332, 3352, 4643, 4751, 4795, 4819, 5251, 5500, 6704, 6783, 6816, 6845, 6871, 6894, 6914, 6934, 6954, 6974, 6994, 7014, 7034, 7054, 7074, 7094]
plot(C_Time4_1, A_PosErr4_1_between, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 


1:100:length(A_PosErr4_1_between)

xlabel('Время, с', 'FontSize', 12, 'Color','k'); 
ylabel('Ошибка, мм', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 Н', 'F_L_o_a_d = 4909 Н', 'F_L_o_a_d = 7854 Н', 'F_L_o_a_d = 9817 Н', 'FontSize', 12);

title('a');
ylim([-2 10]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_2_NEW= interp1(A_Time1_2, A_PosErr1_2, C_Time1_2);
A_PosErr1_2_between = A_PosErr1_2_NEW - C_PosErr1_2;
plot(C_Time1_2, A_PosErr1_2_between, '-k', 'LineWidth', 0.5);

A_PosErr2_2_NEW= interp1(A_Time2_2, A_PosErr2_2, C_Time2_2);
size(A_PosErr2_2_NEW)
size(C_PosErr2_2)
A_PosErr2_2_between = A_PosErr2_2_NEW - C_PosErr2_2;
plot(C_Time2_2, A_PosErr2_2_between, '--k', 'LineWidth', 0.5);

A_PosErr3_2_NEW= interp1(A_Time3_2, A_PosErr3_2, C_Time3_2);
A_PosErr3_2_between = A_PosErr3_2_NEW - C_PosErr3_2;
plot(C_Time3_2, A_PosErr3_2_between, ':k', 'LineWidth', 0.5);

MarkerIndices = [1,2,3,4,5];

A_PosErr4_2_NEW= interp1(A_Time4_2, A_PosErr4_2, C_Time4_2);
A_PosErr4_2_between = A_PosErr4_2_NEW - C_PosErr4_2;
MarkerInd = [1596, 1627, 1647, 1667, 2961, 3436, 3489, 3509, 3535, 4945, 5029, 5071, 5098, 5531, 5825, 7097, 7192, 7240, 7270, 7293, 7313, 7333, 7353, 7373, 7393, 7413, 7433, 7453, 7473, 7493]
plot(C_Time4_2, A_PosErr4_2_between, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 

xlabel('Время, с', 'FontSize', 12, 'Color','k'); 
ylabel('Ошибка, мм', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 Н', 'F_L_o_a_d = 4909 Н', 'F_L_o_a_d = 7854 Н', 'F_L_o_a_d = 9817 Н', 'FontSize', 12);

title('б');
ylim([-2 10]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_3_NEW= interp1(A_Time1_3, A_PosErr1_3, C_Time1_3);
A_PosErr1_3_between = A_PosErr1_3_NEW - C_PosErr1_3;
plot(C_Time1_3, A_PosErr1_3_between, '-k', 'LineWidth', 0.5);

A_PosErr2_3_NEW= interp1(A_Time2_3, A_PosErr2_3, C_Time2_3);
A_PosErr2_3_between = A_PosErr2_3_NEW - C_PosErr2_3;
plot(C_Time2_3, A_PosErr2_3_between, '--k', 'LineWidth', 0.5);

A_PosErr3_3_NEW= interp1(A_Time3_3, A_PosErr3_3, C_Time3_3);
A_PosErr3_3_between = A_PosErr3_3_NEW - C_PosErr3_3;
plot(C_Time3_3, A_PosErr3_3_between, ':k', 'LineWidth', 0.5);

A_PosErr4_3_NEW= interp1(A_Time4_3, A_PosErr4_3, C_Time4_3);
A_PosErr4_3_between = A_PosErr4_3_NEW - C_PosErr4_3;
MarkerInd = [1596, 1627, 1647, 1667, 2964, 3406, 3477, 3521, 3556, 4985, 5053, 5124, 5171, 5206, 5626, 5962, 6006, 7344, 7409, 7439, 7459, 7479, 7499, 7519, 7539, 7559, 7579, 7599, 7619, 7639]
plot(C_Time4_3, A_PosErr4_3_between, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 


xlabel('Время, с', 'FontSize', 12, 'Color','k'); 
ylabel('Ошибка, мм', 'FontSize', 12, 'Color','k');
xlabel('Время, с', 'FontSize', 12, 'Color','k'); 
legend('F_L_o_a_d = 0 Н', 'F_L_o_a_d = 4909 Н', 'F_L_o_a_d = 7854 Н', 'F_L_o_a_d = 9817 Н', 'FontSize', 12);

title('в');
ylim([-2 10]) 
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 
A_PosErr1_4_NEW= interp1(A_Time1_4, A_PosErr1_4, C_Time1_4);
A_PosErr1_4_between = A_PosErr1_4_NEW - C_PosErr1_4;
plot(C_Time1_4, A_PosErr1_4_between, '-k', 'LineWidth', 0.5);

A_PosErr2_4_NEW= interp1(A_Time2_4, A_PosErr2_4, C_Time2_4);
A_PosErr2_4_between = A_PosErr2_4_NEW - C_PosErr2_4;
plot(C_Time2_4, A_PosErr2_4_between, '--k', 'LineWidth', 0.5);

A_PosErr3_4_NEW= interp1(A_Time3_4, A_PosErr3_4, C_Time3_4);
A_PosErr3_4_between = A_PosErr3_4_NEW - C_PosErr3_4;
plot(C_Time3_4, A_PosErr3_4_between, ':k', 'LineWidth', 0.5);

A_PosErr4_4_NEW= interp1(A_Time4_4, A_PosErr4_4, C_Time4_4);
A_PosErr4_4_between = A_PosErr4_4_NEW - C_PosErr4_4;
MarkerInd = [1596, 1627, 1647, 1667, 2961, 3403, 3431, 3490, 3539, 3579, 5118, 5161, 5236, 5291, 5331, 5746, 6050, 6109, 7564, 7640, 7676, 7696, 7716, 7736, 7756, 7776, 7796, 7816, 7836, 7856]
plot(C_Time4_4, A_PosErr4_4_between, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 


xlabel('Время, с', 'FontSize', 12, 'Color','k'); 
ylabel('Ошибка, мм', 'FontSize', 12, 'Color','k');
xlabel('Время, с', 'FontSize', 12, 'Color','k'); 

legend('F_L_o_a_d = 0 Н', 'F_L_o_a_d = 4909 Н', 'F_L_o_a_d = 7854 Н', 'F_L_o_a_d = 9817 Н', 'FontSize', 12);


title('г');
ylim([-2 10]) 
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


%exportgraphics(t,'ЧБ/analiz_pos_error_between.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig ЧБ/analiz_pos_error_between.png -painters -m3

