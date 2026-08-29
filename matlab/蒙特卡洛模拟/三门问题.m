randi([1,5],5,8) %在[1,5]内生成5×8的整数矩阵
randi([1,5]) %在[1,5]内生成一个整数

%% 在获奖的条件下
n=100000;
a = 0; % 不改变主意获奖的次数
b = 0; % 改变主意获奖的次数
for i =1:n
    x = randi([1,3]); %奖品在x门后
    y = randi([1,3]); %用户选择y门
    if x==y
        a = a+1;
    else
        b = b+1;
    end
end
disp(['不改变主意获奖的概率为：',num2str(a/n)])
disp(['改变主意获奖的概率为：',num2str(b/n)])

%% 无条件概率（考虑没获奖的情况）
a = 0;
b = 0;
c = 0; % 未获奖的次数
for i = 1:n
    x = randi([1,3]);
    y = randi([1,3]);
    change=randi([0,1]); %是否改变主意
    if x==y
        if change ==0
            a=a+1;
        else
            c=c+1;
        end
    else
        if change ==0
            c=c+1;
        else
            b = b+1;
        end
    end
end
disp(['不改变主意获奖的概率为：',num2str(a/n)])
disp(['改变主意获奖的概率为：',num2str(b/n)])
disp(['失败的概率为：',num2str(c/n)])