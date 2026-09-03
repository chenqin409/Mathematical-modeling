c = -[540 200 180 350 60 150 280 450 320 120];  
intcon = 1:10;
A = [6 3 4 5 1 2 3 5 4 2];  
b = 30;
Aeq = [];
beq = [];
lb = zeros(10,1);
ub = ones(10,1);
[x,fval] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub);
fval = -fval;
disp(x)
disp(fval)