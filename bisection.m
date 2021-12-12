
% Solving questions #11, 12, 13, 14, 15 for ENGR_391 in Assignment 2

% Qestion 11
function Xi = bisection (a, b)

  TOL = 10^-7
  Xi = (a + b) / 2
  error = (b - a) / 2
  
  % Base case for recursion
  if error <= TOL
    Xi
    
  else
    a_i = 2.1*a^4 + 12.2*a^3 + 5.6*a^2 + 12.2*a +3.5;
    x_i = 2.1*Xi^4 + 12.2*Xi^3 + 5.6*Xi^2 + 12.2*Xi +3.5;
    
    if a_i * x_i > 0
      res = bisection(Xi, b);
    else
      res = bisection(a, Xi);
    endif  
    
  endif
  
endfunction


##% Qestion 12
##function Xi = bisection (a, b)
##
##  TOL = 10^-14
##  Xi = (a + b) / 2
##  error = (b - a) / 2
##  
##  % Base case for recursion
##  if error <= TOL
##    Xi
##    
##  else
##    a_i = e^a - 2 - cos(e^a - 2);
##    x_i = e^Xi - 2 - cos(e^Xi - 2);
##    
##    if a_i * x_i > 0
##      res = bisection(Xi, b);
##    else
##      res = bisection(a, Xi);
##    endif  
##    
##  endif
##  
##endfunction


##% Qestion 13
##function Xi = bisection (a, b)
##
##  TOL = 10^-10
##  Xi = (a + b) / 2
##  error = (b - a) / 2
##  
##  % Base case for recursion
##  if error <= TOL
##    Xi
##    
##  else
##    a_i = e^a + 2^(-a) + 2*cos(a) - 6;
##    x_i = e^Xi + 2^(-Xi) + 2*cos(Xi) - 6;
##    
##    if a_i * x_i > 0
##      res = bisection(Xi, b);
##    else
##      res = bisection(a, Xi);
##    endif  
##    
##  endif
##  
##endfunction


##% Qestion 14
##function Xi = bisection (a, b)
##  
##  TOL = 10^-9
##  Xi = (a + b) / 2
##  error = (b - a) / 2
##  
##  % Base case for recursion
##  if error <= TOL
##    Xi
##    
##  else
##    a_i = (a-2)^2 - log(a);
##    x_i = (Xi-2)^2 - log(Xi);
##    
##    if a_i * x_i > 0
##      res = bisection(Xi, b);
##    else
##      res = bisection(a, Xi);
##    endif  
##    
##  endif
##  
##endfunction


##% Qestion 15
##function Xi = bisection (a, b)
##  
##  TOL = 10^-12
##  Xi = (a + b) / 2
##  error = (b - a) / 2
##  
##  % Base case for recursion
##  if error <= TOL
##    Xi
##    
##  else
##    a_i = log(a-1) + cos(a-1);
##    x_i = log(Xi-1) + cos(Xi-1);
##    
##    if a_i * x_i > 0
##      res = bisection(Xi, b);
##    else
##      res = bisection(a, Xi);
##    endif  
##    
##  endif
##  
##endfunction

