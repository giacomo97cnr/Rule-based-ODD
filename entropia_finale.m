
function [H_op,H_cond]=entropia_finale(x,mu_tr,st_dev_tr,mu_op,st_dev_op)
    
  


    % marginal probabilities
 
    
   
    Px_op=zeros(length(x),1);
    Px_cond=zeros(length(x),1);
    Hx_op=zeros(length(x),1);
    Hx_cond=zeros(length(x),1);
     

   

    for i=1:1:length(x)
        

     
        a_op=normcdf([x(i)-st_dev_op(i) x(i)+st_dev_op(i)],mu_op(i),st_dev_op(i));
        Px_op(i)=a_op(2)-a_op(1);

        a_cond=normcdf([x(i)-st_dev_op(i) x(i)+st_dev_op(i)],mu_tr(i),st_dev_tr(i));
        Px_cond(i)=a_cond(2)-a_cond(1);
    
        if Px_op(i)==0 
           Px_op(i)=10^-20;
        end
        if Px_op(i)==1
            Px_op(i)=0.99999999999999999999;
        end

        if Px_cond(i)==0 
           Px_cond(i)=10^-20;
        end
        if Px_cond(i)==1
            Px_cond(i)=0.99999999999999999999;
        end
      
       

       
        
        if Px_op(i)~=0 && Px_op(i)~=1
            Hx_op(i)=Hx_op(i)-(Px_op(i)*log2(Px_op(i))+(1-Px_op(i))*log2(1-Px_op(i)));
        end

        if Px_cond(i)~=0 && Px_cond(i)~=1
            Hx_cond(i)=Hx_cond(i)-(Px_cond(i)*log2(Px_cond(i))+(1-Px_cond(i))*log2(1-Px_cond(i)));

        end
            
            gamma=Px_op(i)/Px_cond(i);
            Hx_cond(i)=Hx_cond(i)*gamma;
        

    end
  
    H_op=sum(Hx_op);
    H_cond=sum(Hx_cond);
    
   
end