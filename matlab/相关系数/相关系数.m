load female_data.mat
MIN = min(Test);
MAX = max(Test);
MEAN = mean(Test);
MEDIAN = median(Test);
SKEWNESS = skewness(Test);
KURTOSIS = kurtosis(Test);
STD = std(Test);
RESULT = [MIN;MAX;MEAN;MEDIAN;SKEWNESS;KURTOSIS;STD];

%% 皮尔逊相关系数
R=corrcoef(Test)

%假设检验
x = -4:0.1:4;
y = tpdf(x,28);
plot(x,y,'-')
grid on
hold on
a=tinv(0.975,28);
plot([-a,-a],[0,tpdf(-a,28)],'-')
plot([a,a],[0,tpdf(a,28)],'-')

%计算p值
t = 0.5*sqrt((30-2)/(1-0.5*0.5));
p = (1-tcdf(t,28))*2;
[R,P]= corrcoef(Test);
P<0.01
(P<0.05).*(P>0.01)
(P<0.1).*(P>0.05)

%% 验证正态分布
X = normrnd(2,3,100,1);%样本量100*1，均值为2，标准差为2
skewness(X) %偏度
kurtosis(X) %峰度

%JB验证（n>30）
[h,p] = jbtest(Test(:,1),0.05);
n_c = size(Test,2);
H = zeros(1,n_c);
P = zeros(1,n_c);
for i = 1:n_c
    [h,p] = jbtest(Test(:,i),0.05);
    H(i)=h;
    P(i)=p;
end
disp(H)  %1:假设不成立，不是正态分布；0：假设成立，是正态分布
disp(P)

%Shapiro-wilk检验(3 ≤ n ≤ 50)->Spass

%Q-Q图
qqplot(Test(:,1))

%% 斯皮尔曼相关系数
%法1
RX = [2 5 3 4 1];
RY = [1 4.5 3 4.5 2];
R = corrcoef(RX,RY)
%法2
X = [3 8 4 7 2]' ; % 转成列向量
Y = [5 10 9 10 6]';
coeff = corr(X,Y,'type','Spearman')
R = corr(Test,'Type','Spearman') %求每一列

%大样本下检验
disp(sqrt(590)*0.0301) % 计算检验值
disp((1-normcdf(0.7311))*2) % 计算p值
[R,P]=corr(Test, 'type' , 'Spearman')