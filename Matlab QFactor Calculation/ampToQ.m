function [ outStruct ] = ampToQ(f,x_raw,y_raw)
    x = x_raw-mean(x_raw);
    
    y_shift = 0;
    if mean(y_raw)>y_raw(1)
        y_shift = min(y_raw);
    else
        y_shift = max(y_raw);
    end
    
    y = y_raw-y_shift;
    r = (x.^2+y.^2);
    %r = msbackadj(f,r,'WindowSize',50,'StepSize',100);
    outStruct = qfactor(f,r);
    
    subplot(2,2,2);
    plot(f,x,f,y);
    legend('x','y');
    
    subplot(2,2,3);
    plot(f,r,f,ones(length(f))*max(r)/2);
    
    legend('admittance','line at half max');
    
end
    
    
    