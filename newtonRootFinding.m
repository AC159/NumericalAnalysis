
function retval = newtonRootFinding ()


  % Error tolerance
  error_TOL = 10^-5;
  
  % x_0 is the initial root guess
  x_0 = 1.5;
  error = 1;
  x_i_results = [ x_0 ];
  
  count = 0;
  while (error > error_TOL)
    
    if (count >= 50)
      printf("THE FUNCTION DOES NOT CONVERGE after 50 iterations \n");
      x_i_results
      break;
    endif
    
    func = x_0*cos(x_0) - 2*x_0^2 + 3*x_0 - 1;
    func_derivative = cos(x_0) - sin(x_0)*x_0 - 4*x_0 + 3;
    
    % Calculate the next value of x_i
    x_i = x_0 - func / func_derivative;
    error = abs(x_i - x_0);
    x_0 = x_i;
    x_i_results = horzcat(x_i_results, [x_i]);
    count++;
  
  endwhile

  printf("Root: ");
  x_i
  printf("Error Tolerance: ");
  error_TOL
  printf("Error: ");
  error
  printf("Iterations: ");
  count

endfunction
