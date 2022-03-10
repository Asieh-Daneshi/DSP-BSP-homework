function[]=Q6b()
k=-500:500;w=(pi/100)*k;
n=-15:15;
m=1;
while(m<=31)
    x(m)=0.5+0.5*cos(pi*(m-16)/100)
    m=m+1;
end
X=x*(exp(-j*pi/100)).^(n'*k);
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(w/pi,X);grid
xlabel('frequency in pi units');title('X')
subplot(2,1,2);plot(w/pi,X/31);grid
xlabel('frequency in pi units');title('X/11')