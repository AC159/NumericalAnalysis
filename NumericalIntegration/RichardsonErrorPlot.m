
function retval = RichardsonErrorPlot (FUNCT, a, b, error)

  %{
  
    This function will plot a graph of the richardson error for many values of h
    using composite trapezoid rule
    
    FUNCT is a function handle
    a is the start of the interval 
    b is the end of the interval
    error is the error for which this function needs to find a proper step size h
    
  %}
  numberOfRows = 10000;
  initialStepSize = b-a;
  
  %{ Make a matrix that will hold the results of the computations
  %{ The first column contains the step sizes h, the second one contains the integral approximations
  %{ and the third one contains the estimated richardson error
  matrix = [ initialStepSize CompositeTrapezoidRule(FUNCT, 1, a, b) 1 ]; %{ fill the first row manually
  
  %{ Loop until the estimated Richardson error is less than the one specified
  stepSize = initialStepSize / 2;
  index = 2;
  while matrix(size(matrix,1), 3) > error
    row = zeros(1,3);
    row(1,1) = stepSize; %{ fill the step size
    
    %{ perform trapezoid computation for that step size
    m = (b-a)/stepSize;
    row(1,2) = CompositeTrapezoidRule(FUNCT, m, a, b);
    
    %{ Fill in the richardson error
     row(1,3) = abs((row(1,2)-matrix(index-1,2)) / ((matrix(index-1,1)/row(1,1))^2 - 1));
    
    stepSize = stepSize / 2;
    matrix = [ matrix; row; ]; %{ append the row at the end of the matrix
  end
  
  matrix
  disp("The first column contains the step sizes h, the second column contains the integral approximations and the third column contains the estimated richardson error");
  disp("Find the point at which the value of h produces errors below the threshold");
  
  %{ Plot richardson error vs step size h
  plot(matrix(:,1), matrix(:,3),'o'); 
  

endfunction

%{

  USAGE:
  
  1) declare a function handle:
    f = @(x) cos(e^x)
  
  2) Call this function for error estimation with richardson and composite simpson rule
    RichardsonErrorPlot (f, 0, pi, 10^-9)

%}

