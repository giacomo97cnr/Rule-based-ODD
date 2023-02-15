
function H=entropy_op(x,mu_op,st_dev_op)
    
  


    % marginal probabilities
 
    
   
    Px=zeros(length(x),1);
    Hx=zeros(length(x),1);
    for i=1:1:length(x)
     
        a=normcdf([x(i)-st_dev_op(i) x(i)+st_dev_op(i)],mu_op(i),st_dev_op(i));
        Px(i)=a(2)-a(1);
    
        if Px(i)==0
           Hx(i)=0;
        else
           Hx(i)=Hx(i)-(Px(i)*log2(Px(i)));
        end
    end
    
    H=sum(Hx);
    
    
end

