
function rmse = RMSE(A, x, b)

  % Calculate the root mean squared error of the system of inconsistent equations
  
  %{ 
  
    Inputs A is the coefficient matrix, x is the solution of the inconsistent
    system of equations (column vector) and b is the solution vector
  
  %}
  
  r = b - A*x;
  squaredError = norm(r,2)^2;
  rmse = sqrt(squaredError / size(x,1));

endfunction

%{

  USAGE:
  
  1) Make vectors A, b and x:
  
     A = [ 1 -4; 2 3; 2 2; ];
     b = [ -3; 15; 9 ];
     Solve for x with PA = LU decomposition:
     x = A\b;
     
  2) Call the rmse function:
    RMSE(A, x, b)

%}
