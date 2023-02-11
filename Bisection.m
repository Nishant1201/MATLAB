func = @(x) (exp(-x/4)*(2-x)-1);
xl = 0.;
xr = 2.;
es = 0.001;

fxl = func(xl); fxr = func(xr);
aa = fxl*fxr;

while aa >= 0
    disp(' Root is not in the given range');
    break
end

fprintf('\n Iteration No.    x\n');
for iter = 1: 500
    xm = (xl + xr)/2.;
    fxm = func(xm);
    fxr = func(xr);
    aa = fxm*fxr;
    if aa > 0.
        % Case A: xl < root < xm
        xr = xm;
    else
        % Case B: xm < root < xr
        xl = xm;
    end
    % Check for the tolerance
    xn = (xl + xr)/2.;
    fprintf(' %8d %22.6e\n', iter, xn);
    tol = abs((xn-xm)*100./xn);
    if tol < es
        fprintf('\n The root is %14.6e\n', xn);
        break
    end
end

while tol > es
    fprintf(' Root cannot be reached for\n');
    fprintf(' the given range');
    break
end
