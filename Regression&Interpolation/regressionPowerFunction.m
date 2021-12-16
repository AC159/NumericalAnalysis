
function retval = regressionPowerFunction (input1, input2)

  % Make a linear regression to fit a power model of the form y = a0*x^a1
  
  % the function will become: ln(y) = ln(a0)+a1*ln(x)

  table = xlsread('C:\Users\Anastassy Cap\Downloads\OrderOfConvergence.xlsx');

  % Extract the h and absolute error columns
  h = log(table(:,1));
  absoluteError = log(table(:,2)); % the error is a function of h
  
  numOfDataPoints = size(h,1);
  
  % Find coefficient a0 and a1:
  a1 = (numOfDataPoints*sum(h.*absoluteError) - sum(h)*sum(absoluteError)) / (numOfDataPoints*sum(h.^2)-sum(h)^2)
  a0 = (1/numOfDataPoints)*sum(absoluteError)-a1*(1/numOfDataPoints)*sum(h)

endfunction

%{

  USAGE: 

  1) pkg load io (to be able to read the excel file)

%}
