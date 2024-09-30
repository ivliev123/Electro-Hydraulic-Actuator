clc;
clear all;

dt1_1 = 7.29 - 4.896
dt1_2 = 7.57 - 5.45
dt1_3 = 8.08 - 5.936
dt1_4 = 8.83 - 6.37

dt2_1 = 7.78 - 4.901
dt2_2 = 7.8 - 5.43
dt2_3 = 8.46 -5.589
dt2_4 = 9.1 - 6.458

dt3_1 = 7.53 - 4.956
dt3_2 = 8.37 - 5.4
dt3_3 = 9.64 - 5.96
dt3_4 = 9.26 - 6.41

dt4_1 = 8.31 - 4.93
dt4_2 = 8.5 - 5.397
dt4_3 = 9.52 - 5.91
dt4_4 = 10.07 - 6.3933
 

hold on
plot([12.5, 25, 37.5, 50], [dt1_1, dt1_2, dt1_3, dt1_4], '-*g', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [dt2_1, dt2_2, dt2_3, dt2_4], '-*r', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [dt3_1, dt3_2, dt3_3, dt3_4], '-*b', 'LineWidth', 1);

plot([12.5, 25, 37.5, 50], [dt4_1, dt4_2, dt4_3, dt4_4], '-*k', 'LineWidth', 1);


xlabel('Displacement, [mm]'); 
ylabel('Positioning time, [s]');
% legend('Position control +  motor velocity control', 'Position control');
legend('Load 0 N', 'Load 4909 N', 'Load 7854 N', 'Load 9817 N');
% dt

grid on
grid minor

hold off


