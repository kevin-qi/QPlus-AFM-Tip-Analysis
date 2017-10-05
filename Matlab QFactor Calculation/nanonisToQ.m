function [outStruct] = nanonisToQ(file)
    df = readtable(file);
    shift = df.shift;
    center = df.center;
    amp = df.amp;
    phase = df.phase;
    f = shift+center;
    subplot(2,2,1);
    plot(f,amp);
    subplot(2,2,2);
    plot(f,phase);
    
    theta = phase.*pi()./180;
    
    res_peak=max(amp);
    res_index=find(amp==res_peak);
    res_freq=f(res_index);
    
    a = res_index-5;
    b = res_index+5;
    
    f_snippet = f(a:b);
    theta_snippet = theta(a:b);
    
    
    
    linear_fit = polyfit(f_snippet,theta_snippet,1);
   
    slope = linear_fit(1);
    intercept = linear_fit(2);
    line = slope*f(a:b)+intercept;
    subplot(2,2,3);
    plot(f,theta,f_snippet,theta_snippet,f(a:b),line);
    legend('phase curve','segment to fit','fitted line');
    
    outStruct = qfactor(f,amp.*amp);
    outStruct.phaseQ = res_freq*slope/2;