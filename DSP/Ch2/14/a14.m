function[y,H]=a14(h,x)
x=[1,2,3,4];
h=[3,2,1];
n=size(x);
m=size(h);
a=1;
while(a<=n)
    [h1,m1]=sigshift(h,m,a);
    b=1;
    while(b<=n)
    z(b,m1(a))=h1(a);
    b=b+1;
    end
    a=a+1;
end
f=z';
y=f*x';


