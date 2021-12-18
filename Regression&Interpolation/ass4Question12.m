
function retval = ass4Question12 (input1, input2)

  % model function: T = a0 + a1sin(2*pi*t) + a2cos(2*pi*t)
  
  table = xlsread('/home/anastassy/Downloads/GlobalTemperatures.xlsx');
  
  % Extract the b and x vectors from the matrix
  b = table(:, 2);
  x = table(:, 3);
  
  % Get size of the matrix
  [m,n] = size(table);
  
  % Create a new Mx4 matrix that we will fill, 4 because we have 4 parameters a0, a1, a2, a3
  A = [ x.^0 x x.^2 x.^3 ]
  
  % Now we can find the values of the parameters a0, a1 & a2
  result = (transpose(A)*A) \ (transpose(A)*b);
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
  residuals = sum(transpose(residuals).^2);
  RMSE = sqrt(residuals / m)

endfunction
