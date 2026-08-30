unique([1,2,5;4,6,2;5,1,2]) %剔除重复值并从小到大排序

%% 
min_money = +inf;
min_result = randi([1,6],1,5); %初始化五本书购买的门店
n = 100000;
M = [18	 39	29	48	59
    24	45	23	54	44
    22	45	23	53	53
    28	47	17	57	47
    24	42	24	47	59
    27	48	20	55	53]; %列标签：书店，行标签：书的价格
freight = [10 15 15 10 10 15]; %各家店的运费
for k = 1:n
    result = randi([1,6],1,5);
    index = unique(result); %购买的图书的店铺
    money = sum(freight(index)); %运费
    for i = 1:5
        money = money + M(result(i),i);
    end
    if money<min_money
        min_money = money;
        min_result = result;
    end
end
disp(['最低的价格为：',num2str(min_money)])
disp(['每本书购买的书店分别是：',num2str(min_result)])
