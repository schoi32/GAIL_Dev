%This function describes the Experiment 1
% 
%  Generates Table 3.1 in the thesis with abstol=10^(-8), TolX=0, 
%  and nrep=10000 nmax=10^7
%
%  Xin Tong. A Guaranteed, Adaptive, Automatic Algorithm for Univariate
%  Function Minimization. MS thesis, Illinois Institute of Technology,
%  2014.

function [tauvec,prob]=UniFunMin_test_ErrTolerance(nrep,abstol,nmax)
tstart = tic;

%% Program parameters
in_param.abstol = abstol; %error tolerance
in_param.TolX = 0;
in_param.nmax = nmax; %cost budget

%% Simulation parameters
n = nrep;
if (n >= 100)
    warning('off','MATLAB:funmin01_g:exceedbudget');
    warning('off','MATLAB:funmin01_g:peaky');
end;
a = 10.^(-4+3*rand(n,1));
z = 2.*a+(1-4*a).*rand(n,1);
tauvec = [11 101 1001]; %cone condition tau
ntau = length(tauvec);
ratio = 1./a;
exactmin = -1;

%% Simulation
ntrapmat = zeros(nrep,ntau);
trueerrormat = ntrapmat;
newtaumat = ntrapmat;
tauchangemat = ntrapmat;
exceedmat = ntrapmat;

for i=1:ntau;
    for j=1:nrep;
        f = @(x) 0.5/a(j)^2*(-4*a(j)^2-(x-z(j)).^2-(x-z(j)-a(j)).*...
            abs(x-z(j)-a(j))+(x-z(j)+a(j)).*abs(x-z(j)+a(j))).*...
            (x>=z(j)-2*a(j)).*(x<=z(j)+2*a(j)); %test function
        in_param.ninit = (tauvec(i)+1)/2+1;
        [fmin,out_param] = funmin01_g(f,in_param);
        ntrapmat(j,i) = out_param.npoints;
        newtaumat(j,i) = out_param.tau;
        estmin = fmin;
        trueerrormat(j,i) = abs(estmin-exactmin);
        tauchangemat(j,i) = out_param.tauchange;
        exceedmat(j,i) = out_param.exceedbudget;
    end
end

prob.probinit = mean(repmat(ratio,1,ntau)<=repmat(tauvec,nrep,1),1); 
prob.probfinl = mean(repmat(ratio,1,ntau)<=newtaumat,1); 
prob.succnowarn=mean((trueerrormat<=in_param.abstol)&(~exceedmat),1); 
prob.succwarn=mean((trueerrormat<=in_param.abstol)&(exceedmat),1);    
prob.failnowarn=mean((trueerrormat>in_param.abstol)&(~exceedmat),1);  
prob.failwarn=mean((trueerrormat>in_param.abstol)&(exceedmat),1);  

%% Output the table
% To just re-display the output, load the .mat file and run this section
% only
display(' ')
display('        Probability    Success   Success   Failure  Failure')
display(' tau      In Cone    No Warning  Warning No Warning Warning')
for i=1:ntau
    display(sprintf(['%5.0f %5.2f%%->%5.2f%% %7.2f%%' ...
        '%10.2f%% %7.2f%% %7.2f%% '],...
        [tauvec(i) 100*[prob.probinit(i) prob.probfinl(i) ...
        prob.succnowarn(i) prob.succwarn(i) prob.failnowarn(i)... 
        prob.failwarn(i)]])) 
end

%% Save output
gail.save_mat('UniFunMinOutput', 'ErrToleranceTest',tauvec,prob,ntau);

toc(tstart)

warning('on','MATLAB:funmin01_g:exceedbudget');
warning('on','MATLAB:funmin01_g:peaky');

%% The following output was obtained on 2014-May
%        Probability    Success   Success   Failure  Failure
%  tau      In Cone    No Warning  Warning No Warning Warning
%    11  1.28%->21.22%   21.22%      0.00%   78.78%    0.00% 
%   101 34.02%->53.20%   53.18%      0.02%   46.79%    0.01% 
%  1001 67.04%->85.79%   81.20%      2.59%   14.19%    2.02% 
% Elapsed time is 4383.064010 seconds.
