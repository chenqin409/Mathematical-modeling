load gdp.mat
%预处理
Mean = mean(gdp);
gdp = gdp./repmat(Mean,size(gdp,1),1);
disp('预处理后的数据为：')
disp(gdp)
%确定分析数列
Y = gdp(:,1);
X = gdp(:,2:end);
%计算关联系数
absX0_Xi = abs(X-repmat(Y,1,size(X,2)));
a = min(min(absX0_Xi));
b = max(max(absX0_Xi));
rho = 0.5;
gamma = (a+rho*b)./(absX0_Xi+rho*b);
disp('灰色关联度为：')
disp(mean(gamma))
