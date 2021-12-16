
function matrix = RombergIntegration (FUNCT, integrationOrder, a, b)

  %{
    
    FUNCT is a function handle
    integrationOrder is the integration order for the Romberg integration (i.e. O(h^10) = 10) (must be an even integer)
    a is the start of the interval 
    b is the end of the interval
    
  %}
  
  % Create a new square matrix based on the integration order:
  matrix =  zeros(integrationOrder/2, integrationOrder/2);
  
  % Apply the trapezoid rule for each element of the first column:
  initialStepSize = b-a;
  for index = 1:integrationOrder/2
    m = (b-a)/initialStepSize;
    matrix(index, 1) = CompositeTrapezoidRule(FUNCT, m, a, b);
    initialStepSize = initialStepSize/2;
  endfor
  
  % Use Romberg's formula and apply it to other columns of the matrix to \
  % achieve higher order integration
  % Start the iteration at colum 2 since column 1 is already filled in the previous step
  for i = 2:integrationOrder/2 
    for j = 2:integrationOrder/2 % do calculations on rows
      if j >= i
        matrix(j, i) = (4^(i-1)*matrix(j,i-1) - matrix(j-1,i-1))/(4^(i-1)-1);
      endif
    endfor
  endfor


endfunction

%{

  USAGE: 

  1) Make a function handle:
      f = @(x) 2000*log(140000/(140000-2100*x)) - 9.8*x;
      
  2) Call the the composite trapezoidal rule
      RombergIntegration(f, 10, 8, 30)

%}

