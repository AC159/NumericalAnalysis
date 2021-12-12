
function retval = ass4Question12 (input1, input2)

  % model function: T = a0 + a1sin(2*pi*t) + a2cos(2*pi*t)
  
  table = xlsread('C:\Users\Anastassy Cap\Downloads\GlobalTemperatures.xlsx');
  
  % Extract the b and x vectors from the matrix
  b = table(:, 2)
  x = table(:, 3)
  printf("Size of x: ")
  size(x, 1)
  
  % Get size of the matrix
  [m,n] = size(table);
  
  % Create a new Mx4 matrix that we will fill, 4 because we have 4 parameters a0, a1, a2
  A = zeros(m, 4)
  
  % Fill the A matrix with the coefficients of the inconsistent equations
  i = 1;
  for index = 1:size(x, 1)
    index;
    x(index);
    temp = [ 1 x(index) x(index)^2 x(index)^3 ];
    A(i,:) = temp;
    i = i+1;
  endfor
  
  % print the matrix A
  A
  
  % Now we can find the values of the parameters a0, a1 & a2
  result = (transpose(A)*A) \ (transpose(A)*b)
  a0 = result(1,1)
  a1 = result(2,1)
  a2 = result(3,1)
  a3 = result(4,1)
  
  % Calculate the residuals of each data point to find the RMSE
  residuals = zeros(m, 1);
  j = 1;
  for index = 1:size(x, 1)
    residuals(j, 1) = b(index) - (a0 + a1*x(index) + a2*x(index)^2 + a3*x(index)^3);
    j = j+1;
  endfor
  
  residuals
  residuals = sum(transpose(residuals).^2)
  RMSE = sqrt(residuals / m)

endfunction
