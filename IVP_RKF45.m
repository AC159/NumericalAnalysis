
function [t,w] = IVP_RKF45 (f, t0, y0, h, intervalLength, TOL)

  %{
    Runge-Kutta 45 method to solve initial value problems:
    f is the function handle
    t0 is the initial x value
    y0 is the initial y value
    h is the initial step size
    intervalLength is the interval length for t
    TOL is the error tolerance
  %}
  
  w=[y0];
  t=[t0];
  error = 1;
  
  while error > TOL
    k1 = h*f(t(i), w(i));
    k2 = h*f(t(i)+h/4, w(i)+k1*(1/4));
    k3 = h*f(t(i)+3*h/8, w(i) + k1*(3/32) + k2*(9/32));
    k4 = h*f(t(i)+12*h/13, w(i) + 1932*k1/2197 - 7200*k2/2197 + 7296*k3/2197);
    k5 = h*f(t(i)+h, w(i) + 439*k1/216 - 8*k2 + 3680*k3/513 - 845*k4/4104);
    k6 = h*f(t(i)+h/2, w(i) - 8*k1/27 + 2*k2 - 3544*k3/2565 + 1859*k4/4104 - 11*k5/40);
    
    w = [w; w(i) + 25*k1/216 + 1408*k3/2665 + 2197*k4/4104 - k5/5 ]; % this is w i+1
    
    % This is the other estimation in order to calculate the new step size h
    other_w = [w; w(i) + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55 ];
    
    % Calculate the new step size h
    h = h*(TOL*h/(2*other_w(end)-w(end)))^(1/4);
    
    t=[t; t(i)+h];
  endwhile

endfunction

%{
  USAGE:
  
  1) Declare a function handle:
      f = @(t,y) t*y+t^3;
      
  2) Call the function for a single y
     [t, w] = IVP_RKF45(f, t0, y0, h, intervalLength, TOL)
%}
