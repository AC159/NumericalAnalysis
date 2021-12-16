
function output = NaiveGaussElimination (A, b)
  
  %{
  
    A is the coefficient matrix
    b is the vector for matrix A
  
  %}

  % Assuming A is a square matrix
  size = size(A, 1);
  L = eye(size); % eye function returns an identity matrix
  
  % Pivot elements are all on the diagonal
  pivot = A(1,1);
  
  for i = 1:size
    
    % Perform row-reduction
    
    for j = i+1:size
      % Calculate elimination coefficient
      coefficient = A(j,i) / pivot;
      L(j,i) = coefficient; 
      A(j,:) = A(j,:) - coefficient*A(i,:);
    endfor
    
    if i != size
      pivot = A(i+1,i+1);
    endif
  endfor
  
  printf("Upper triangle matrix after Naive Gauss Elimination: \n")
  A
  
  printf("Lower Triangle matrix with elimination coefficients: \n")
  L

endfunction
