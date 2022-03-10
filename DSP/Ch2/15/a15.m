function[y]=a15()
a=1;
while(a<=100)
    x(a)=(0.8)^(a);
    a=a+1;
end  
t=1:100;
y=conv_m(x,t,x,t);