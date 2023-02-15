
close all
clear all
clc
%%
%{ 
load data.
In order to investigate FNR choose
data1=readtable("DNS_p2p_falsi.xlsx");
and
data=readtable("DNS_ssh_falsi.xlsx");
%}

data1=readtable("DNS_p2p_falsi.xlsx");
data=readtable("DNS_ssh_falsi.xlsx");
data=data{:,2:end};
data=array2table(data);
data1=data1{:,2:end};
data1=array2table(data1);



c=1;
%number that represents that you investigating how many FALSE NEGATIVE 
% there are in 50 ssh histrograms from m+51
%to m+100
m=350;
for j=51+m:1:100+m

for i=1:1:size(data,1)
mu_op(i)=mean(data{i,51+m:100+m~=j});
mu_tr(i)=mean(data1{i,1:50});
st_dev_op(i)=std(data{i,51+m:100+m~=j});
st_dev_tr(i)=std(data1{i,1:50});
end



%entropy of operational 

if j==51+m
   ix34=[52+m:100+m];
end

if j>51+m && j<100+m
   ix34=[j-1:j-1 j+1:100+m];
end

if j==100+m
   ix34=[51+m:99+m];
end


for i=1:length(ix34)
        hitx=data{:,ix34(i)};
        mi34(i)=entropy_op(hitx,mu_op,st_dev_op);
end








% conditional  entropy
ix=ix34;
for i=1:length(ix)
    hitx=data{:,ix(i)};
    mi(i)=conditioned_entropy(hitx,mu_tr,st_dev_tr,st_dev_op);
    MImatrix(i)=mi(i);
end




b=MImatrix./mi34;
mediainfo(c)=mean(b);
c=c+1;

end

min(mediainfo);
max(mediainfo);


%{
contatore represents number of FALSE NEGATIVE 
0.998 and 2 represents the baseline range 2 is choosen insted of 
1 because the maximum of the baseline could be 
major than one and so to avoid any issue we set it as 2
%}
contatore=0;
for i=1:1:length(mediainfo)
    if (0.9984<=mediainfo(i))&&(mediainfo(i)<=2)
        contatore=contatore+1;
    end
end