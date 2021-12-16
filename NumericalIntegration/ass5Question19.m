% Assignment 5 question 19
f = @(x) cos(e^x);
h2 = pi/10^-5;
h1 = 2*h2;
(CompositeTrapezoidRule(f, h2, 0, pi) - CompositeTrapezoidRule(f, h1, 0, pi))/(2^2-1)

% Assignment 5 question 20

% Perform Richardon's error formula
%f = @(x) x^x;
%(CompositeSimpsonRule(f, (1/10^-2)/2, 0, 1) - CompositeSimpsonRule(f, 1/10^-2, 0, 1))/(2^4-1)


% Assignment 5 question 21
%f = @(x) x^2/(x^3 - e^(-x));
