function func_writeEmotionTrigger(FILENAME,emo,data,st, en)
% Write a *.csv file and label emotion from EEG data
% 
% func_writeEmotionTrigger(FILENAME,emo,data,st, en)
% 
% FILENAME = Name of the file to save. [ i.e. 'text.csv']
% emo = Status of emotion to label
% data = Data from emotiv EPOC+
% st = start of index 
% en = end of index
% 
% by Wichaya Wichienchai, B.Sc.
% Last Updated: 17 May 2018
% ----------------------------------------------------------------------

    dif = fopen(FILENAME,'a+');

%     title = 'timestamp, timeStart, wirelessStrength, F7_quality, F8_quality, T7_quality, T8_quality, F7_theta, F7_alpha, F7_lowBeta, F7_highBeta, F7_gamma, F8_theta, F8_alpha, F8_lowBeta, F8_highBeta, F8_gamma, T7_theta, T7_alpha, T7_lowBeta, T7_highBeta, T7_gamma, T7_theta, T8_alpha, T8_lowBeta, T8_highBeta, T8_gamma, Label';
%     fprintf(dif,title); fprintf(dif,'\n');
    for i=st:en
       fprintf(dif,'%s, ',data.timestamp(i,:));
       fprintf(dif,'%d, ',data.timeStart(i));
       fprintf(dif,'%d, ',data.wirelessStrength(i));

       fprintf(dif,'%d, ',data.F7_quality(i));
       fprintf(dif,'%d, ',data.F8_quality(i));
       fprintf(dif,'%d, ',data.T7_quality(i));
       fprintf(dif,'%d, ',data.T8_quality(i));

       fprintf(dif,'%d, ',data.F7_theta(i));
       fprintf(dif,'%d, ',data.F7_alpha(i));
       fprintf(dif,'%d, ',data.F7_lowBeta(i));
       fprintf(dif,'%d, ',data.F7_highBeta(i));
       fprintf(dif,'%d, ',data.F7_gamma(i));

       fprintf(dif,'%d, ',data.F8_theta(i));
       fprintf(dif,'%d, ',data.F8_alpha(i));
       fprintf(dif,'%d, ',data.F8_lowBeta(i));
       fprintf(dif,'%d, ',data.F8_highBeta(i));
       fprintf(dif,'%d, ',data.F8_gamma(i));

       fprintf(dif,'%d, ',data.T7_theta(i));
       fprintf(dif,'%d, ',data.T7_alpha(i));
       fprintf(dif,'%d, ',data.T7_lowBeta(i));
       fprintf(dif,'%d, ',data.T7_highBeta(i));
       fprintf(dif,'%d, ',data.T7_gamma(i));

       fprintf(dif,'%d, ',data.T8_theta(i));
       fprintf(dif,'%d, ',data.T8_alpha(i));
       fprintf(dif,'%d, ',data.T8_lowBeta(i));
       fprintf(dif,'%d, ',data.T8_highBeta(i));
       fprintf(dif,'%d, ',data.T8_gamma(i));

       fprintf(dif,'%s',emo);
       fprintf(dif,'\n');
    end
    fclose('all');
end