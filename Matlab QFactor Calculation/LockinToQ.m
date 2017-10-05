function [outStruct] = LockinToQ(file)
    df = readtable(file);
    f = df.Frequency;
    x_raw = df.X;
    y_raw = df.Y;
    
    
    fromAmp =  ampToQ(f,x_raw,y_raw);
    
    fromPhase = phaseToQ(f,x_raw,y_raw);
    
    outStruct = struct();
    
    outStruct.phaseQ = fromPhase.Q;
    outStruct.ampQ = fromAmp.Q;
    
    outStruct.ampFWHM = fromAmp.FWHM;
    outStruct.ResonanceFrequency = fromAmp.res;
end