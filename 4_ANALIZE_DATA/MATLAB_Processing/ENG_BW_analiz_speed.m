clc;
clear all;

A_filename = 'M_eksp_1_1_speed.csv';
A1_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_2_speed.csv';
A1_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_3_speed.csv';
A1_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_1_4_speed.csv';
A1_4 = dlmread(A_filename, ';', 1, 0);

A_filename = 'M_eksp_2_1_speed.csv';
A2_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_2_speed.csv';
A2_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_3_speed.csv';
A2_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_2_4_speed.csv';
A2_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_3_1_speed.csv';
A3_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_2_speed.csv';
A3_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_3_speed.csv';
A3_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_3_4_speed.csv';
A3_4 = dlmread(A_filename, ';', 1, 0);


A_filename = 'M_eksp_4_1_speed.csv';
A4_1 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_2_speed.csv';
A4_2 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_3_speed.csv';
A4_3 = dlmread(A_filename, ';', 1, 0);
A_filename = 'M_eksp_4_4_speed.csv';
A4_4 = dlmread(A_filename, ';', 1, 0);




A_Time1_1 = A1_1(:,1);
A_Speed1_1 = A1_1(:,2); %RPM
A_Speed1_1_F = A1_1(:,3); %RPM

A_Time1_2 = A1_2(:,1);
A_Speed1_2 = A1_2(:,2); %RPM
A_Speed1_2_F = A1_2(:,3); %RPM


A_Time1_3 = A1_3(:,1);
A_Speed1_3 = A1_3(:,2); %RPM
A_Speed1_3_F = A1_3(:,3); %RPM

A_Time1_4 = A1_4(:,1);
A_Speed1_4 = A1_4(:,2); %RPM
A_Speed1_4_F = A1_4(:,3); %RPM

A_Time2_1 = A2_1(:,1);
A_Speed2_1 = A2_1(:,2); %RPM
A_Speed2_1_F = A2_1(:,3); %RPM

A_Time2_2 = A2_2(:,1);
A_Speed2_2 = A2_2(:,2); %RPM
A_Speed2_2_F = A2_2(:,3); %RPM


A_Time2_3 = A2_3(:,1);
A_Speed2_3 = A2_3(:,2); %RPM
A_Speed2_3_F = A2_3(:,3); %RPM


A_Time2_4 = A2_4(:,1);
A_Speed2_4 = A2_4(:,2); %RPM
A_Speed2_4_F = A2_4(:,3); %RPM


A_Time3_1 = A3_1(:,1);
A_Speed3_1 = A3_1(:,2); %RPM
A_Speed3_1_F = A3_1(:,3); %RPM


A_Time3_2 = A3_2(:,1);
A_Speed3_2 = A3_2(:,2); %RPM
A_Speed3_2_F = A3_2(:,3); %RPM


A_Time3_3 = A3_3(:,1);
A_Speed3_3 = A3_3(:,2); %RPM
A_Speed3_3_F = A3_3(:,3); %RPM


A_Time3_4 = A3_4(:,1);
A_Speed3_4 = A3_4(:,2); %RPM
A_Speed3_4_F = A3_4(:,3); %RPM



A_Time4_1 = A4_1(:,1);
A_Speed4_1 = A4_1(:,2); %RPM
A_Speed4_1_F = A4_1(:,3); %RPM


A_Time4_2 = A4_2(:,1);
A_Speed4_2 = A4_2(:,2); %RPM
A_Speed4_2_F = A4_2(:,3); %RPM


A_Time4_3 = A4_3(:,1);
A_Speed4_3 = A4_3(:,2); %RPM
A_Speed4_3_F = A4_3(:,3); %RPM


A_Time4_4 = A4_4(:,1);
A_Speed4_4 = A4_4(:,2); %RPM
A_Speed4_4_F = A4_4(:,3); %RPM






t = tiledlayout(2,2);
t.TileSpacing = 'compact';

nexttile
hold on 
plot(A_Time1_1, A_Speed1_1_F, '-k', 'LineWidth', 0.5);
plot(A_Time2_1, A_Speed2_1_F, '--k', 'LineWidth', 0.5);
plot(A_Time3_1, A_Speed3_1_F, ':k', 'LineWidth', 0.5);
% plot(A_Time4_1, A_Speed4_1_F, '-k', 'LineWidth', 0.5);
MarkerInd = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200];
plot(A_Time4_1, A_Speed4_1_F, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('a');
ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_2, A_Speed1_2_F, '-k', 'LineWidth', 0.5);
plot(A_Time2_2, A_Speed2_2_F, '--k', 'LineWidth', 0.5);
plot(A_Time3_2, A_Speed3_2_F, ':k', 'LineWidth', 0.5);
% plot(A_Time4_2, A_Speed4_2_F, '-k', 'LineWidth', 0.5);
MarkerInd = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200];
plot(A_Time4_2, A_Speed4_2_F, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('b');
ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_3, A_Speed1_3_F, '-k', 'LineWidth', 0.5);
plot(A_Time2_3, A_Speed2_3_F, '--k', 'LineWidth', 0.5);
plot(A_Time3_3, A_Speed3_3_F, ':k', 'LineWidth', 0.5);
% plot(A_Time4_3, A_Speed4_3_F, '-k', 'LineWidth', 0.5);
MarkerInd = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200];
plot(A_Time4_3, A_Speed4_3_F, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 


xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('c');
ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 


nexttile
hold on 

plot(A_Time1_4, A_Speed1_4_F, '-k', 'LineWidth', 0.5);
plot(A_Time2_4, A_Speed2_4_F, '--k', 'LineWidth', 0.5);
plot(A_Time3_4, A_Speed3_4_F, ':k', 'LineWidth', 0.5);
% plot(A_Time4_4, A_Speed4_4_F, '--ok', 'LineWidth', 0.5);
MarkerInd = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200];
plot(A_Time4_4, A_Speed4_4_F, '--ok', 'MarkerSize', 3, 'MarkerIndices',MarkerInd, 'LineWidth', 0.5); 

xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);

title('d');
ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
xlim([0 25])
grid on
grid minor
hold off 



%exportgraphics(t,'BW_ENG_NEW/analiz_speed.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig BW_ENG_NEW/analiz_speed.png -painters -m3





% t = tiledlayout(2,2);
% t.TileSpacing = 'compact';
% 
% nexttile
% hold on 
% plot(A_Time1_1, A_Speed1_1, '-k', 'LineWidth', 0.5);
% plot(A_Time2_1, A_Speed2_1, '-g', 'LineWidth', 0.5);
% plot(A_Time3_1, A_Speed3_1, '-b', 'LineWidth', 0.5);
% plot(A_Time4_1, A_Speed4_1, '-k', 'LineWidth', 0.5);
% 
% xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
% ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
% legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 1562 N', 'F_L_o_a_d = 2500 N', 'F_L_o_a_d = 3125 N');
% 
% title('a');
% ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
% xlim([0 25])
% grid on
% grid minor
% hold off 
% 
% 
% nexttile
% hold on 
% 
% plot(A_Time1_2, A_Speed1_2, '-k', 'LineWidth', 0.5);
% plot(A_Time2_2, A_Speed2_2, '-g', 'LineWidth', 0.5);
% plot(A_Time3_2, A_Speed3_2, '-b', 'LineWidth', 0.5);
% plot(A_Time4_2, A_Speed4_2, '-k', 'LineWidth', 0.5);
% 
% xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
% ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
% legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 1562 N', 'F_L_o_a_d = 2500 N', 'F_L_o_a_d = 3125 N');
% 
% title('b');
% ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
% xlim([0 25])
% grid on
% grid minor
% hold off 
% 
% 
% nexttile
% hold on 
% 
% plot(A_Time1_3, A_Speed1_3, '-k', 'LineWidth', 0.5);
% plot(A_Time2_3, A_Speed2_3, '-g', 'LineWidth', 0.5);
% plot(A_Time3_3, A_Speed3_3, '-b', 'LineWidth', 0.5);
% plot(A_Time4_3, A_Speed4_3, '-k', 'LineWidth', 0.5);
% 
% xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
% ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
% legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 1562 N', 'F_L_o_a_d = 2500 N', 'F_L_o_a_d = 3125 N');
% 
% title('c');
% ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
% xlim([0 25])
% grid on
% grid minor
% hold off 
% 
% 
% nexttile
% hold on 
% 
% plot(A_Time1_4, A_Speed1_4, '-k', 'LineWidth', 0.5);
% plot(A_Time2_4, A_Speed2_4, '-g', 'LineWidth', 0.5);
% plot(A_Time3_4, A_Speed3_4, '-b', 'LineWidth', 0.5);
% plot(A_Time4_4, A_Speed4_4, '-k', 'LineWidth', 0.5);
% 
% xlabel('Time, s', 'FontSize', 12, 'Color','k'); 
% ylabel('Velocity, mm/s', 'FontSize', 12, 'Color','k');
% legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 1562 N', 'F_L_o_a_d = 2500 N', 'F_L_o_a_d = 3125 N');
% 
% title('d');
% ylim([-30 30])
ax = gca;
ax.YAxis(1).Color = 'k';
% xlim([0 25])
% grid on
% grid minor
% hold off 
