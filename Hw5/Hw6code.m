N=1000000;
f=@(x) 1./sqrt(2*pi).*exp(-(x.^2)./2).*(exp(-((x-3).^2)./2)+exp(-((x-6)./2).^2));
quad0=integral(f,);
X=unifrnd(0,1,1,N);
fg=f(X);
quad1=mean(fg);
v1=sqrt(var(fg));
U=unifrnd(0,1,1,N);
X=sqrt(-2.*log(sqrt(2*pi).*U));
fg=(exp(-((X-3).^2)./2)+exp(-((X-6)./2).^2));
quad2=mean(fg);
v2=sqrt(var(fg));
X=unifrnd(-8,-1,1,N);
fg=f(X);
quad2=mean(fg);
v2=sqrt(var(fg));

