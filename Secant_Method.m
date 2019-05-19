_   %Secant Method
f=inline('x^4-4*x+1');       %Given function
format long
p0=0; p1=1;                  %first initial conditions
%p0=1; p1=2;               %second initial conditions
q0=f(p0); q1=f(p1);
iter=0;
format long
fprintf('Iterations     xn       f(xn)      Absolute err.    Relative err.\n')
fprintf('---------    ------    ----------  ------------    --------------\n')
for n=1:200
    p = p1-q1*(p1-p0)/(q1-q0);
    err = abs(p-p1);
    err2 =  abs(err/p);
    if err >= 10^(-8)
    p0 = p1; q0 = q1; p1 = p; q1 = f(p);
    iter=iter+1;
    fprintf('%3i %16f %12.8f %12f %16f\n' ,iter,p,f(p),err, err2)
    else
        break
    end
end
answer=p, iterations=iter, err, err2
