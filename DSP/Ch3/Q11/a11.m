function[]=e11()
n=-1000:1000;h=(0.9).^abs(n);
k=-100:100;w=(pi/100)*k;
H=h*(exp(-j*pi/100)).^(n'*k);
magH=abs(H);angH=angle(H);
subplot(2,1,1);plot(k/500,magH);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(k/500,angH);grid
xlabel('frequency in pi units');title('angle part')