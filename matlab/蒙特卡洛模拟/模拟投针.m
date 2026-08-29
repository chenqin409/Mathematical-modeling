%% 随机数生成
rand(5,4) %生成5行4列范围[0,1]的随机数
rand(3) %生成3×3方阵
unifrnd(-2,2,3,2) %等同于 -2 + rand(3,2)*(2-(-2))

%% 
l = 1.32; %针的长度
a = 2.34; %平行线的宽度（>l）
n = 10000;
m = 0; %初始化针与平行线相交的次数
x = rand(1,n)*a/2; %针中点到平行线的距离
phi = rand(1,n)*pi; %针与平行线的夹角
axis([0,pi,0,a/2])
for i = 1:n
    if x(i)<l/2*sin(phi(i))
        m = m+1;
        plot(phi(i),x(i),'r.')
        hold on 
    end
end
p = m/n;
m_pi = (2*l)/(a*p);
disp(['求出π的值为：' num2str(m_pi)])

%% 重复100次
result = zeros(100,1);
for num=1: 100
    m = 0; %初始化针与平行线相交的次数
    x = rand(1,n)*a/2; %针中点到平行线的距离
    phi = rand(1,n)*pi; %针与平行线的夹角
    for i = 1:n
        if x(i)<l/2*sin(phi(i))
            m = m+1;
        end
    end
    p = m/n;
    result(num) = (2*l)/(a*p);
end
mean(result)