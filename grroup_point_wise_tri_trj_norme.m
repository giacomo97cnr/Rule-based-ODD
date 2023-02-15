

%load data
close all
clear all
clc
data1=readtable("DNS_groupwise_MIX__p2p_ssh_FINESTRA_10000.xlsx");
%data1=readtable("EASA_groupwise_MIX__tr1_opa_FINESTRA_10000.xlsx");
%data1=readtable("Platooning_groupwise_MIX_FINESTRA_10000.xlsx");

data1=data1{:,2:end};
data1=array2table(data1);

data=readtable("DNS_p2p_falsi.xlsx");
%data=readtable("1_training_falsi.xlsx");
%data=readtable("platoning_LOW_falsi.xlsx");

data=data{:,2:end};
%M=mean(data,2);   ATTENZIONE CHE SE FACCIO UN ISTROGRAMMA COME MEDIA DI
%QUELLI CHE HO STO IN REALTA' CREANDO UN ISTOGRAMMA NUOVO NON PRESENTE NEL
%TRAINING E QUESTO PUò CAUSARE DEI PROBLEMI 
%data=M;
data=array2table(data);



          
           


ix=[1:50];
iy=[1:50];

%{
contatore=0;
for i=1:length(ix)
    hitx=data{:,ix(i)};
    if i<50
        for j=i+1:1:50
        contatore=contatore+1;
         hity=data{:,iy(j)};
         mi34(contatore)=mutual_info(hitx,hity,size(data,1));
        end
    end
    if i==50
        break
    end
end


minimo=min(mi34)
massimo=max(mi34)
%}


somma1=0;
c=0;
for k=1:100:1000
    c=c+1;
    for i=1:length(ix)
           
            hitx=data{:,ix(i)};
            hity=data1{:,k};
            vettore=hitx-hity;
           
            norma(i,c)=norm(vettore,1);
           
            
                
            
    end
    media(c)=mean(norma(:,c));
    

end

norma=reshape(norma,1,[]);
