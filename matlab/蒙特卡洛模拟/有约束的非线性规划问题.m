%%求解的问题
% max f(x) = x1*x2*x3
% s.t.
% (1) -x1+2*x2+2*x3>=0
% (2) x1+2*x2+2*x3<=72
% (3) x2<=20 & x2>=10
% (4) x1-x2 == 10
%% 初始求解
format long g %增加显示精度
n = 10000000;
x1 = unifrnd(20,30,n,1);
x2 = x1 -10;
x3 = unifrnd(-10,16,n,1);
fmax = -inf;
for i = 1:n
    x=[x1(i),x2(i),x3(i)];
    if(-x(1)+2*x(2)+2*x(3)>=0 && x(1)+2*x(2)+2*x(3)<=72)
        result = x(1)*x(2)*x(3);
        if result >fmax
            X=x;
            fmax = result;
        end
    end
end
disp(['求出的最大值为：',num2str(fmax)])
disp(['此时的x1,x2,x3的值分别是：',num2str(X)])

%% 缩小范围再次求解
x1 = unifrnd(22,23,n,1);
x2 = x1 -10;
x3 = unifrnd(11,13,n,1);
fmax = -inf ;
for i = 1:n
    x=[x1(i),x2(i),x3(i)];
    if(-x(1)+2*x(2)+2*x(3)>=0 && x(1)+2*x(2)+2*x(3)<=72)
        result = x(1)*x(2)*x(3);
        if result >fmax
            X=x;
            fmax = result;
        end
    end
end
disp(['再次求出的最大值为：',num2str(fmax)])
disp(['此时的x1,x2,x3的值分别是：',num2str(X)])