function[]=Q16bb()
w=[0:1:3]*pi/3;
b=[1,-0.9,0.81];
a=[1,1];
H=freqz(b,a,w);
magH=abs(H);
phaH=angle(H);
n=sym('n');
yss=magH(2)*sin(pi*n/3-phaH(2))+5*magH(4)*cos(pi*n-phaH(4))

