function[y]=b15()
k=1;
while(k<=50)
    x(k)=(0.8)^k;
    k=k+1;
end
b=[1];
a=[1];
y=filter(b,a,x);