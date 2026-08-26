times = 300;
R = zeros(times,1);
K = zeros(times,1);
for i = 1:times
    n = 30; % 样本量
    x1 = -10+rand(n,1)*20;
    u1 = normrnd(0,5,n,1)-rand(n,1);
    x2 = 0.3*x1 +u1;
    u = normrnd(0,1,n,1);
    y = 0.5 + 2*x1 + 5*x2 +u;
    k = (n*sum(x1.*y)-sum(x1)*sum(y))/(n*sum(x1.*x1)-sum(x1)*sum(x1));
    K(i)=k;
    u = 5*x2+u;
    r = corrcoef(x1,u);
    R(i) = r(2,1);
end
plot(R,K,'*')
xlabel("u和x1的相关系数")
ylabel("k的估计值")