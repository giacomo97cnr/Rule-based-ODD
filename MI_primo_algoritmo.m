
close all
clear all
clc
%%
%{
Load data: 
1)if you want to investigate FPR consider:
data=readtable("DNS_p2p_falsi.xlsx");
and
data1=readtable("DNS_p2p_falsi.xlsx");

2)if you want to investigate FNR consider:
data=readtable("DNS_p2p_falsi.xlsx");
and
data1=readtable("DNS_ssh_falsi.xlsx");
%}

data=readtable("DNS_p2p_falsi.xlsx");
data=data{:,2:end}; 
data=array2table(data);
data1=readtable("DNS_p2p_falsi.xlsx"); 
data1=data1{:,2:end};
data1=array2table(data1);



%% 
%{
in this section we compute the baseline using 50 training histograms
and we obtain minimum (minimo=min(mi34)) and maximum (massimo=max(mi34))
%}

ix34=[1:50];
iy34=[1:50];

for i=1:length(ix34)
    hitx=data{:,ix34(i)};
    for j=i:1:length(ix34)
        
         hity=data{:,iy34(j)};
         mi34(i,j)=mutual_info(hitx,hity,size(data,1));
     end
end
  

minimo=min(mi34(:));
massimo=max(mi34(:));





%{
ix34=[1:50];
iy34=[1:50];
contatore=0;
for i=1:length(ix34)
    hitx=data{:,ix34(i)};
    if i<50
        for j=i+1:1:50
        contatore=contatore+1;
         hity=data{:,iy34(j)};
         mi34(i,j)=mutual_info(hitx,hity,size(data,1));
        end
    end
    if i==50
        break
    end
end


minimo=min(mi34(:));
massimo=max(mi34(:));
%}





%%
%{
we compute the FPR and FNR and we also obtain minimum
(minimo_op=min(MImatrix(:))) and maximum (massimo_op=max(MImatrix(:)))
operational range. 
check somma_2 with number of splits of operational both for fpr and fnr 
%}


ix=ix34;
somma1=0;
somma2=0;
for k=1:50
    for i=1:length(ix)
           
            hitx=data{:,ix(i)};
            hity=data1{:,k+50};
            
            mi(i)=mutual_info(hitx,hity,size(data,1));
            if  mi(i)<minimo ||   mi(i)>massimo
                somma1=somma1+1;
          
            end
            
            MImatrix(i,k)=mi(i);
           
            
                
            
    end
    if somma1> fix (size(data,2)/2)  
        somma2=somma2+1;
    end
    
end



minimo_op=min(MImatrix(:));
massimo_op=max(MImatrix(:));




