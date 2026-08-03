load topsis_data.mat
[n,m]=size(X);
disp(['该数据有' num2str(n) '行' num2str(m) '列']);
%正向化
Judge = input('是否需要正向化（1：是，2：否）：');
if Judge ==1
    Position=input('哪几列要处理（例：2,3,5则输入[2,3,5]）：');
    disp('1：极小型，2：中间型，3：区间型');
    Type=input('请输入每一列的类型，例：[1,3,2]：');
    for i = 1:size(Position,2)
        X(:,Position(i))=Positivization(X(:,Position(i)),Type(i),Position(i));
    end
end

Judge=input('请输入是否需要增加权重（1：是，2：否）：');
if Judge==1
    Judge=input('请输入是否使用熵权法增加权重（1：是，2：否）：');
    if Judge ==1
        if(sum(sum(Z<0))>0)
            for i =1:n
                for  j= 1:m
                    Z(i,j)=(X(i,j)-min(X(:,j)))./(max(X(:,j))-min(X(:,j)));
                end
            end
        end
        weight=Entropy_Method(Z);
    else
        disp("输入格式（例：有三个指标的权重，则输入[0.3,0.5,0.2]）")
        weight=input(['请以行向量的形式输入' num2str(m) '个权重：']);
        ok=0;
        while ok==0
            if abs(sum(weight)-1)<0.001 && size(weight,2)==m
                ok=1;
            else
                weight=input("输入错误，请重新输入：");
            end
        end
        
    end
else
    weight=ones(1,m)./m;
end
disp('权重为：')
disp(weight)
%标准化
Z=X./repmat(sum(X.*X).^0.5,n,1);
disp('标准化后的矩阵为：')
disp(Z)

%归一化
D_P=sum((Z-repmat(max(Z),n,1)).^2.*repmat(weight,n,1),2).^0.5;
D_N=sum((Z-repmat(min(Z),n,1)).^2.*repmat(weight,n,1),2).^0.5;
disp('最后的得分为：')
stand_S=D_N./(D_P+D_N)
[sorted_S,index]=sort(stand_S,'descend')
