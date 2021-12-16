
function I = Composite_1PointNewtonCotesIntegration (FUNCT, m, a, b)

  %{
    
    FUNCT is a function handle
    m is the number of subintervals (must be an integer)
    a is the start of the interval 
    b is the end of the interval
    
  %}
  
  % This is the composite 1-point Newton-Cotes formula
  
  h = (b-a)/m;
  I = 0;
  d1 = a;
  d2 = d1 + h;
  for index = 1:m
    I = I + (d2-d1)*FUNCT((d1+d2)/2);
    d1 = d2;
    d2 = d2 + h;
  endfor

endfunction

%{

  USAGE: 

  1) Make a function handle:
      f = @(x) 2000*log(140000/(140000-2100*x)) - 9.8*x;
      
  2) Call the the composite trapezoidal rule
      Composite_1PointNewtonCotesIntegration(f, 4, 8, 30)

%}

