function [outStruct] = phaseToQ(f,x_raw,y_raw)
    
    x = x_raw-mean(x_raw);
    
    y_shift = 0;
    if mean(y_raw)>y_raw(1)
        y_shift = min(y_raw);
    else
        y_shift = max(y_raw);
    end
    
    y = y_raw-y_shift;
    
    r2 = x.^2+y.^2;
    %r2 = msbackadj(f,r2,'WindowSize',50,'StepSize',100);
    theta = atan(x./abs(y));
    %theta = medfilt1(theta,3);
    
    
    res_peak=max(r2);
    res_index=find(r2==res_peak);
    res_freq=f(res_index);
    
    a = res_index-5;
    b = res_index+5;
    
    f_snippet = f(a:b);
    theta_snippet = theta(a:b);
    
    
    
    linear_fit = polyfit(f_snippet,theta_snippet,1);
   
    slope = linear_fit(1);
    intercept = linear_fit(2);
    line = slope*f(a:b)+intercept;
    subplot(2,2,1);
    plot(f,theta,f_snippet,theta_snippet,f(a:b),line);
    legend('phase curve','segment to fit','fitted line');
    
    outStruct = struct();
    outStruct.slope = slope;
    outStruct.intercept = intercept;
    outStruct.Q = slope*res_freq/2;
    
end
    