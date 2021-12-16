
function [t,w] = RungeKutta4 (f, t0, y0, h, n)

  %{
    Runge-Kutta 4 method to solve initial value problems:
    f is the function handle
    t0 is the initial x value
    y0 is the initial y value
    h is the step size
    n is the number of iterations to perform
  %}

  w=[y0];
  t=[t0];
  
  for i = 1:n
    k1=f(t(i),w(i,:));
    k2=f(t(i)+h/2,w(i,:)+k1*(h/2));
    k3=f(t(i)+h/2,w(i,:)+k2*(h/2));
    k4=f(t(i)+h,w(i,:)+k3*h);
    w=[w; w(i,:)+(h/6)*(k1+2*k2+2*k3+k4)];
    t=[t; t(i)+h];
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
     [t, w] = RungeKutta4 (f, 0, [1], 1/3, 3)
     
     for systems of equations
     [t, w] = RungeKutta4 (@f, 0, [0 1], 1/3, 3)
%}
