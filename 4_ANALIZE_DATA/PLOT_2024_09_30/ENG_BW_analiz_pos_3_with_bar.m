clc;
clear all;

A_filename = 'M_eksp_3_1.csv';
A_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_2.csv';
A_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_3.csv';
A_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_4.csv';
A_4 = dlmread(A_filename, ';', 1, 0);



k_P_A = 36 / 4095 * 400 /10;
k_P_B = 36 / 4095 * 400 /20;

B_filename = 'M_OSC_eksp_3_1new.csv';
B_1 = dlmread(B_filename, ';', 1, 0);
B_Time_1 = B_1(:,1)*0.0006 + 4.4682 - 5.8365; %3_1
B_P_A_1 = B_1(:,2) * k_P_A;
B_P_B_1 = B_1(:,3)* k_P_B;
B_sinchro_1 = B_1(:,4);

B_filename = 'M_OSC_eksp_3_2new.csv';
B_2 = dlmread(B_filename, ';', 1, 0);
B_Time_2 = B_2(:,1)*0.0006 + 4.41775 - 6.2025; %3_2
B_P_A_2 = B_2(:,2) * k_P_A;
B_P_B_2 = B_2(:,3)* k_P_B;
B_sinchro_2 = B_2(:,4);

B_filename = 'M_OSC_eksp_3_3new.csv';
B_3 = dlmread(B_filename, ';', 1, 0);
B_Time_3 = B_3(:,1)*0.0006 +4.4590 - 6.09698; %3_3
B_P_A_3 = B_3(:,2) * k_P_A;
B_P_B_3 = B_3(:,3)* k_P_B;
B_sinchro_3 = B_3(:,4);

B_filename = 'M_OSC_eksp_3_4new.csv';
B_4 = dlmread(B_filename, ';', 1, 0);
B_Time_4 = B_4(:,1)*0.0006 + 4.4282 - 5.81975; %3_4
B_P_A_4 = B_4(:,2) * k_P_A;
B_P_B_4 = B_4(:,3)* k_P_B;
B_sinchro_4 = B_4(:,4);





% B_Time_1 = B_1(:,1)*0.0006 + 4.4381 - 6.10471; %4_1
% B_Time_1 = B_1(:,1)*0.0006 + 4.4085 - 6.1978; %4_2
% B_Time_1 = B_1(:,1)*0.0006 +4.42 - 6.16558; %4_2
% B_Time_1 = B_1(:,1)*0.0006 - 1.71593; %4_4


%pos % % % % % % % % % % % % % % % % % % % % % 

load('pos_3_1.mat', 'pos');
C_1 = pos;
load('pos_3_2.mat', 'pos');
C_2 = pos;
load('pos_3_3.mat', 'pos');
C_3 = pos;
load('pos_3_4.mat', 'pos');
C_4 = pos;




C_Time_1 = C_1(1,:)*1000 + 90; % A_3_1
C_Time_2 = C_2(1,:)*1000 + 30; % A_3_2
C_Time_3 = C_3(1,:)*1000 + 80; % A_3_3
C_Time_4 = C_4(1,:)*1000 + 40; % A_3_4


C_Time_1 = C_Time_1 / 1000;
C_Time_2 = C_Time_2 / 1000;
C_Time_3 = C_Time_3 / 1000;
C_Time_4 = C_Time_4 / 1000;


C_PosRef_1 = C_1(3,:); 
C_PosFb_1 = C_1(2,:); 
C_PosRef_2 = C_2(3,:); 
C_PosFb_2 = C_2(2,:); 
C_PosRef_3 = C_3(3,:); 
C_PosFb_3 = C_3(2,:); 
C_PosRef_4 = C_4(3,:); 
C_PosFb_4 = C_4(2,:); 



A_Time_1 = A_1(:,1)*0.01;
A_PosRef_1 = A_1(:,2)*0.025 * -1;
A_PosFb_1 = A_1(:,3)*0.025 * -1;
A_sinchro_1 = A_1(:,4);
A_Vel_1 = A_1(:,5)* -1 * 4.88; %RPM
A_PosErr_1 = A_PosRef_1 - A_PosFb_1;


A_Time_2 = A_2(:,1)*0.01;
A_PosRef_2 = A_2(:,2)*0.025 * -1;
A_PosFb_2 = A_2(:,3)*0.025 * -1;
A_Vel_2 = A_2(:,5)* -1 * 4.88; %RPM
A_PosErr_2 = A_PosRef_2 - A_PosFb_2;

A_Time_3 = A_3(:,1)*0.01;
A_PosRef_3 = A_3(:,2)*0.025 * -1;
A_PosFb_3 = A_3(:,3)*0.025 * -1;
A_Vel_3 = A_3(:,5)* -1 * 4.88; %RPM
A_PosErr_3 = A_PosRef_3 - A_PosFb_3;

A_Time_4 = A_4(:,1)*0.01;
A_PosRef_4 = A_4(:,2)*0.025 * -1;
A_PosFb_4 = A_4(:,3)*0.025 * -1;
A_Vel_4 = A_4(:,5)* -1 * 4.88; %RPM
A_PosErr_4 = A_PosRef_4 - A_PosFb_4;

t = tiledlayout(2,2);
t.TileSpacing = 'compact';




nexttile
hold on 
yyaxis left
plot(C_Time_1, C_PosRef_1, '-k', 'LineWidth', 0.5);
plot(C_Time_1, C_PosFb_1, '--k', 'LineWidth', 0.5);
plot(A_Time_1, A_PosFb_1, ':k', 'LineWidth', 0.5);

% plot(A_Time_1, A_PosRef_1, '--k', 'LineWidth', 0.5);

% plot(A_Time_1, A_sinchro_1, '--k', 'LineWidth', 0.5);
% plot(B_Time_1, B_sinchro_1, '--k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_1, B_P_A_1, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_1), 'LineWidth', 0.5);
plot(B_Time_1, B_P_B_1, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_1), 'LineWidth', 0.5);
% plot(B_Time_1, B_P_A_1, '--k', 'LineWidth', 0.5);
% plot(B_Time_1, B_P_B_1, '--k', 'LineWidth', 0.5);
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

% plot(A_Time_2, A_PosRef_2, '--k', 'LineWidth', 0.5);

% plot(A_Time_2, A_sinchro_2, '--k', 'LineWidth', 0.5);
% plot(B_Time_2, B_sinchro_2, '--k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_2, B_P_A_2, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_2), 'LineWidth', 0.5);
plot(B_Time_2, B_P_B_2, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_2), 'LineWidth', 0.5);
% plot(B_Time_2, B_P_A_2, '--k', 'LineWidth', 0.5);
% plot(B_Time_2, B_P_B_2, '--k', 'LineWidth', 0.5);
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

% plot(A_Time_3, A_PosRef_3, '--k', 'LineWidth', 0.5);

% plot(A_Time_3, A_sinchro_3, '--k', 'LineWidth', 0.5);
% plot(B_Time_3, B_sinchro_3, '--k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_3, B_P_A_3, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_3), 'LineWidth', 0.5);
plot(B_Time_3, B_P_B_3, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_3), 'LineWidth', 0.5);
% plot(B_Time_3, B_P_A_3, '--k', 'LineWidth', 0.5);
% plot(B_Time_3, B_P_B_3, '--k', 'LineWidth', 0.5);
ylabel('Pressure, bar', 'FontSize', 12, 'Color','k');
ylim([0 60])
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';



legend('X_t_a_s_k, mm', 'X_s_i_m, mm', 'X_e_x_p, mm', 'P_A_e_x_p, bar', 'P_B_e_x_p, bar', 'FontSize', 12); 

xlim([0 25])
xlabel('Time, s');
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

% plot(A_Time_4, A_PosRef_4, '--k', 'LineWidth', 0.5);

% plot(A_Time_4, A_sinchro_4, '--k', 'LineWidth', 0.5);
% plot(B_Time_4, B_sinchro_4, '--k', 'LineWidth', 0.5);
ylim([-5 60])
ylabel('Coordinate, mm', 'FontSize', 12, 'Color','k');

yyaxis right
plot(B_Time_4, B_P_A_4, '-squarek', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_A_4), 'LineWidth', 0.5);
plot(B_Time_4, B_P_B_4, '-ok', 'MarkerSize', 3, 'MarkerIndices',1:1000:length(B_P_B_4), 'LineWidth', 0.5);
% plot(B_Time_4, B_P_A_4, '--k', 'LineWidth', 0.5);
% plot(B_Time_4, B_P_B_4, '--k', 'LineWidth', 0.5);
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

%exportgraphics(t,'BW_ENG_NEW/analiz_pos_3_with_bar.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig BW_ENG_NEW/analiz_pos_3_with_bar.png -painters -m3
