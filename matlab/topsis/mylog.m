function[lnp]=mylog(p)
    n=length(p);
    lnp=zeros(n,1);
    for i =1:n
        if p(i)==0
            lnp(i)=0;
        else
            lnp(i)=log(p(i));
        end
    end
        