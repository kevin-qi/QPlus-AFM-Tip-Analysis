function [ outStruct ] = ampToQ(f,x_raw,y_raw)
    x = x_raw-mean(x_raw);
    y = y_raw-mean(y_raw);
    r = (x.^2+y_raw.^2);
    
    r = msbackadj(f,r,'WindowSize',50,'StepSize',100);
    outStruct = qfactor(f,r);
    
    subplot(2,2,2);
    plot(f,x,f,y_raw);
    legend('x','y');
    
    subplot(2,2,3);
    plot(f,r,f,ones(length(f))*max(r)/2);
    legend('admittance','line at half max');
    
end
    
    
    