
function hValues = IVP_Ass6Question14 (f, t0, y0, h, intervalLength, TOL)

  %{
    Function that determines for which values of step size h, the Richardson error will be below the given TOL
    Uses the RK4 method
    f is the function handle
    t0 is the initial x value
    y0 is the initial y value
    h is the list (array) of step sizes
    intervalLength is the interval length for t
    TOL is the error tolerance
  %}
  
  
##  t = [y0];
##  w = [y0];
##  error = [0];
##  hValues = [];
##  n = 1;
##  h1 = intervalLength/n;
##  
##  for i = 1:15  
##    [t1,w1] = RungeKutta4(f, t0, [y0], h1, n);
##    t = [t; t1(end)];
##    w = [w; w1(end)];
##    hValues = [hValues; h1];
##    n = n*2;
##    h1 = intervalLength/n;
##  endfor
##  
##  % Calculate Richardson error
##  for i = 1:size(hValues,1)
##    if i > 1
##      err = abs((w(i)-w(i-1)) / (2^2-1));
##      error = [error; err];
##    endif
##  endfor
##  
##  loglog(hValues, error, 'bo-')
  
  % ==========================================================================================================================
  
  
  hValues = [];
  
  for i = 1:size(h,2)
    
    h1 = h(1,i);
    h2 = h1/2;
    n1 = intervalLength / h1;
    n2 = intervalLength / h2;
    
    % Call the RK4 method for h1
    [t1, w1] = RungeKutta4(@f, 0, [1 1], h1, n1);
    
    % Call the RK4 method for h2
    [t2, w2] = RungeKutta4(@f, 0, [1 1], h2, n2);
    
    % Calculate the Richardson error for all values of w
    for j = 1:size(w1,2)
      error1 = abs((w2(end,1)-w1(end,1)) / ((h2/h1)^4 -1));
      error2 = abs((w2(end,end)-w1(end,end)) / ((h2/h1)^4 -1));
      if error1 < TOL && error2 < TOL
        hValues = [ hValues; h1 ]; % This value of h produces errors less than the TOL so it is correct
        hValues = unique(hValues); % Extract unique values of h to avoid repetition
      endif
    endfor
    
  endfor

endfunction

%{
  USAGE:
  
  1) Declare a function handle:
      function z=f(t,y)
        z(1) = y(2);
        z(2) = y(1)*cos(t) - y(1)*sin(t);
      endfunction  
      
  2) Call the function
     hValues = IVP_Ass6Question14 (@f, 0, [ 1 1 ], [ 10^0 10^-1 10^-2 10^-3 ], 4, 10^-8)
     
%}

