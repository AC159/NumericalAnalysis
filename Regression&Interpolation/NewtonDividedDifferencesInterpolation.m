
function matrix = NewtonDividedDifferencesInterpolation (x, y)

  
  %{ 
  
    inputs x and y are row vectors of n data points
  
  %}
  
  n = size(x,2);
  v = zeros(n,n);
  
  % Fill in y (first) column of Newton triangle
  for j = 1:n
    v(j,1) = y(j);
  endfor
  
  % For column i, fill in column from top to bottom
  for i = 2:n
    for j = i:n
      v(j,i) = (v(j,i-1) - v(j-1,i-1)) / (x(j)-x(j-i+1));
    endfor
  endfor
  v
  % Read along top of the triangle for coefficients
  matrix = zeros(1,n);
  for i = 1:n
    matrix(i) = v(i,i);
  endfor

  printf("Here are the coefficients f[X1, X2, ..., Xm]\n")
  for i = 1:n
    printf("b%d: %f\n", i-1, matrix(i))
  endfor
  
endfunction


%{
    
  USAGE:

  1) Define row vectors x and y:
    
    x = [ -1 0 2 3 ];
    y = [ -5 -1 1 11 ];
    
  2) Call the function
  
    NewtonDividedDifferencesInterpolation(x, y);
    
%}

