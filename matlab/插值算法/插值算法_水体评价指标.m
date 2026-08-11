load Z.mat
x = Z(1,:);
[n,m]=size(Z);
ylab={'周数','轮虫','溶氧','COD','水温','PH值','盐度','透明度','总碱度','氯离子','透明度','生物量'};
disp(['共有' num2str(n-1) '个指标要进行差值'])
P=zeros(n,2*m-1);
for i =2:n
    y=Z(i,:);
    new_x=1:2*m-1;
    p1 = pchip(x,y,new_x);
    subplot(4,3,i-1) %手动调节
    plot(x,y,'ro',new_x,p1,'-')
    axis([0 15,-inf,inf])
    ylabel(ylab{i})
    P(i-1,:)=p1;
end
legend('原始数据','三次埃尔米特插值数据','Location','SouthEast')
P=[1:2*m-1;P]

