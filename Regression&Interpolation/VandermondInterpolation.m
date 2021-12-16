
function polynomialCoefficients = VandermondInterpolation (x, y)
  
  %{
    
    Inputs x and y are data points (column vectors) of size n
    
  %}
  
  % Build the vandermond matrix
  n = size(x,1);
  vandermondMatrix = zeros(n,n);
  
  for index = 0:n-1
    vandermondMatrix(:,index+1) = x.^index;
  endfor
  
  % Solve the system of equations
  polynomialCoefficients = vandermondMatrix\y;

endfunction

%{
    
  USAGE:

  1) Define column vectors x and y:
    
    x = [ 0; 2; 3; ]
    y = [ 1; 2; 4; ]
    
  2) Call the function
  
    VandermondInterpolation (x, y)
    
%}

