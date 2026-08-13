function [fitresult, gof] = createFit(year, population)

%% 拟合: '拟合曲线'。
[xData, yData] = prepareCurveData( year, population );

% 设置 fittype 和选项。
ft = fittype( 'xm/(1+(xm/3.9-1)*exp(-r*(t-1790)))', 'independent', 't', 'dependent', 'x' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.678735154857773 400];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '拟合曲线' );
h = plot( fitresult, xData, yData );
legend( h, 'population vs. year', '拟合曲线', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'year', 'Interpreter', 'none' );
ylabel( 'population', 'Interpreter', 'none' );
grid on


