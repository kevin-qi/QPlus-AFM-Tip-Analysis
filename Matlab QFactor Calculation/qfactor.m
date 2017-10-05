function [ outStruct ] = find_q(freq, amp)
%This function finds the Q value
%   
    deltaf=fdelta(freq, amp); %finds fwhm
    peak_amp=max(amp);
    peak_index=find(amp==peak_amp);
    res_f=freq(peak_index);
    Q=res_f/deltaf;
    
    hold on;
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');

outStruct = struct();
    outStruct.FWHM = deltaf;
    outStruct.resonance_freq = res_f;
    outStruct.Q = Q;
    outStruct.res = res_f;
    outStruct.deltaf= deltaf;
end