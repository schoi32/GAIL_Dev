% Xin Tong, xtong5@hawk.iit.edu
%
% Microsoft Windows 7, Matlab R2012a (7.14.0.739)

n = 50;                                  
e = ones(n,1);
A = spdiags([2*e  9*e  1e6*e],-1:1,n,n);  
b = sum(A,2);             rtol = 1e-10;
maxit = 50;
x = minresqlp(A,b,rtol,maxit); 

% Enter minresqlp.  Min-length solution of symmetric (A-sI)x = b or min ||(A-sI)x - b||
% n      =     50   ||b||    = 7.000e+06   shift    = 0.000e+00   rtol     = 1.000e-10
% maxit  =     50   maxxnorm = 1.000e+07   Acondlim = 1.000e+15   TranCond = 1.000e+07
% precon =      0
% 
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
% P      0   7.00e+06   6.93e+12   1.00e+00   1.00e+00   0.00e+00   1.00e+00   0.00e+00
%        1   1.00e+06   1.00e+12   7.18e-02   9.90e-01   9.90e+05   1.00e+00   7.00e+00
%        2   1.00e+06   1.00e+12   7.11e-02   5.72e-01   1.01e+06   1.02e+00   7.00e+00
%        3   8.20e+05   1.06e+12   4.24e-02   5.08e-01   1.75e+06   1.77e+00   7.05e+00
%        4   8.20e+05   1.06e+12   3.30e-02   3.86e-01   2.53e+06   2.56e+00   7.05e+00
%        5   7.54e+05   1.13e+12   2.47e-02   3.39e-01   3.33e+06   3.37e+00   7.07e+00
%        6   7.54e+05   1.13e+12   1.96e-02   2.71e-01   4.44e+06   4.49e+00   7.07e+00
%        7   7.18e+05   1.21e+12   1.55e-02   2.52e-01   5.54e+06   5.60e+00   7.09e+00
%        8   7.18e+05   1.21e+12   1.32e-02   2.14e-01   6.69e+06   6.76e+00   7.09e+00
%        9   6.94e+05   1.28e+12   1.10e-02   2.04e-01   7.87e+06   7.95e+00   7.09e+00
%       10   6.94e+05   1.28e+12   9.75e-03   1.80e-01   9.04e+06   9.13e+00   7.09e+00
%       11   6.76e+05   1.35e+12   8.48e-03   1.74e-01   1.02e+07   1.04e+01   7.10e+00
%       12   6.76e+05   1.35e+12   7.66e-03   1.57e-01   1.14e+07   1.16e+01   7.10e+00
%       13   6.63e+05   1.41e+12   6.83e-03   1.53e-01   1.27e+07   1.28e+01   7.11e+00
%       14   6.63e+05   1.41e+12   6.28e-03   1.40e-01   1.39e+07   1.40e+01   7.11e+00
%       15   6.52e+05   1.46e+12   5.69e-03   1.37e-01   1.51e+07   1.53e+01   7.11e+00
%       16   6.52e+05   1.46e+12   5.29e-03   1.28e-01   1.63e+07   1.65e+01   7.11e+00
%       17   6.43e+05   1.52e+12   4.87e-03   1.25e-01   1.76e+07   1.78e+01   7.11e+00
%       18   6.43e+05   1.52e+12   4.57e-03   1.18e-01   1.88e+07   1.90e+01   7.11e+00
%       19   6.35e+05   1.57e+12   4.24e-03   1.16e-01   2.01e+07   2.03e+01   7.12e+00
%       20   6.35e+05   1.57e+12   4.01e-03   1.09e-01   2.13e+07   2.15e+01   7.12e+00
% 
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
%       21   6.28e+05   1.61e+12   3.75e-03   1.08e-01   2.25e+07   2.28e+01   7.12e+00
%       22   6.28e+05   1.61e+12   3.56e-03   1.03e-01   2.38e+07   2.40e+01   7.12e+00
%       23   6.22e+05   1.66e+12   3.36e-03   1.01e-01   2.50e+07   2.53e+01   7.12e+00
%       24   6.22e+05   1.66e+12   3.20e-03   9.67e-02   2.63e+07   2.66e+01   7.12e+00
%       25   6.17e+05   1.70e+12   3.04e-03   9.58e-02   2.75e+07   2.78e+01   7.12e+00
%       26   6.17e+05   1.70e+12   2.91e-03   9.17e-02   2.88e+07   2.91e+01   7.12e+00
%       27   6.12e+05   1.74e+12   2.77e-03   9.09e-02   3.01e+07   3.04e+01   7.12e+00
%       28   6.12e+05   1.74e+12   2.66e-03   8.74e-02   3.13e+07   3.16e+01   7.12e+00
%       29   6.08e+05   1.78e+12   2.54e-03   8.66e-02   3.26e+07   3.29e+01   7.13e+00
%       30   6.08e+05   1.78e+12   2.45e-03   8.35e-02   3.38e+07   3.42e+01   7.13e+00
%       31   6.04e+05   1.82e+12   2.35e-03   8.29e-02   3.51e+07   3.55e+01   7.13e+00
%       32   6.04e+05   1.82e+12   2.27e-03   8.01e-02   3.64e+07   3.67e+01   7.13e+00
%       33   6.00e+05   1.86e+12   2.18e-03   7.95e-02   3.76e+07   3.80e+01   7.13e+00
%       34   6.00e+05   1.86e+12   2.11e-03   7.70e-02   3.89e+07   3.93e+01   7.13e+00
%       35   5.97e+05   1.89e+12   2.03e-03   7.65e-02   4.02e+07   4.06e+01   7.13e+00
%       36   5.97e+05   1.89e+12   1.97e-03   7.42e-02   4.14e+07   4.19e+01   7.13e+00
%       37   5.94e+05   1.93e+12   1.91e-03   7.38e-02   4.27e+07   4.32e+01   7.13e+00
%       38   5.94e+05   1.93e+12   1.85e-03   7.17e-02   4.40e+07   4.44e+01   7.13e+00
%       39   5.91e+05   1.96e+12   1.79e-03   7.13e-02   4.53e+07   4.57e+01   7.13e+00
%       40   5.91e+05   1.96e+12   1.74e-03   6.94e-02   4.65e+07   4.70e+01   7.13e+00
% 
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
%       41   5.88e+05   1.99e+12   1.69e-03   6.91e-02   4.78e+07   4.83e+01   7.13e+00
%       42   5.88e+05   1.99e+12   1.65e-03   6.73e-02   4.91e+07   4.96e+01   7.13e+00
%       43   5.86e+05   2.03e+12   1.60e-03   6.70e-02   5.04e+07   5.09e+01   7.14e+00
%       44   5.86e+05   2.03e+12   1.56e-03   6.54e-02   5.16e+07   5.22e+01   7.14e+00
%       45   5.83e+05   2.06e+12   1.52e-03   6.51e-02   5.29e+07   5.35e+01   7.14e+00
%       46   5.83e+05   2.06e+12   1.48e-03   6.36e-02   5.42e+07   5.47e+01   7.14e+00
%       47   5.81e+05   2.09e+12   1.44e-03   6.33e-02   5.55e+07   5.60e+01   7.14e+00
%       48   5.81e+05   2.09e+12   1.41e-03   6.19e-02   5.67e+07   5.73e+01   7.14e+00
%       49   5.79e+05   2.12e+12   1.37e-03   6.16e-02   5.80e+07   5.86e+01   7.14e+00
%       50   2.12e+06   2.12e+12D  4.73e-03   1.69e-02D  5.93e+07   5.99e+01   7.43e+00
% 
% 
% Exit minresqlp.   flag  =      8   The iteration limit was reached                        
% Exit minresqlp.   iter  =     50   (MINRES      0, MINRES-QLP     50)
% Exit minresqlp.   rnorm =  2.1167e+06     rnorm  direct =  2.1167e+06
% Exit minresqlp.                           Arnorm direct =  2.1167e+12
% Exit minresqlp.   xnorm =  7.4309e+00     xnorm  direct =  7.4309e+00
% Exit minresqlp.   Anorm =  5.9303e+07     Acond         =  5.9917e+01

% Suggestion for improvement: Make the ruesult as simple as possible to
% understand so that the new users know how to use it. For example, I don
% not know what is Compatible if I just  read the help part. (Maybe it is because that I don't familiar with the Algrithm)