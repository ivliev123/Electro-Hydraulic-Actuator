clc;
clear all;

error1_1 = 12.5 - 12.475
error1_2 = 25 - 24.975
error1_3 = 37.5 - 37.475
error1_4 = 50 - 49.975

error2_1 = 12.5 - 12.425
error2_2 = 25 - 24.9
error2_3 = 37.5 - 37.4
error2_4 = 50 - 49.9

error3_1 = 12.5 - 12.35
error3_2 = 25 - 24.85
error3_3 = 37.5 - 37.35
error3_4 = 50 - 49.85

error4_1 = 12.5 - 12.325
error4_2 = 25 - 24.8
error4_3 = 37.5 - 37.3
error4_4 = 50 - 49.75
 

hold on
plot([12.5, 25, 37.5, 50], [error1_1, error1_2, error1_3, error1_4], '-*g', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [error2_1, error2_2, error2_3, error2_4], '-*r', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [error3_1, error3_2, error3_3, error3_4], '-*b', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [error4_1, error4_2, error4_3, error4_4], '-*k', 'LineWidth', 1);

xlabel('Displacement, [mm]'); 
ylabel('Displacement error, [mm]');
% legend('Position control +  motor velocity control', 'Position control');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');
% error

grid on
grid minor

hold off


