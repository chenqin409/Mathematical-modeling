load data1.mat
n=size(x,1);
plot(x,y,'o')
hold on
grid on

%最小二乘法
k=(sum(x.*y)*n-sum(y)*sum(x))/(sum(x.*x)*n-sum(x)*sum(x));
b=(sum(x.*x)*sum(y)-sum(x)*sum(x.*y))/(sum(x.*x)*n-sum(x)*sum(x));
f = @(x)k*x+b;
fplot(f,[2.5,7])
legend("样本点","拟合函数")

%评估
y_hat = k*x+b;
SSR = sum((y_hat-mean(y)).^2);
SSE = sum((y-y_hat).^2);
SST = sum((y-mean(y)).^2);
SST-SSE-SSR
R2_ = SSR/SST