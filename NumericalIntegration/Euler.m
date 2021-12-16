
function [t, w] = Euler (FUNC, t0, y0, h, n)

  %{
    Eulers' method to calculate Initial-value problems
    FUNC is the function handle
    t0 is the initial x value of the function
    y0 is the initial value (it is a row vector)
    h is the step size
    n is the number of iteration to perform
  %}

  w=[y0];
  t=[t0];
  
  for i = 1:n
    w_i = w(i,:)+h*FUNC(t(i),w(i,:));
    w=[w ; w_i];
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
     [t, w] = Euler (f, 0, [1], 1/3, 3);
     
     for systems of equations
     [t, w] = Euler (@f, 0, [0 1], 1/3, 3);
%}
