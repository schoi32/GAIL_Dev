function cf_chebfun(f, a, b, abstol)
% Examples:
% f1 = @(x) x.^4 .* sin(1./((x==0)+x)); a = -1; b = 1; abstol = 1e-6; cf_chebfun(f1, a, b, abstol)
%
% f2 = @(x) f1(x) + 10.*x.^2; abstol = 1e-6;   cf_chebfun(f2, a, b, abstol) 
%
% delta = 0.2; B = 1./(2*delta.^2); c = -0.2;
% f3 = @(x) B*(4*delta.^2 + (x-c).^2 + (x-c-delta).*abs(x-c-delta) ...
%    - (x-c+delta).*abs(x-c+delta)).*(abs(x-c) <= 2*delta); a = - 1; b = 1; abstol = 1e-14;  
% cf_chebfun(f3, a, b, abstol)
%
% f4 = @(x)sin(10*pi*x.^4)-x, a = 1; b = 2; abstol = 1e-14; cf_chebfun(f4, a, b, abstol)
%
% f5 = @(x) sign(x);  a = -1; b = 1; cf_chebfun(f5, a, b, abstol)
%  

gail.InitializeDisplay
%set(0,'defaultaxesfontsize',24,'defaulttextfontsize',24) %make font larger
% format compact
format long

% MATLABBlue = [0, 0.447, 0.741];
% MATLABOrange = [0.85,  0.325, 0.098];
% MATLABPurple = [0.494,  0.184, 0.556];
% MATLABGreen = [0.466,  0.674, 0.188];
% MATLABDkOrange = [0.85,  0.325, 0.098]*0.6;
% MATLABLtOrange = 0.5*[0.85,  0.325, 0.098] + 0.5*[1 1 1];


%% funappx_g
tic, [fappx, fout] = funappx_g(f,a,b,abstol,'nmax',10^8), toc
% gail.funappx_g_check(fappx,fout)

%% chebfun
tic, c = chebfun(f,[a,b],'chebfuneps', abstol,'splitting','on'), toc

x=a:0.00001:b;
figure(1)
subplot(2,3,1), plot(x,f(x)); 
%title(fstr); axis tight
subplot(2,3,2), plot(x,fappx(x)); title(['funappx\_g approx.']); axis tight
subplot(2,3,3), plot(x,c(x)); title(['Chebfun approx.']); axis tight

err = abs( fappx(x) - f(x));
subplot(2,3,5), semilogy( x, err, 'k' );  title('funappx\_g errors'); axis tight; hold on
[~,ind] = find(err > abstol*10);
semilogy( x(ind), err(ind), '.' );   hold off;
figure(2);
semilogy( x, err, '-', x(ind), err(ind), '.');  
% semilogy( x, err, '-', 'color', MATLABBlue); hold on
% semilogy( x(ind), err(ind), '.' , 'color', MATLABOrange);  
small = max(-20,log10(0.1*min(err)));
large = log10(10*max(err));
axis([a b 10^small 10^large])
xlabel('\(x\)')
ylabel('{\tt funappx\_g} error')
gail.save_eps('TraubPaperOutput', 'funappx_g_errors');
   
chebfuntol=1e-14;
err = abs(c(x) - f(x));
figure(1); subplot(2,3,6), semilogy( x, err, 'k' );   title ('Chebfun errors'); axis tight; hold on;
[~,ind] = find(err > chebfuntol*10);
semilogy( x(ind), err(ind), 'r.' );   hold off;
figure(3);
semilogy( x, err, '-', x(ind), err(ind), '.'); 
% semilogy( x, err, '-', 'color', MATLABBlue); 
% %axis tight;  
% hold on;
% semilogy( x(ind), err(ind), '.', 'color', MATLABOrange ); 
small = max(-20,log10(0.1*min(err)));
large = log10(10*max(err));
axis([a b 10^small 10^large])
xlabel('\(x\)')
ylabel('Chebfun error')
set(gca,'ytick',10.^(5*ceil(small/5):5:5*floor(large/5)))
gail.save_eps('TraubPaperOutput', 'chebfun_errors');


