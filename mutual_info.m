

%function to compute mutual information (peso=1) and weighted mutual
%information ( peso=sum(abs(x-y))/length(x);)
function MI=mutual_info(x,y,n)
    
    peso=sum(abs(x-y))/length(x);
    %peso=1;
    %joint probability
   
    pxy_obj=histogram2(x,y,'Normalization','probability');
    
    % per non plottare istogrammi
    % Obtain the handle of the figure that contains the histogram
    handleOfHistogramFigure = ancestor(pxy_obj, 'figure');
    % Make the figure window visible in case it was invisible before
    handleOfHistogramFigure.Visible  = 'off';
    
    pxy=nonzeros(pxy_obj.Values);
    %joint entropy (usando log2 l'entropia è in unità bits)
    pxy=pxy.*peso;
    Hxy=-dot(pxy,log2(pxy));
    
    % marginal probabilities
    Px_obj=histogram(x,'Normalization','probability');
    
    % per non plottare istogrammi
    % Obtain the handle of the figure that contains the histogram
    handleOfHistogramFigure = ancestor(Px_obj, 'figure');
    % Make the figure window visible in case it was invisible before
    handleOfHistogramFigure.Visible  = 'off';
    
    Px=nonzeros(Px_obj.Values);
    
    Py_obj=histogram(y,'Normalization','probability');
    
    % per non plottare istogrammi
    % Obtain the handle of the figure that contains the histogram
    handleOfHistogramFigure = ancestor(Py_obj, 'figure');
    % Make the figure window visible in case it was invisible before
    handleOfHistogramFigure.Visible  = 'off';
    
    Py=nonzeros(Py_obj.Values);

    Px=Px.*peso;
    Py=Py.*peso;

    
    
    Hx=zeros(length(Px),1);
    Hy=zeros(length(Py),1);
    Hxy=zeros(length(pxy),1);

    for i=1:1:length(Px)
    if Px(i)==0
           Hx(i)=0;
        else
           Hx(i)=Hx(i)-(Px(i)*log2(Px(i)));
    end
    end
    Hx=sum(Hx);
    for i=1:1:length(Py)
    if Py(i)==0
           Hy(i)=0;
        else
           Hy(i)=Hy(i)-(Py(i)*log2(Py(i)));
    end
    end
    Hy=sum(Hy);
    for i=1:1:length(pxy)
    if pxy(i)==0
           Hxy(i)=0;
        else
           Hxy(i)=Hxy(i)-(pxy(i)*log2(pxy(i)));
    end
    end
    Hxy=sum(Hxy);

    
    MI=Hx+Hy-Hxy;
    
end




