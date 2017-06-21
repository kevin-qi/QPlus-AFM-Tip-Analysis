Lock-in amplifier QPlus Tip Test Software
For use with SRS 830
Updated 06/21/2017

QPlus_Lockin_Analyzer.vi is for data collection
QPlus_Data_Analyzer.vi is for analyzing previously collected data


QPlus_Lockin_Analyzer.vi Instructions:
1) Create new empty text file for storing data
2) Make sure "Save File Name" points to above text file
3) Select correct GPIB VISA name
4) Set settings as desired
5) Press run

QPlus_Data_Analyzer.vi Instructions:
1) Select correct file path
2) Press run

Troubleshooting:
1) If Raw signal is normal but integrated signal is messed up, check that you used a empty text file. The program appends new data points to the file you specified so you must use a new empty text file
