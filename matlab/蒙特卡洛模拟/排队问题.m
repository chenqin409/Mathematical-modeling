normrnd(0,1) %生成一个服从正态分布的随机数，均值为0，标准差为1
exprnd(5) %生成一个服从指数分布的随机数，均值为5
tic
a=2^100;
toc %计算代码运行的时间

%% 模拟一天
tic
i = 0; %第i个用户
w = 0; %所有用户的等待时间

while true
    i = i+1;
    if i == 1
        come(i) = exprnd(10);
        begin(i) = come(i);
    else
        come(i) = come(i-1) + exprnd(10); %第i个用户到达的时间
        begin(i) = max(come(i),exit(i-1));%第i个用户开始服务的时间
    end
    if begin(i)>=480
        i=i-1;
        break
    end
    time(i) = max(normrnd(10,2),1); %第i个用户服务时长
    exit(i) = begin(i)+time(i);     %第i个用户结束服务的时间
    wait(i) = begin(i) - come(i);   %第i个用户等待的时间
    w = w+wait(i);    
end
disp(['当天服务人数为',num2str(i)])
disp(['用户平均等待时长为：',num2str(w/i)])
toc

%% 模拟100天
day =100;
p = zeros(day,1);
t = zeros(day,1);
for k = 1:day
    i = 0; 
    w = 0; 

    while true
        i = i+1;
        if i == 1
            come(i) = exprnd(10);
            begin(i) = come(i);
        else
            come(i) = come(i-1) + exprnd(10); 
            begin(i) = max(come(i),exit(i-1));
        end
        if begin(i)>=480
            i=i-1;
            break
        end
        time(i) = max(normrnd(10,2),1); 
        exit(i) = begin(i)+time(i); 
        wait(i) = begin(i) - come(i); 
        w = w+wait(i);    
    end
    p(k) = i;
    t(k) = w/i;
end
disp(['平均每天服务人数为：',num2str(mean(p))])
disp(['用户每天平均等待时长为：',num2str(mean(t))])
    