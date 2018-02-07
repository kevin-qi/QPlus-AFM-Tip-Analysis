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

    fid = fopen(strcat(extractBefore(file,'.xlsx'),'.txt'),'wt');

    fprintf(fid, strcat('phaseQ: ',num2str(outStruct.phaseQ),'\n'));
    fprintf(fid, strcat('ampQ: ',num2str(outStruct.ampQ),'\n'));
    fprintf(fid, strcat('FWHM: ',num2str(outStruct.ampFWHM),'\n'));
    fprintf(fid, strcat('Resonance Frequency: ',num2str(outStruct.ResonanceFrequency),'\n'));

    fclose(fid)
end