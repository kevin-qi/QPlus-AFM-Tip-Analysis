Lock-in amplifier QPlus Tip Test Software
For use with SRS 830
Updated 08/21/2017

Labview Files:

NEWEST: QPlus_Analyzer 3.0: Updated how data is recorded.

QPlus_Analyzer 2.0: Collects all channels.

QPlus_Analyzer_beta: First draft

QPlus_Analyzer 1.0: Collects only 1 channel (X). Uses integration method to calculate Q

QPlus_Data_Analyzer: Computes Q from text file data with integration method


Matlab Files:

LockinToQ takes in file path "C:/..." as argument and outputs Q-factors calculated from phase and from amplitude. File type is xlsx.

nanonisToQ.m takes in file path "C:/..." as argument and outputs Q-factor calculated from phase. File type is nanonis txt files with the header trimmed off.

ampToQ is a helper function that calculates Q from amplitude

phaseToQ is a helper function that calculates Q form phase

qfactor is a helper function that calculates Q from amplitude.

fdelta is a helper function that calculates fwhm



More Instructions to come soon...


