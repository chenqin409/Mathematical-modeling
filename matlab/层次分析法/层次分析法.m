A=input('请输入矩阵');
%%算术平均法
sum_A=sum(A);
[n,n]=size(A);
sum_rA=repmat(sum_A,n,1);
A_a=A./sum_rA; %归一化
A_n=sum(A_a,2); %按行求和
A_1=A_n/n; %求权重
disp(A_1)

%%几何平均法
A_prod=prod(A,2); %按行相乘
A_nl=A_prod.^(1/n); %开n次方
A_2=A_nl/sum(A_nl);%求权重
disp(A_2)

%%特征值法
[V,D]=eig(A);
m_mD=max(max(D));%求出最大特征值
[r,c]=find(D==m_mD,1);%找到最大特征值的坐标
A_3=V(:,c)/sum(V(:,c));%求权重
disp(A_3)

%%一致性检验
RI = [0,0,0.58,0.90,1.12,1.24,1.32,1.41,1.45,1.49,1.52,1.54,1.56,1.58,1.59];
CI=(m_mD-n)/(n-1);
CR=CI/RI(n);
if CR<0.1
    disp("可以接受");
else
    disp("不可接受");
end

