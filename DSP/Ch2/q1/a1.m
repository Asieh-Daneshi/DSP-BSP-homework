function [y]=a1(m)
m=0;
x4=0;
while (m <= 10)
x1=impseq(2*m,0,25);
x2=impseq(2*m+1,0,25);
x3=(m+1)*(x1-x2);
x4=x4+x3;
m=m+1;
end
y=x4;
n=[0:25];
stem(n,y)
title('problem 1-a')

