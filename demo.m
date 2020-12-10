% ��������
load data xfit yfit xdata_m ydata_m ydata_s xVdata yVdata xmodel ymodel ...
    ymodelL ymodelU c cint

% ������ɫ
color_hFit = addcolor(1);
color_hE = addcolor(93);
color_hModel = addcolor(144);
color_hData = addcolor(136);
color_hCI1 = addcolor(99);
color_hCI2 = addcolor(99);

% ��ͼ
figure
hold on
hFit = line(xfit  , yfit);
hE = errorbar(xdata_m, ydata_m, ydata_s);
hData = line(xVdata, yVdata);
hModel = line(xmodel, ymodel);
hCI(1) = line(xmodel, ymodelL);
hCI(2) = line(xmodel, ymodelU);

% ����������
set(hFit, 'Color', color_hFit)
set(hE, 'LineStyle', 'none', 'Marker', '.', 'Color', color_hE)
set(hData, 'LineStyle', 'none', 'Marker', '.')
set(hModel, 'LineStyle', '--', 'Color', color_hModel)
set(hCI(1), 'LineStyle', '-.', 'Color', color_hCI1)
set(hCI(2), 'LineStyle', '-.', 'Color', color_hCI2)

set(hFit, 'LineWidth', 1.5)
set(hE, 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 6, ...
    'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , color_hE)
set(hData, 'Marker', 'o', 'MarkerSize', 5, ...
    'MarkerEdgeColor', 'none', 'MarkerFaceColor', color_hData)
set(hModel, 'LineWidth', 1.5)
set(hCI(1), 'LineWidth', 1.5)
set(hCI(2), 'LineWidth', 1.5)

% ���label
hTitle = title('My Publication-Quality Graphics');
hXLabel = xlabel('Length (m)');
hYLabel = ylabel('Mass (kg)');

% ����ע��
hText = text(10, 800, ...
    sprintf('{\\itC = %0.1g \\pm %0.1g (CI)}', c, cint(2)-c));

% ͼ��
hLegend = legend([hE, hFit, hData, hModel, hCI(1)], ...
    'Data ({\it\mu} \pm {\it\sigma})', 'Fit (C{\itx}^3)', ...
    'Validation Data', 'Model (C{\itx}^3)', '95% CI', ...
    'Location', 'NorthWest');

% ��������
set(gca, 'FontName', 'Helvetica')
set([hTitle, hXLabel, hYLabel, hText], 'FontName', 'AvantGarde')
set([hLegend, gca], 'FontSize', 8)
set([hXLabel, hYLabel, hText], 'FontSize', 10)
set(hTitle, 'FontSize', 12, 'FontWeight' , 'bold')

% ��������������
set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], 'YTick', 0:500:2500, ...
    'LineWidth', 1)
print('test.png','-dpng','-r500')
