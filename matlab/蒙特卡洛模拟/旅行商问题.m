plot([1,2],[5,10],'-o') % 画一条线段从(1,5)到(2,10)
randperm(5) % 生成从1-5的随机序列

%%
% 生成城市的坐标矩阵并转置
coord = [0.6683 0.6195 0.4 0.2439 0.1707 0.2293 0.5171 0.8732 0.6878 0.8488 ;
       0.2536 0.2634 0.4439 0.1463 0.2293 0.761 0.9414 0.6536 0.5219 0.3609]' ; 
n = size(coord,1); %城市数量
figure(1)
plot(coord(:,1),coord(:,2),'o')
for i = 1:n
    text(coord(i,1)+0.01,coord(i,2)+0.01,num2str(i)) %画出城市的编号
end
hold on
d = zeros(n); %初始化两个城市之间的距离
for i = 2:n
    for j = 1:i
        x_i = coord(i,1);
        y_i = coord(i,2);
        x_j = coord(j,1);
        y_j = coord(j,2);
        d(i,j) = sqrt((x_i-x_j)^2+(y_i-y_j)^2);
    end
end
d = d+d'; %生成对称的距离矩阵
min_result = +inf;
min_path = 1:10; %初始化最短路径
N = 10000000;
for k = 1:N
    result = 0;
    path= randperm(n);
    for i = 1:n-1
        result = result + d(path(i),path(i+1));
    end
    result = result+ d(path(1),path(n)); %首尾城市相加
    if result<min_result
        min_result = result;
        min_path = path;
    end
end
disp(['最短的路径为：',num2str(min_path)])
disp(['最短的距离为：',num2str(min_result)])
min_path = [min_path,min_path(1)]; %首尾相连形成闭环

for i = 1:n
    j = i+1;
    x_i = coord(min_path(i),1);
    y_i = coord(min_path(i),2);
    x_j = coord(min_path(j),1);
    y_j = coord(min_path(j),2);    
    plot([x_i,x_j],[y_i,y_j],'-')
    pause(0.5)
    hold on
end