
close all
clear all
clc
%%
%{ 
load data.
In order to investigate FPR choose
data1=readtable("DNS_p2p_falsi.xlsx");
%}
data=readtable("DNS_p2p_falsi.xlsx");
data=data{:,2:end};
data=array2table(data);


c=1;
%number that represents that you investigating how many FALSE POSITIVE 
% there are in 50 p2p histrograms from m+51
%to m+100
m=400;

for j=51+m:1:100+m
    

for i=1:1:size(data,1)
mu_op(i)=mean(data{i,51+m:100+m~=j}); 
mu_tr(i)=mean(data{i,1:50});
st_dev_op(i)=std(data{i,51+m:100+m~=j});
st_dev_tr(i)=std(data{i,1:50});
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








% conditional entropy
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

min(mediainfo)
max(mediainfo)

%{
contatore represents number of FALSE POSITIVE 
0.994 epresents the minimum of the baseline range
%}

contatore=0;
for i=1:1:length(mediainfo)
    if (mediainfo(i)<0.99)
        contatore=contatore+1;
    end
end