N=1000000;
f=@(x) 1./sqrt(2*pi).*exp(-(x.^2)./2).*(exp(-((x-3).^2)./2)+exp(-((x-6).^2)./2));
q=@(x) (exp(-((x-3).^2)./2)+exp(-((x-6)./2).^2));
quad0=integral(f,-inf,inf);
n1=normrnd(0,1,1,N);
y=unifrnd(0,2,1,N);
result=0;
for i=1:N
    if y(1,i)<q(n1(1,i))
        result=result+1;
    end
end
quad1=result*1.0/(N*1.0)*2;
U=normrnd(0,1,1,N);
X=7.*U-8;
fg=((exp(-((X-3).^2)./2)+exp(-((X-6).^2)./2)));
quad2=mean(fg);
v2=sqrt(var(fg));
