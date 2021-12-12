
function sum = GaussQuadrature (FUNCT, m, a, b)

  %{
    
    FUNCT is a function handle
    m is the number of interpolating points for the Gauss Quadrature (possible values: 2, 3, 4, 5)
    a is the start of the interval 
    b is the end of the interval
    
  %}
  
  if a != -1 || b != 1
    % Since the intervals are not as defined by the gauss quadrature, 
    % we must define another function handle to perform substitution:
    fHandle = @(t) ((b-a)*t + b + a)/2;
  endif
  
  % Define Gauss Quadrature interpolating points and coefficients
  gaussMatrix = [];
  if m == 2
    gaussMatrix = [ 1.0000000000000000 -0.5773502691896257; 
                    1.0000000000000000 0.5773502691896257;
                  ];
  elseif m == 3
      gaussMatrix = [ 0.5555555555555556 -0.7745966692414834;
                      0.8888888888888888 0.0000000000000000;
                      0.5555555555555556 0.7745966692414834;];
                    
  elseif m == 4
      gaussMatrix = [ 0.3478548451374538 -0.8611363115940526;
                      0.6521451548625461 -0.3399810435848563;
                      0.6521451548625461 0.3399810435848563;
                      0.3478548451374538 0.8611363115940526;
                    ];
                    
  else 
     gaussMatrix = [ 0.2369268850561891 -0.9061798459386640;
                     0.4786286704993665 -0.5384693101056831;
                     0.5688888888888889 0.0000000000000000;
                     0.4786286704993665 0.5384693101056831;
                     0.2369268850561891 0.9061798459386640;
                    ];                                   
  endif
  
  
  %{
  
  gaussQuadratureCoefficients2Points = [ 1.0000000000000000 1.0000000000000000; 
                                         -0.5773502691896257 0.5773502691896257;
                                        ];
  gaussQuadratureCoefficients3Points = [ 0.5555555555555556 0.8888888888888888 0.5555555555555556;
                                         -0.7745966692414834 0.0000000000000000 0.7745966692414834;
                                       ];
  gaussQuadratureCoefficients4Points = [ 0.3478548451374538 0.6521451548625461 0.6521451548625461
                                          0.3478548451374538; 
                                         -0.8611363115940526 -0.3399810435848563 0.3399810435848563
                                          0.8611363115940526;
                                       ];
  gaussQuadratureCoefficients5Points = [ 0.2369268850561891 0.4786286704993665 0.5688888888888889
                                         0.4786286704993665 0.2369268850561891;
                                         -0.9061798459386640 -0.5384693101056831 0.0000000000000000
                                          0.5384693101056831 0.9061798459386640;
                                       ];
                                       
   %}
   
  sum = 0;     
  if a != -1 || b != 1
    
    for index = 1:m
      c_i = gaussMatrix(index, 1);
      x_i = gaussMatrix(index, 2);
      n = fHandle(x_i);
      sum = sum + ((b-a)/2)*c_i*FUNCT(n);
    endfor
    
  else
    
    for index = 1:m
      c_i = gaussMatrix(index, 1);
      x_i = gaussMatrix(index, 2);
      sum = sum + ((b-a)/2)*c_i*FUNCT(x_i);
    endfor
    
  endif

endfunction


%{

  USAGE: 

  1) Make a function handle:
      f = @(x) 2000*log(140000/(140000-2100*x)) - 9.8*x;
      
  2) Call the GaussQuadrature
      GaussQuadrature(f, 3, -1, 1)

%}

