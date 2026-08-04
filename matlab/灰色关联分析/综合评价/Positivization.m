function[posit_x] =Positivization(x,type,i)
    if type == 1
        disp(['正在处理第' num2str(i) '列'])
        posit_x = Min2Max(x);
        disp('处理完成')
    elseif type == 2
        disp(['正在处理第' num2str(i) '列'])
        best=input('请输入最佳值：');
        posit_x = Mid2Max(x,best);
        disp('处理完成')
    elseif type == 3
        disp(['正在处理第' num2str(i) '列'])
        a=input('请输入下界：');
        b=input('请输入上界：');
        posit_x = Inter2Max(x,a,b);
        disp('处理完成')
    else
        disp('输入错误，请检查。')
    end
end
