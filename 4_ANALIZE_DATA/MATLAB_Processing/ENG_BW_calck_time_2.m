clc;
clear all;

dt1_1 = 7.29 - 4.896 +0.5
dt1_2 = 7.57 - 5.45 + 1
dt1_3 = 8.08 - 5.936 + 1.5
dt1_4 = 8.83 - 6.37 + 2

dt2_1 = 7.78 - 4.901 + 0.5
dt2_2 = 7.8 - 5.43 + 1
dt2_3 = 8.46 -5.589 + 1.5
dt2_4 = 9.1 - 6.458 + 2

dt3_1 = 7.53 - 4.956 + 0.5
dt3_2 = 8.37 - 5.4 + 1 
dt3_3 = 9.64 - 5.96 + 1.5
dt3_4 = 9.26 - 6.41 + 2

dt4_1 = 8.31 - 4.93 + 0.5
dt4_2 = 8.5 - 5.397 + 1
dt4_3 = 9.52 - 5.91 + 1.5
dt4_4 = 10.07 - 6.3933 + 2
 

hold on
plot([12.5, 25, 37.5, 50], [dt1_1, dt1_2, dt1_3, dt1_4], '-squarek', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt2_1, dt2_2, dt2_3, dt2_4], '-ok', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt3_1, dt3_2, dt3_3, dt3_4], '-*k', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt4_1, dt4_2, dt4_3, dt4_4], '-xk', 'LineWidth', 0.5);


xlabel('The specified coordinate of the positional cycle, mm', 'FontSize', 12, 'Color','k'); 
ylabel('Positioning time, s', 'FontSize', 12, 'Color','k');
legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4909 N', 'F_L_o_a_d = 7854 N', 'F_L_o_a_d = 9817 N', 'FontSize', 12);
ax = gca;
ax.YAxis(1).Color = 'k';

grid on
grid minor

hold off

%exportgraphics(gca,'BW_ENG_NEW/calk_time.jpg','Resolution',300)
set(gcf, 'Color', 'w')
export_fig BW_ENG_NEW/calk_time.png -painters -m3
