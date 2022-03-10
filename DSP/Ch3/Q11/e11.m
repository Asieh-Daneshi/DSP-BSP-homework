function[]=e11()
n=-1000:1000;
m=1;
while(m<=2001)
    h(m)=(0.5)^abs(m-1001)*cos(0.1*pi*(m-1001));
    m=m+1;
end
k=-100:100;w=(pi/100)*k;
H=h*(exp(-j*pi/100)).^(n'*k);
magH=abs(H);angH=angle(H);
subplot(2,1,1);plot(k/500,magH);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(k/500,angH);grid
xlabel('frequency in pi units');title('angle part')