function[a,b]=Q16()
w=[0:1:500]*pi/500;
b=[1,-0.9,0.81]
a=[1,1]
H=freqz(b,a,w);
magH=abs(H);
phaH=angle(H);
subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(w/pi,phaH);grid
xlabel('frequency in pi units');title('angle part')
