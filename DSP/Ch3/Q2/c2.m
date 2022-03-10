function[]=c2()
n=0:6;x=[4:-1:1,2:1:4];
k=0:500;w=(pi/500)*k;
X=x*(exp(-j*pi/500)).^(n'*k);
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(k/500,magX);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(k/500,angX);grid
xlabel('frequency in pi units');title('angle part')