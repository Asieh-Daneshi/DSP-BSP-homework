function [ap, b0, e, g] = LevinsonDurbin(r)
%#######################################################################
    %ej=P
    %aj=a
    %lambdaj=gamma
    %gammaj=delta
%#######################################################################
    ap = 0;
    g = [];
    aj(1) = 1;
    ej = r(1);   
    e = [ej];
    p=59;
    for j=1:p,
        aj1 = zeros(j+1, 1);
        aj1(1) = 1;
        gammaj = r(j+1);

        for i=2:j,
            gammaj = gammaj + aj(i)*r(j-i+2);           
        end
        lambdaj1 = -gammaj/ej;
        g = [g ; lambdaj1];

        for i=2:j,
            aj1(i) = aj(i)+lambdaj1*(aj(j-i+2)');
        end
        aj1(j+1) = lambdaj1;
        ej1 = ej*(1-abs(lambdaj1)^2);
        e = [e ; ej1];
        aj = aj1;
        ap = aj1;
        ej = ej1;
    end
%#######################################################################    
    b0 = sqrt(ej1);
    figure()
    freqz(1,aj)
    title('Levinson Durbin'); 
% %#######################################################################
% s=0;
% f=0:0.001:1;
% for k=1:p
%     s=s-aj(k)*exp(-2*sqrt(-1)*pi*f*k);
% end
% s=s+1;
% s=abs(s);
% s=s.^2;
% Paf=1./s; 
% Paf=10*log10(Paf); 
% figure;plot(4*f,Paf); 
% title('Levinson-Durbin');  
% xlabel('Normalized Frequency  (\times\pi rad/sample)');  
% ylabel('Magnitude (dB)'); 
% xlim([0,2])