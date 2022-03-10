function[]=Q4d()
k=-500:500;w=(pi/100)*k;
n=-100:100;
m=1;
while(m<=201)
    x(m)=1;
    m=m+1;
end
X=x*(exp(-j*pi/100)).^(n'*k);
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(w/pi,X);grid
xlabel('frequency in pi units');title('X')
subplot(2,1,2);plot(w/pi,X/201);grid
xlabel('frequency in pi units');title('X/11')