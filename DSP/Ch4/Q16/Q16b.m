function[y]=Q16b()
b=[1,-0.9,0.81];a=[1,1];
[delta,n]=impseq(0,0,199);
h=filter(b,a,delta);
x=(sin(pi*n/3)+5*cos(pi*n)).*stepseq(0,0,199);
c=[0:199];d=[0:199];
y=sigmult(x,c,h,d);
