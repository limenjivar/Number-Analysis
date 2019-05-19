%Halley's Method
f = inline('x^4 - 4*x +1');        %function
df = inline('4*x^3 - 4');          %first derivative
ddf = inline('12*x^2');            %second derivative
p0 = 0;                            %first initial condition
%p0=1.2;                           %second initial condition
iter = 0;
format long
fprintf('Iterations     xn       f(xn)      Absolute err.    Relative err.\n')
fprintf('---------    ------    ----------  ------------    --------------\n')
for n = 1:200
    p = p0-((f(p0)*df(p0))/((df(p0))^2-0.5*f(p0)*ddf(p0)));
    err1 = abs(p);
    err2 = abs(p-p0);
    err3 = abs(err2/p);
    iter = iter +1; 
    fprintf('%3i %16f %12.8f %12f %16f\n' ,iter,p,f(p),err2, err3)
    if err1 >= 10^(-8) & err2 >= 10^(-8)
        p0 = p;        
    else
        break
    end
end
answer = p, iterations = iter, err2, err3