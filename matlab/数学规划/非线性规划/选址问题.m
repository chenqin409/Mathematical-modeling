format long g
A = zeros(2,16);
A(1,1:6) = 1;
A(2,7:12) = 1;
b = [20 20]';
Aeq = zeros(6,16);
for i = 1:6
    Aeq(i,i) =1;
    Aeq(i,i+6) = 1;
end
beq = [3 5 4 7 6 11];
lb = zeros(16,1);
x0 = [3 5 0 7 0 1 0 0 4 0 6 10 5 1 2 7];  % 用第一问的结果作为初始值
[x,fval] = fmincon(@fun1,x0,A,b,Aeq,beq,lb);
reshape(x(1:12),6,2)
fval
