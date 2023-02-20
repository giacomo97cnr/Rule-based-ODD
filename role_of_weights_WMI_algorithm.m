
data=readtable("importance_of_the_weigths_in the_weigthed_mutual_indormation_algorithm.xlsx");
data=data{:,:};

%for the classical mutual information choose peso=1 in mutual_info.m
%for the weigthed mutual information choose peso=sum(abs(x-y))/length(x) in mutual_info.m
%YOU WILL NOTICE the role of the weigths in the weigthed mutual information


for i=1:1:size(data,1)
    data(i,:)=data(i,:)/sum(data(i,:));
end


contatore=1;
for i=2:1:size(data,1)
    m(contatore)=(mutual_info(data(1,:),data(i,:)));
    contatore=contatore+1;
    
end
figure
scatter([1:1:length(m)],m,"filled")
