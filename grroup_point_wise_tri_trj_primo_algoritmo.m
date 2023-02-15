


close all
clear all
clc
%%
%{
load data
chose 
data1=readtable("DNS_groupwise_MIX__p2p_ssh_FINESTRA_10000.xlsx");
or  
data1=readtable("DNS_groupwise_MIX__p2p_ssh_FINESTRA_5000.xlsx");
%}

data1=readtable("DNS_groupwise_MIX__p2p_ssh_FINESTRA_10000.xlsx");
%data1=readtable("EASA_groupwise_MIX__tr1_opb_FINESTRA_10000.xlsx");
%data1=readtable("Platooning_groupwise_MIX_FINESTRA_10000.xlsx");

data1=data1{:,2:end};
data1=array2table(data1);

data=readtable("DNS_p2p_falsi.xlsx");
%data=readtable("1_training_falsi.xlsx");
%data=readtable("platoning_LOW_falsi.xlsx");

data=data{:,2:end};
data=array2table(data);



          
           


ix=[1:50];
iy=[1:50];




somma1=0;
c=0;
for k=1:100:1000
    c=c+1;
    for i=1:length(ix)
           
            hitx=data{:,ix(i)};
            hity=data1{:,k};
            
            mi(i)=mutual_info(hitx,hity,size(data,1));
            MImatrix(i,c)=mi(i);
           
            
                
            
    end
    media(c)=mean(MImatrix(:,c)); %this represents the y-axis in the plot of the groupwise 
    

end


