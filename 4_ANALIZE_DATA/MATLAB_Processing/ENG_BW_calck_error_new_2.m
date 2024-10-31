clc;
clear all;

% error1_1 = 12.5 - 12.475
% error1_2 = 25 - 24.975
% error1_3 = 37.5 - 37.475
% error1_4 = 50 - 49.975

% error2_1 = 12.5 - 12.425
% error2_2 = 25 - 24.9
% error2_3 = 37.5 - 37.4
% error2_4 = 50 - 49.9

% error3_1 = 12.5 - 12.35
% error3_2 = 25 - 24.85
% error3_3 = 37.5 - 37.35
% error3_4 = 50 - 49.85

% error4_1 = 12.5 - 12.325
% error4_2 = 25 - 24.8
% error4_3 = 37.5 - 37.3
% error4_4 = 50 - 49.75

error1_1 = 0.0
error1_2 = 0.0
error1_3 = 0.0
error1_4 = 0.0

error2_1 = 0.025
error2_2 = 0.025
error2_3 = 0.025
error2_4 = 0.025

error3_1 = 0.05
error3_2 = 0.05
error3_3 = 0.05
error3_4 = 0.05

error4_1 = 0.05
error4_2 = 0.05
error4_3 = 0.075
error4_4 = 0.075
 

hold on
plot([12.5, 25, 37.5, 50], [error1_1, error1_2, error1_3, error1_4], '-squarer', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [error2_1, error2_2, error2_3, error2_4], '-og', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [error3_1, error3_2, error3_3, error3_4], '-*b', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [error4_1, error4_2, error4_3, error4_4], '-xm', 'LineWidth', 0.5);

xlabel('The specified coordinate of the positional cycle, mm', 'FontSize', 12, 'Color','k'); 
ylabel('Positioning error, mm', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
ylim([-0.01 0.1])
ax = gca;
ax.YAxis(1).Color = 'k';

grid on
grid minor

hold off

set(gcf, 'Color', 'w')
export_fig ../FIGURE/calk_error.png -painters -m3