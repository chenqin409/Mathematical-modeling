%分段三次艾尔米特差值法
x=-pi:pi;y=sin(x);
new_x=-pi:0.1:pi;
p1=pchip(x,y,new_x);

%三次样条插值法
p2=spline(x,y,new_x);

%对比
figure(1)
plot(x,y,'o',new_x,p1,'r-',new_x,p2,'b-')
legend('样本点','分段三次艾尔米特差值','三次样条插值','Location','southeast')

%n维数据插值
p3=interpn(x,y,new_x,'spline');

%人口预测（不合适）
population=[133126,133770,134413,135069,135738,136427,137122,137866,138639,139538];
year=2009:2018;
p_1=pchip(year,population,2019:2021);
p_2=spline(year,population,2019:2021);
figure(2);
plot(year, population,'o',2019:2021,p_1,'r*-',2019:2021,p_2,'bx-')
legend('样本点','三次埃尔米特插值预测','三次样条插值预测','Location','SouthEast')