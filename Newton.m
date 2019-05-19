% Newton method
f=inline('x^3 + 3*x + 1');                    % given function
df=inline('3*x +3');                         % the derivative
p0=1; iter=0;
for n=1:200
    p=p0-(f(p0)/df(p0));
    err1=abs(p)
    err2=abs(p-p0);
     iter=iter+1;
    if err1>=10^(-4) & err2>=10^(-4)
        p0=p;
    else
        break
    end
end
answer=p, iterations=iter, err1, err2