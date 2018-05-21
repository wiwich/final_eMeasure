function func_slidingWindow(FILENAME,LABEL,OVERLAP,WINDOWSIZE,dt,permission,check)
    % %statistic feature
    % smax = max(nml_data.F7_theta(1:10));
    % smin = min(nml_data.F7_theta(1:10));
    % smean = mean(nml_data.F7_theta(1:10));
    % smedian = median(nml_data.F7_theta(1:10));
    % smode = mode(nml_data.F7_theta(1:10));
    % spower = sum(power(abs(nml_data.F7_theta(1:10)),2))/length(nml_data.F7_theta(1:10)); %power
    % sstd = std(nml_data.F7_theta(1:10)); %standard deviation
    % sfirstDiff = sum(diff(nml_data.F7_theta(1:10)))/(length(nml_data.F7_theta(1:10))-1) %first differntiation
    % snormalize1st = sfirstDiff/sstd; %Normalized first difference
    % ssecondDiff = sum(diff(diff(nml_data.F7_theta(1:10))))/(length(nml_data.F7_theta(1:10))-2) %first differntiation
    % snormalized2nd = ssecondDiff/sstd; %Normalized second difference
    % %Hjorth feature
    % sHjorthMo = sqrt((var(diff(nml_data.F7_theta(1:10))))/(var(nml_data.F7_theta(1:10)))) %Hjorth Mobility
    % sHjorthCom = sqrt(mean(diff(nml_data.F7_theta(1:10).^2) / mean(diff(nml_data.F7_theta(1:10).^2) - mean(diff(nml_data.F7_theta(1:10).^2) / mean(nml_data.F7_theta(1:10).^2))))) %Hjorth Complexity cr.https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/27561/versions/1/previews/MATS/HjorthParameters.m/index.html?access_key=
    
%     nml_data.F7_theta, nml_data.F7_alpha, nml_data.F7_lowBeta, nml_data.F7_highBeta, nml_data.F7_gamma,...
%     nml_data.F8_theta, nml_data.F8_alpha, nml_data.F8_lowBeta, nml_data.F8_highBeta, nml_data.F8_gamma,...
%     nml_data.T7_theta, nml_data.T7_alpha, nml_data.T7_lowBeta, nml_data.T7_highBeta, nml_data.T7_gamma,...
%     nml_data.T8_theta, nml_data.T8_alpha, nml_data.T8_lowBeta, nml_data.T8_highBeta, nml_data.T8_gamma
    
    SLIDE = WINDOWSIZE-OVERLAP; %sliding window
    ROUNDSIZE = size(dt,1);
    fid = fopen(FILENAME,permission);
    if check==1
%     title = 'F7_theta, F7_alpha, F7_lowBeta, F7_highBeta, F7_gamma, F8_theta, F8_alpha, F8_lowBeta, F8_highBeta, F8_gamma, T7_theta, T7_alpha, T7_lowBeta, T7_highBeta, T7_gamma, T7_theta, T8_alpha, T8_lowBeta, T8_highBeta, T8_gamma, max, min, mean, median, mode, power, S.D., 1stDiff, normalize1st, 2ndDiff, normalize2nd, hjorthMobility, hjorthComplexity,label';
    title = 'freqWave, max, min, mean, median, mode, power, S.D., 1stDiff, normalize1st, 2ndDiff, normalize2nd, hjorthMobility, hjorthComplexity,label';
    fprintf(fid,title);fprintf(fid,'\n');
    end

    
%     check = zeros(1,20);    
    for j=1:size(dt,2)      
        
        for i=1:SLIDE:ROUNDSIZE
            %channel check
%             F7_theta_check = 0; F7_alpha_check = 0; F7_lowBeta_check = 0; F7_highBeta_check = 0; F7_gamma_check = 0;
%             F8_theta_check = 0; F8_alpha_check = 0; F8_lowBeta_check = 0; F8_highBeta_check = 0; F8_gamma_check = 0;
%             T7_theta_check = 0; T7_alpha_check = 0; T7_lowBeta_check = 0; T7_highBeta_check = 0; T7_gamma_check = 0;
%             T8_theta_check = 0; T8_alpha_check = 0; T8_lowBeta_check = 0; T8_highBeta_check = 0; T8_gamma_check = 0;

            switch j
               case 1
                  freqWave = 'F7_theta';
               case 2
                  freqWave = 'F7_alpha';
               case 3
                  freqWave = 'F7_lowBeta';
               case 4
                  freqWave = 'F7_highBeta';
               case 5
                  freqWave = 'F7_gamma';
               case 6
                  freqWave = 'F8_theta';
               case 7
                  freqWave = 'F8_alpha';
               case 8
                  freqWave = 'F8_lowBeta';
               case 9
                  freqWave = 'F8_highBeta';
               case 10
                  freqWave = 'F8_gamma';
               case 11
                  freqWave = 'T7_theta';
               case 12
                  freqWave = 'T7_alpha';
               case 13
                  freqWave = 'T7_lowBeta';
               case 14
                  freqWave = 'T7_highBeta';
               case 15
                  freqWave = 'T7_gamma';
               case 16
                  freqWave = 'T8_theta';
               case 17
                  freqWave = 'T8_alpha';
               case 18
                  freqWave = 'T8_lowBeta';
               case 19
                  freqWave = 'T8_highBeta';
               case 20
                  freqWave = 'T8_gamma';
            end
            fprintf(fid, '%s,', freqWave);
%             fprintf(fid,'%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, ',...
%                 F7_theta_check, F7_alpha_check, F7_lowBeta_check, F7_highBeta_check, F7_gamma_check, ...
%                 F8_theta_check, F8_alpha_check, F8_lowBeta_check, F8_highBeta_check, F8_gamma_check, ...
%                 T7_theta_check, T7_alpha_check, T7_lowBeta_check, T7_highBeta_check, T7_gamma_check, ...
%                 T8_theta_check, T8_alpha_check, T8_lowBeta_check, T8_highBeta_check, T8_gamma_check);
            
            %find feature 
            if (i+WINDOWSIZE)>ROUNDSIZE
                %statistic feature
                val = dt(i:ROUNDSIZE,j);
                smax = max(val);
                smin = min(val);
                smean = mean(val);
                smedian = median(val);
                smode = mode(val);
                spower = sum(power(abs(val),2))/length(val); %power
                sstd = std(val); %standard deviation
                sfirstDiff = sum(diff(val))/(length(val)-1); %first differntiation
                snormalize1st = sfirstDiff/sstd; %Normalized first difference
                ssecondDiff = sum(diff(diff(val)))/(length(val)-2); %first differntiation
                snormalized2nd = ssecondDiff/sstd; %Normalized second difference
                %Hjorth feature
                sHjorthMo = sqrt((var(diff(val)))/(var(val))); %Hjorth Mobility
                sHjorthCom = sqrt(mean(diff(val.^2) / mean(diff(val.^2) - mean(diff(val.^2) / mean(val.^2))))); %Hjorth Complexity cr.https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/27561/versions/1/previews/MATS/HjorthParameters.m/index.html?access_key=

                fprintf(fid,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %s\n'...
                   ,smax,smin,smean,smedian,smode,spower,sstd,sfirstDiff,snormalize1st,ssecondDiff,snormalized2nd,sHjorthMo,sHjorthCom,LABEL); 

                break;
            else
                %statistic feature
                val = dt(i:i+WINDOWSIZE-1,j);
                smax = max(val);
                smin = min(val);
                smean = mean(val);
                smedian = median(val);
                smode = mode(val);
                spower = sum(power(abs(val),2))/length(val); %power
                sstd = std(val); %standard deviation
                sfirstDiff = sum(diff(val))/(length(val)-1); %first differntiation
                snormalize1st = sfirstDiff/sstd; %Normalized first difference
                ssecondDiff = sum(diff(diff(val)))/(length(val)-2); %first differntiation
                snormalized2nd = ssecondDiff/sstd; %Normalized second difference
                %Hjorth feature
                sHjorthMo = sqrt((var(diff(val)))/(var(val))); %Hjorth Mobility
                sHjorthCom = sqrt(mean(diff(val.^2) / mean(diff(val.^2) - mean(diff(val.^2) / mean(val.^2))))); %Hjorth Complexity cr.https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/27561/versions/1/previews/MATS/HjorthParameters.m/index.html?access_key=

                fprintf(fid,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %s\n',...
                    smax,smin,smean,smedian,smode,spower,sstd,sfirstDiff,snormalize1st,ssecondDiff,snormalized2nd,sHjorthMo,sHjorthCom,LABEL); 

            end    

        end
    end
    fclose('all');



end