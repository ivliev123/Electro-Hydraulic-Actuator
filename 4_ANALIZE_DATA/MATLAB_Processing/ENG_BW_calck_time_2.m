clc;
clear all;

dt1_1 = 3.9   - 3
dt1_2 = 5.060 - 4
dt1_3 = 5.997 - 5
dt1_4 = 6.905 - 6

dt2_1 = 4.11  - 3
dt2_2 = 5.240 - 4
dt2_3 = 6.004 - 5
dt2_4 = 7.043 - 6

dt3_1 = 4.351 - 3
dt3_2 = 5.568 - 4
dt3_3 = 6.08  - 5
dt3_4 = 6.905 - 6

dt4_1 = 5.132 - 3
dt4_2 = 5.923 - 4
dt4_3 = 6.172 - 5
dt4_4 = 7.294 - 6
 

hold on
plot([12.5, 25, 37.5, 50], [dt1_1, dt1_2, dt1_3, dt1_4], '-squarer', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt2_1, dt2_2, dt2_3, dt2_4], '-og', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt3_1, dt3_2, dt3_3, dt3_4], '-*b', 'LineWidth', 0.5);

plot([12.5, 25, 37.5, 50], [dt4_1, dt4_2, dt4_3, dt4_4], '-xm', 'LineWidth', 0.5);


xlabel('The specified coordinate of the positional cycle, mm', 'FontSize', 12, 'Color','k'); 
ylabel('Positioning time, s', 'FontSize', 12, 'Color','k');
lgd = legend('F_L_o_a_d = 0 N', 'F_L_o_a_d = 4000 N', 'F_L_o_a_d = 6000 N', 'F_L_o_a_d = 8000 N', 'FontSize', 10);
lgd.BoxFace.ColorType = 'truecoloralpha';
lgd.BoxFace.ColorData = uint8([255; 255; 255; 100]); 

ax = gca;
ax.YAxis(1).Color = 'k';

grid on
grid minor

hold off

set(gcf, 'Color', 'w')
export_fig ../FIGURE/calk_time.png -painters -m3

