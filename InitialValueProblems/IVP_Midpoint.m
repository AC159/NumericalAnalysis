
function [t,w] = IVP_Midpoint (f, t0, y0, h, n)
  
  %{
    Runge-Kutta midpoint method to solve initial value problems:
    f is the function handle
    t0 is the initial x value
    y0 is the initial y value
    h is the step size
    n is the number of iterations to perform
  %}
  
  w=[y0];
  t=[t0];
  
  for i = 1:n
    k1=f(t(i), w(i,:));
    k2=f(t(i)+h/2, w(i,:)+h/2*k1);
    w=[w ; w(i,:)+h*k2];
    t=[t ; t(i)+h];
  endfor

endfunction

%{
  USAGE:
  
  1) Declare a function handle:
      f = @(t,y) t*y+t^3;
      
      For system of equations:
      
      function z=f(t,y)
       z(1)=y(2)^2-2*y(1); %{ declare first ODE
       z(2)=y(1)-y(2)-t*y(2)^2; %{ declare second ODE
      endfunction
      
  2) Call the function for a single y or for multiple y values (for systems of equations)
     [t, w] = IVP_Midpoint (f, 0, [1], 1/3, 3)
     
     for systems of equations
     [t, w] = IVP_Midpoint (@f, 0, [0 1], 1/3, 3)
%}
