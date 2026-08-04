load data_water_quality.mat
%正向化
[n,m]=size(Z);
disp(['该数据有' num2str(n) '行' num2str(m) '列']);
Judge = input('是否需要正向化（1：是，2：否）：');
if Judge ==1
    Position=input('哪几列要处理（例：2,3,5则输入[2,3,5]）：');
    disp('1：极小型，2：中间型，3：区间型');
    Type=input('请输入每一列的类型，例：[1,3,2]：');
    for i = 1:size(Position,2)
        Z(:,Position(i))=Positivization(Z(:,Position(i)),Type(i),Position(i));
    end
end
%预处理
Mean = mean(Z);
Z = Z./repmat(Mean,size(Z,1),1);
disp('预处理后的数据为：')
disp(Z)
%构造母序列与子序列
Y=max(Z,[],2);
X=Z;
%计算灰色关联系数
absX0_Xi = abs(X-repmat(Y,1,size(X,2)));
a = min(min(absX0_Xi));
b = max(max(absX0_Xi));
rho = 0.5;
gamma = (a+rho*b)./(absX0_Xi+rho*b);
%计算各指标权重
weight=mean(gamma)/sum(mean(gamma));
%计算每个评价对象的得分
score=sum(X.*repmat(weight,size(X,1),1),2);
%归一化
stand_S=score./sum(score)
[sorted_S,index]=sort(stand_S,'descend')