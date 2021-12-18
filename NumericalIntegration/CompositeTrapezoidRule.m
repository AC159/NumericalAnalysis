
function I = CompositeTrapezoidRule (FUNCT, m, a, b)
  
  %{
    
    FUNCT is a function handle
    m is the number of subintervals (must be an integer, put 1 if you want to use it in its single version)
    a is the start of the interval 
    b is the end of the interval
    
  %}

  % Caution when m is not an integer, the integral might not be fully evaluated within the integration limits!
  x_vector = linspace(a, b, m+1);
  h = (b-a)/m;
  I =(h/2)*(2*sum(arrayfun(FUNCT, x_vector)) - FUNCT(a) - FUNCT(b))
  
endfunction

%{

  USAGE: 

  1) Make a function handle:
      f = @(x) 2000*log(140000/(140000-2100*x)) - 9.8*x;
      
  2) Call the composite trapezoidal rule
      CompositeTrapezoidRule(f, 4, 8, 30)

%}

