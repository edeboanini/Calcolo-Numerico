function [f,jacobian] = fun(x)

    F = eye(50) * 4;
    for i = 1:49
        F(i, i+1) = 1;
        F(i+1, i) = 1;
    end
    e = ones(50,1);
    a = 2;
    b = -1.1;  
    grad = @(x) F * x - a * e .* sin(a * x) - b * e .* exp(-x);
    jacob = @(x) F - a^2 * diag(e .* cos(a * x)) + b * diag(e .* exp(-x));

    f=grad(x);
    jacobian=jacob(x);

end

