
function output = ass5Quest19 (FUNC, a, b)
  
  %{
    FUNC is a function handle to the function to integrate
    a & b delimit the integration interval
  %}
  
  m = 1;
  error = [0];
  h = [];
  I = [];
  interval = b-a;
  for i = 1:20
    I = [I; CompositeTrapezoidRule(FUNC, m, a, b)];
    h = [h; interval/m ];
    m = m*2;
  endfor

  % calculate the Richardson error
  for i = 1:size(h,1)
    if i > 1
      richardsonError = abs((I(i,1) - I(i-1,1))/(2^2-1));
      error = [ error; richardsonError ];
    endif
  endfor

  h
  error
  loglog(h, error, 'bo-')

endfunction

  %{
  
    USAGE:
    
    1) Define function handle for the function to integrate
      f = @(x) cos(e^x);
      
    2) Call this function
       ass5Quest19 (f, 0, pi);
   
  %}

