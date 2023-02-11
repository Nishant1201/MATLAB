func = @(x) (exp(-x/4)*(2-x)-1);
xl = 0; xr = 2; es = 0.001;
fxl = func(xl); fxr = func(xr);
aa = fxl*fxr;

while aa >= 0
    disp(' Root is not in the given range');
    break
end
x1old = xl;
fprintf('\n    Iteration No.        x\n');
for iter = 1:500
    xm = (xl + xr)/2.;
    fxm = func(xm);
    fxr = func(xr);
    x1 = (xl*fxr - xr*fxl)/(fxr-fxl);
    fx1 = func(x1);
    aa = fx1*fxr;
    if aa < 0
        % Case A : x1 < root < xr
        xl = x1;
    else
        % Case B : xl < root < x1
        xr = x1;
    end
    % Check for the tolerance
    fprintf(' %8d %22.6e\n', iter, x1);
    tol = abs((x1-x1old)*100./x1);
    if tol < es
        fprintf('\n The root is %14.6e\n',x1)
        break
    end
    x1old = x1;
end

while tol > es
    fprintf(' Root cannot be changed for\n');
    fprintf(' the given range');
    break
end

