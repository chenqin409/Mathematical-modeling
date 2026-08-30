mod(8,3) %求余数
x = 1:0.01:3; %从1到3公差为0.01的等差数列
y = x.^2;
plot(x,y)
axis([0 3 0 10]) %设置横纵坐标的范围
pause(3) %暂停3秒
text(2,4,'Chan') %指定坐标加上文本
close

%% 
v = 200; %B船的速度
dt = 0.0000001; %时间间隔
x = [0,20]; %导弹和B船的横坐标
y = [0,0];
t = 0;
d = 0; %导弹飞行距离
m = sqrt(2)/2;
dd = (x(2)-x(1))^2+ (y(2)-y(1))^2;
while (dd>=0.001)
    t=t+dt;
    d=d+3*v*dt;
    x(2) = 20 + t*v*m;
    y(2) = t*v*m;
    dd = (x(2)-x(1))^2+ (y(2)-y(1))^2;
    tan = (y(2)-y(1))/(x(2)-x(1));
    cos = sqrt(1/(1+tan^2));
    sin = sqrt(1-cos^2);
    x(1) = x(1) + 3*v*dt*cos;
    y(1) = y(1) + 3*v*dt*sin;
    if d>50
        disp('导弹无法击中目标')
        break
    end
    if dd<0.001
        disp('导弹击中目标')
        disp(['飞行距离为：',num2str(d)])
        disp(['飞行时间为：',num2str(t*60),'分钟'])
    end
end
    
%% 画图
x = [0,20]; 
y = [0,0];
t = 0;
d = 0; 
dd = (x(2)-x(1))^2+ (y(2)-y(1))^2;
for i = 1:2
    plot(x(i),y(i),'.k','MarkerSize',1)
    grid on
    hold on
end
axis([0 30 0 10])
k = 1;
while (dd>=0.001)
    t=t+dt;
    d=d+3*v*dt;
    x(2) = 20 + t*v*m;
    y(2) = t*v*m;
    dd = (x(2)-x(1))^2+ (y(2)-y(1))^2;
    tan = (y(2)-y(1))/(x(2)-x(1));
    cos = sqrt(1/(1+tan^2));
    sin = sqrt(1-cos^2);
    x(1) = x(1) + 3*v*dt*cos;
    y(1) = y(1) + 3*v*dt*sin;
    if d>50
        disp('导弹无法击中目标')
        break
    end
    if dd<0.001
        disp('导弹击中目标')
        disp(['飞行距离为：',num2str(d)])
        disp(['飞行时间为：',num2str(t*60),'分钟'])
    end
    
    k=k+1;
    if mod(k,500) == 0 %没循环500次画一个点
        for i = 1:2
            plot(x(i),y(i),'.k','MarkerSize',1)
            hold on
        end
        pause(0.001) %防止程序卡顿
    end
end
         