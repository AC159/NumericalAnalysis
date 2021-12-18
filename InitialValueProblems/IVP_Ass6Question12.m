
function [t,w] = IVP_Ass6Question12 (f, t0, y0, h, TOL, intervalLength)
  
  %{
    Find the value at the given point with an error less than the TOL
    f is the function handle
    t0 is the initial x value
    y0 is the initial y value
    h is the initial step size
    TOL is the error tolerance
    intervalLength is the length of the interval for t
  %}
  
  
  t = [y0];
  w = [y0];
  error = [0];
  hValues = [];
  n = 1;
  h1 = intervalLength/n;
  
  for i = 1:17  
    [t1,w1] = RungeKutta4(f, t0, [y0], h1, n);
    t = [t; t1(end)];
    w = [w; w1(end)];
    hValues = [hValues; h1];
    n = n*2;
    h1 = intervalLength/n;
  endfor
  
  % Calculate Richardson error
  for i = 1:size(hValues,1)
    if i > 1
      err = abs((w(i)-w(i-1)) / (2^4-1));
      error = [error; err];
    endif
  endfor
  
  loglog(hValues, error, 'bo-')
  
  % ==========================================================================================================================
  
  % Diminishing step size h gradually until the error is under the given TOL
  t = [y0];
  w = [y0];
  error = 1;
  h4 = h;
  h5 = h4/2;
  
  while error >= TOL
    
    % Call the RK2 method twice in order to calculate the Richardson error
    [t1,w1] = IVP_Midpoint(f, t0, [y0], h4, intervalLength/h4);
    [t2,w2] = IVP_Midpoint(f, t0, [y0], h5, intervalLength/h5);
    
    t = [t; t1];
    w = [w; w1];
    
    error = abs((w2(end)-w1(end)) / ((h5/h4)^2-1))
    
    % Diminish the step size for the next iteration if the error is still greater than the TOL
    h4 = h5;
    h5 = h4/2;
  
  endwhile

  printf("Step size h used that gave an error estimation below the given tolerance: \n")
  h4
  
endfunction

%{
  USAGE:
  
  1) Declare a function handle:
      f = @(t,y) (1-t)*y+sin(y);
      
  2) Call the function for a single y or for multiple y values (for systems of equations)
     [t,w] = IVP_Ass6Question12 (f, -1, 0.5, 0.1, 10^-8, 3);
     % to get the approximated values
     t(end)
     w(end)
     
%}
