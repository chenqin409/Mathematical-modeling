format long g
a=[1.25  8.75  0.5  5.75  3  7.25];  % 5个工地的横坐标
b=[1.25  0.75  4.75	5  6.5  7.25];   % 5个工地的纵坐标
x = [5  2];  % 2个料场的横坐标
y = [1  7];  % 2个料场的纵坐标
c=[]; %初始化工地和料场的距离向量
for j =1:2
    for i = 1:6
        c = [c;sqrt((a(i)-x(j))^2+(b(i)-y(j))^2)]; %每次循环在末尾添加新值
    end
end

%不等式约束
A = zeros(2,12);
A(1,1:6) = 1;
A(2,7:12) = 1;
b = [20,20]';
% 等式约束
Aeq = zeros(6,12);
for i = 1:6
    Aeq(i,i) = 1;
    Aeq(i,i+6) = 1;
end
% 另一种写法：Aeq = [eye(6),eye(6)]
beq = [3 5 4 7 6 11]'; % 每个工地的日需求量
lb = zeros(12,1);
[x,fval] = linprog(c,A,b,Aeq,beq,lb);
x= reshape(x,6,2);
disp('x的值为：')
disp(x)
disp(['最小值为：',num2str(fval)])

