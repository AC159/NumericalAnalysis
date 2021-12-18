% Assignment 5 question 19
f = @(x) cos(e^x);

m = 1;
error = [0];
h = [];
I = [];
for i = 1:20
  I = [I; CompositeTrapezoidRule(f, m, 0, pi)];
  h = [h; pi/m ];
  m = m*2;
endfor

% calculate the richardson error
for i = 1:size(h,1)
  
  if i > 1
    richardsonError = abs((I(i,1) - I(i-1,1))/(2^2-1));
    error = [ error; richardsonError ];
  endif
  
endfor

h
error
loglog(h, error, 'bo-')




% Assignment 5 question 20

% Perform Richardon's error formula
%f = @(x) x^x;
%(CompositeSimpsonRule(f, (1/10^-2)/2, 0, 1) - CompositeSimpsonRule(f, 1/10^-2, 0, 1))/(2^4-1)


% Assignment 5 question 21
%f = @(x) x^2/(x^3 - e^(-x));
