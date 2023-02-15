function H=conditioned_entropy(x,mu_tr,st_dev_tr,st_dev_op)
    
  


    % marginal probabilities
 
    
   
    Px=zeros(length(x),1);
    Hx=zeros(length(x),1);

    for i=1:1:length(x)
        
        a=normcdf([x(i)-st_dev_op(i) x(i)+st_dev_op(i)],mu_tr(i),st_dev_tr(i));
        
        Px(i)=a(2)-a(1);

        if Px(i)==0
           Hx(i)=0;
        else
           Hx(i)=Hx(i)-(Px(i)*log2(Px(i)));
        end

   
    end
    
    H=sum(Hx);
    
end
