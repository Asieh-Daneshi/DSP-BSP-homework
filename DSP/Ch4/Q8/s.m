function[y,ny,r,nr]=s()
x=[1 1 1 1 1 1];nx=[-3:2];
h=[1 2 1];nh=[-1:1];
[y,ny,r,nr]=deconv_m(x,nx,h,nh)