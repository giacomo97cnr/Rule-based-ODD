
%load data
close all
clear all
clc

%%
%{ 
construct the baseline
Load data: 
%}



data=readtable("DNS_p2p_falsi.xlsx");
data=data{:,2:end};


data1=readtable("DNS_p2p_falsi.xlsx");
data1=data1{:,2:end};


M_rand=min(min(data(:)),min(data1(:)));
Max_rand=max(min(data(:)),min(data1(:)));


if M_rand~=0
   M_rand=M_rand/1000000;
else
   M_rand=Max_rand/1000000;

end

size_1=[size(data,1),size(data,2)];
r1 = unifrnd( M_rand, 2*M_rand,size_1);
data=data+r1;

size_2=[size(data1,1),size(data1,2)];
r2 = unifrnd( M_rand, 2*M_rand,size_2);
data1=data1+r2;






data=array2table(data);
data1=array2table(data1);



c=1;
n=40;    %tr_{k+1}
m=50;     %tr_{N_{t_r}}}
for j=n:1:m






    
    if j==n
       ix34=[j+1:m];
    end
    
    if j>n && j<m
       ix34=[n:j-1 j+1:m];
    end
    
    if j==m
       ix34=[n:m-1];
    end






for i=1:1:size(data,1)
    
mu_op(i)=mean(data{i,ix34}); 
mu_tr(i)=mean(data1{i,1:39});   %tr_1,....,tr_{k}
st_dev_op(i)=std(data{i,ix34});
st_dev_tr(i)=std(data1{i,1:39});
end




for i=1:length(ix34)
        hitx=data{:,ix34(i)};
        [a(i),b(i)]=entropia_finale(hitx,mu_tr,st_dev_tr,mu_op,st_dev_op);
end



H_op=mean(a);
H_cond=mean(b);

if H_cond==0
    RBI(c)=0;
else
RBI(c)=H_op/H_cond;
end
c=c+1;
end
minimo=min(RBI)
masimo=max(RBI)
