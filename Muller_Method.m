%Muller Method
f=inline('x^4-4*x+1');       %Given function
format long
p0=0; p1=0.1; p2 = 0.12;        %Initial Conditions for zero in [0,1]
%p0 = 1; p1 = 1.1; p2 = 1.2     %Initial conditions for zero in [1,2]
h1 = p1-p0; h2 = p2-p1;
delta1 = (f(p1)-f(p0))/h1;
delta2 = (f(p2)-f(p1))/h2;
d = (delta2-delta1)/(h2+h1);
iter=0;
format long
fprintf('Iterations     xn       f(xn)      Absolute err.    Relative err.\n')
fprintf('---------    ------    ----------  ------------    --------------\n')
for n=1:200
    b = delta2+h2*d;
    D = (b^2-4*f(p2)*d)^(1/2);
    if abs(b-D) < abs(b+D)
        E = b+D;
    else
        E = b-D;
    end
    h = -2*f(p2)/E;
    p = p2+h;
    err = abs(p-p2);
    err2 =  abs(err/p);
    if err >= 10^(-8)
    p0 = p1; p1 = p2; p2 = p;
    h1 = p1-p0; h2=p2-p1;
    delta1 = (f(p1)-f(p0))/h1;
    delta2 = (f(p2)-f(p1))/h2;
    d = (delta2-delta1)/(h2+h1);
    iter=iter+1;
    fprintf('%3i %16f %12.8f %12f %16f\n' ,iter,p,f(p),err, err2)
    else
        break
    end
end
answer=p,iterations=iter, err, err2