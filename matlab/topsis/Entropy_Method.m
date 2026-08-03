function[W]=Entorpy_Method(Z)
    [n,m]=size(Z);
    D=zeros(1,m);
    for i =1:m
        X=Z(:,i);
        P=X/sum(X);
        e=-sum(P.*mylog(P))/log(n);
        D(i)=1-e;
    end
    W=D./sum(D);