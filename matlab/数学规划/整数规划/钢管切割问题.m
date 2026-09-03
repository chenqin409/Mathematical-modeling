% 枚举法列出所有切割方案
for i = 0:2
    for j = 0:3
        for k = 0:6
            if 2.9*i +2.1*j + 1*k >=6.9 - 0.9 && 2.9*i +2.1*j + 1*k <= 6.9
                disp([i,j,k])
            end
        end
    end
end

c= ones(7,1);
intcon = 1:7;
A = -[1 2 0 0 0 0 1;  
      0 0 3 2 1 0 1;
      4 1 0 2 4 6 1];  
b = -[100 100 100]'; 
lb = zeros(7,1);
[x,fval] = intlinprog(c,intcon,A,b,[],[],lb);
disp(x)
disp(fval)