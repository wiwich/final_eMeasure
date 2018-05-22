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
%     title = 'freqWave, max, min, mean, median, mode, power, S.D., 1stDiff, normalize1st, 2ndDiff, normalize2nd, hjorthMobility, hjorthComplexity,label';
%     fprintf(fid,title);fprintf(fid,'\n');    
        title = 'F7_theta_max, F7_theta_min, F7_theta_mean, F7_theta_median, F7_theta_mode, F7_theta_power, F7_theta_SD, F7_theta_1stDiff, F7_theta_normalize1st, F7_theta_2ndDiff, F7_theta_normalize2nd, F7_theta_hjorthMobility, F7_theta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F7_alpha_max, F7_alpha_min, F7_alpha_mean, F7_alpha_median, F7_alpha_mode, F7_alpha_power, F7_alpha_SD, F7_alpha_1stDiff, F7_alpha_normalize1st, F7_alpha_2ndDiff, F7_alpha_normalize2nd, F7_alpha_hjorthMobility, F7_alpha_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F7_lowBeta_max, F7_lowBeta_min, F7_lowBeta_mean, F7_lowBeta_median, F7_lowBeta_mode, F7_lowBeta_power, F7_lowBeta_SD, F7_lowBeta_1stDiff, F7_lowBeta_normalize1st, F7_lowBeta_2ndDiff, F7_lowBeta_normalize2nd, F7_lowBeta_hjorthMobility, F7_lowBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F7_highBeta_max, F7_highBeta_min, F7_highBeta_mean, F7_highBeta_median, F7_highBeta_mode, F7_highBeta_power, F7_highBeta_SD, F7_highBeta_1stDiff, F7_highBeta_normalize1st, F7_highBeta_2ndDiff, F7_highBeta_normalize2nd, F7_highBeta_hjorthMobility, F7_highBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F7_gamma_max, F7_gamma_min, F7_gamma_mean, F7_gamma_median, F7_gamma_mode, F7_gamma_power, F7_gamma_SD, F7_gamma_1stDiff, F7_gamma_normalize1st, F7_gamma_2ndDiff, F7_gamma_normalize2nd, F7_gamma_hjorthMobility, F7_gamma_hjorthComplexity,';fprintf(fid,'%s',title);

        title = 'F8_theta_max, F8_theta_min, F8_theta_mean, F8_theta_median, F8_theta_mode, F8_theta_power, F8_theta_SD, F8_theta_1stDiff, F8_theta_normalize1st, F8_theta_2ndDiff, F8_theta_normalize2nd, F8_theta_hjorthMobility, F8_theta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F8_alpha_max, F8_alpha_min, F8_alpha_mean, F8_alpha_median, F8_alpha_mode, F8_alpha_power, F8_alpha_SD, F8_alpha_1stDiff, F8_alpha_normalize1st, F8_alpha_2ndDiff, F8_alpha_normalize2nd, F8_alpha_hjorthMobility, F8_alpha_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F8_lowBeta_max, F8_lowBeta_min, F8_lowBeta_mean, F8_lowBeta_median, F8_lowBeta_mode, F8_lowBeta_power, F8_lowBeta_SD, F8_lowBeta_1stDiff, F8_lowBeta_normalize1st, F8_lowBeta_2ndDiff, F8_lowBeta_normalize2nd, F8_lowBeta_hjorthMobility, F8_lowBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F8_highBeta_max, F8_highBeta_min, F8_highBeta_mean, F8_highBeta_median, F8_highBeta_mode, F8_highBeta_power, F8_highBeta_SD, F8_highBeta_1stDiff, F8_highBeta_normalize1st, F8_highBeta_2ndDiff, F8_highBeta_normalize2nd, F8_highBeta_hjorthMobility, F8_highBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'F8_gamma_max, F8_gamma_min, F8_gamma_mean, F8_gamma_median, F8_gamma_mode, F8_gamma_power, F8_gamma_SD, F8_gamma_1stDiff, F8_gamma_normalize1st, F8_gamma_2ndDiff, F8_gamma_normalize2nd, F8_gamma_hjorthMobility, F8_gamma_hjorthComplexity,';fprintf(fid,'%s',title);

        title = 'T7_theta_max, T7_theta_min, T7_theta_mean, T7_theta_median, T7_theta_mode, T7_theta_power, T7_theta_SD, T7_theta_1stDiff, T7_theta_normalize1st, T7_theta_2ndDiff, T7_theta_normalize2nd, T7_theta_hjorthMobility, T7_theta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T7_alpha_max, T7_alpha_min, T7_alpha_mean, T7_alpha_median, T7_alpha_mode, T7_alpha_power, T7_alpha_SD, T7_alpha_1stDiff, T7_alpha_normalize1st, T7_alpha_2ndDiff, T7_alpha_normalize2nd, T7_alpha_hjorthMobility, T7_alpha_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T7_lowBeta_max, T7_lowBeta_min, T7_lowBeta_mean, T7_lowBeta_median, T7_lowBeta_mode, T7_lowBeta_power, T7_lowBeta_SD, T7_lowBeta_1stDiff, T7_lowBeta_normalize1st, T7_lowBeta_2ndDiff, T7_lowBeta_normalize2nd, T7_lowBeta_hjorthMobility, T7_lowBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T7_highBeta_max, T7_highBeta_min, T7_highBeta_mean, T7_highBeta_median, T7_highBeta_mode, T7_highBeta_power, T7_highBeta_SD, T7_highBeta_1stDiff, T7_highBeta_normalize1st, T7_highBeta_2ndDiff, T7_highBeta_normalize2nd, T7_highBeta_hjorthMobility, T7_highBeta_hjorthComplexityl,';fprintf(fid,'%s',title);
        title = 'T7_gamma_max, T7_gamma_min, T7_gamma_mean, T7_gamma_median, T7_gamma_mode, T7_gamma_power, T7_gamma_SD, T7_gamma_1stDiff, T7_gamma_normalize1st, T7_gamma_2ndDiff, T7_gamma_normalize2nd, T7_gamma_hjorthMobility, T7_gamma_hjorthComplexity,';fprintf(fid,'%s',title);

        title = 'T8_theta_max, T8_theta_min, T8_theta_mean, T8_theta_median, T8_theta_mode, T8_theta_power, T8_theta_SD, T8_theta_1stDiff, T8_theta_normalize1st, T8_theta_2ndDiff, T8_theta_normalize2nd, T8_theta_hjorthMobility, T8_theta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T8_alpha_max, T8_alpha_min, T8_alpha_mean, T8_alpha_median, T8_alpha_mode, T8_alpha_power, T8_alpha_SD, T8_alpha_1stDiff, T8_alpha_normalize1st, T8_alpha_2ndDiff, T8_alpha_normalize2nd, T8_alpha_hjorthMobility, T8_alpha_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T8_lowBeta_max, T8_lowBeta_min, T8_lowBeta_mean, T8_lowBeta_median, T8_lowBeta_mode, T8_lowBeta_power, T8_lowBeta_SD, T8_lowBeta_1stDiff, T8_lowBeta_normalize1st, T8_lowBeta_2ndDiff, T8_lowBeta_normalize2nd, T8_lowBeta_hjorthMobility, T8_lowBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T8_highBeta_max, T8_highBeta_min, T8_highBeta_mean, T8_highBeta_median, T8_highBeta_mode, T8_highBeta_power, T8_highBeta_SD, T8_highBeta_1stDiff, T8_highBeta_normalize1st, T8_highBeta_2ndDiff, T8_highBeta_normalize2nd, T8_highBeta_hjorthMobility, T8_highBeta_hjorthComplexity,';fprintf(fid,'%s',title);
        title = 'T8_gamma_max, T8_gamma_min, T8_gamma_mean, T8_gamma_median, T8_gamma_mode, T8_gamma_power, T8_gamma_SD, T8_gamma_1stDiff, T8_gamma_normalize1st, T8_gamma_2ndDiff, T8_gamma_normalize2nd, T8_gamma_hjorthMobility, T8_gamma_hjorthComplexity,Label';fprintf(fid,'%s',title);
        fprintf(fid,'\n');   
    end
    
    for i=1:SLIDE:ROUNDSIZE            
        for j=1:size(dt,2) %chanel*frequencyWave
            %find feature 
            if (i+WINDOWSIZE)>=ROUNDSIZE
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

                fprintf(fid,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %s'...
                   ,smax,smin,smean,smedian,smode,spower,sstd,sfirstDiff,snormalize1st,ssecondDiff,snormalized2nd,sHjorthMo,sHjorthCom,LABEL); 
                j=1;
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

                fprintf(fid,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f,',...
                    smax,smin,smean,smedian,smode,spower,sstd,sfirstDiff,snormalize1st,ssecondDiff,snormalized2nd,sHjorthMo,sHjorthCom); 

            end             
            
        end 
        fprintf(fid,'%s', LABEL);
        fprintf(fid,'\n');
    end
    fclose('all');



end