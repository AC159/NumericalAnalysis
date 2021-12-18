
function [ squaredError, meanSquaredError, rmse ] = RMSE(FUNC, x, y)

  % Calculate the root mean squared error of the system of inconsistent equations
  
  %{ 
  
    Inputs 
    FUNC is a function handle that models the equation we want to fit
    x is the vector of x-values of the data set
    y is the vector of y-values of the data set
  
  %}
  
  squaredError = sum((y - arrayfun(FUNC, x)).^2);
  meanSquaredError = squaredError / size(y,1);
  rmse = sqrt(meanSquaredError);

endfunction

%{

  USAGE:
  
  1) Make a function handle and define the data points x and y
  
     f = @(x) -1 + x;
     x = [ -1; 2; 3; ];
     y = [ 3; 2; 1; ];
     
  2) Call the rmse function:
    [ squaredError, meanSquaredError, rmse ] = RMSE(f, x, y)

%}
