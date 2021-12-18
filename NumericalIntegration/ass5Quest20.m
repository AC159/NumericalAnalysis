
function retval = ass5Quest20 (FUNC, a, b)
  
  %{
    FUNC is a function handle to the function to integrate
    a & b delimit the integration interval
  %}
  
  error = [0];
  h = [];
  I = [];
  interval = b-a;
  m = 1;
  
  for i = 1:20
    I = [ I; CompositeSimpsonRule(FUNC, m, a, b) ];
    h = [h; interval/(2*m)];
    m = m*2;
  endfor
  
  % calculate the Richardson error
  for i = 1:size(h,1)
    if i > 1
      richardsonError = abs((I(i,1) - I(i-1,1))/(2^4-1));
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
      f = @(x) x^x;
      
    2) Call this function
       ass5Quest20 (f, 0, 1);
   
  %}
