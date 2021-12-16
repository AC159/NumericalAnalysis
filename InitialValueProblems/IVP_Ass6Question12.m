
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
  error = 1;
  h1 = h;
  h2 = h1/2;
  
  while error > TOL
    
    % Call the RK2 method twice in order to calculate the Richardson error
    [t1,w1] = IVP_Midpoint(f, t0, [y0], h1, intervalLength/h1);
    [t2,w2] = IVP_Midpoint(f, t0, [y0], h2, intervalLength/h2);
    
    t = [t; t1];
    w = [w; w1];
    
    error = abs((w2(end)-w1(end)) / ((h1/h2)^2-1))
    
    % Diminish the step size for the next iteration if the error is still greate than the TOL
    h1 = h2;
    h2 = h1/2;
  
  endwhile

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
