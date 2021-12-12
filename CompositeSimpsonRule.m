
function I = CompositeSimpsonRule (FUNCT, m, a, b)

  %{
    
    FUNCT is a function handle
    m is the number of subintervals (must be an integer)
    a is the start of the interval 
    b is the end of the interval
    
  %}
  
  h = (b-a)/(2*m);
  x1 = linspace(a+h,b-h,m);
  x2 = linspace(a+2*h,b-2*h,m-1);
  I = (h/3)*(FUNCT(a)+FUNCT(b)+4*sum(arrayfun(FUNCT, x1))+2*sum(arrayfun(FUNCT, x2)))

endfunction

%{

  USAGE: 

  1) Make a function handle:
      f = @(x) 2000*log(140000/(140000-2100*x)) - 9.8*x;
      
  2) Call the the composite trapezoidal rule
      CompositeSimpsonRule(f, 4, 8, 30)

%}
