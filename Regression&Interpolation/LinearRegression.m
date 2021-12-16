
function retval = LinearRegression (x, y)

  %{
  
    Inputs x and y are column vectors of size n that represent the data points on 
    which linear regression will be performed
  
  %}
  
  numOfDataPoints = size(x,1);
  
  % Find coefficient a0 and a1:
  a1 = (numOfDataPoints*sum(x.*y) - sum(x)*sum(y)) / (numOfDataPoints*sum(x.^2)-sum(x)^2)
  a0 = (1/numOfDataPoints)*sum(y)-a1*(1/numOfDataPoints)*sum(x)
  
  f = @(x) a0 + x*a1;
  SquaredError = 0;
  for i = 1:size(x,1)
    SquaredError = SquaredError + (y(i) - f(x(i)))^2;
  endfor
  printf("Squared error for a function of type: f(x) = a0 + a1*x\n");
  SquaredError

endfunction

%{
  
    USAGE:
    
    1) Define two column vectors containing the data points:
      x = [ 1; -1; 1; ];
      y = [ 2; 1; 3; ];
      
    2) Call this function to calculate the coefficients
       LinearRegression (x, y)
  
  %}
