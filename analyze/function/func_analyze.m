function func_analyze(FILENAME,status,startScene,endScene,WRITE_FILENAME)
    data = tdfread(FILENAME,',');
    [st_ind en_ind] = func_findIndexRange(data.timestamp,startScene,endScene);
    % func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Neutral(laLuna)'); %real data
    func_writeEmotionTrigger(WRITE_FILENAME,status,data,st_ind, en_ind); %real data
    
    
%% normalization
ALL_DATA_FILENAME = '0016_masterTos/0016_masterTos.csv';
all_data = tdfread(ALL_DATA_FILENAME,',');

max_F7_theta = max(all_data.F7_theta);
max_F7_alpha = max(all_data.F7_alpha);
max_F7_lowBeta = max(all_data.F7_lowBeta);
max_F7_highBeta = max(all_data.F7_highBeta);
max_F7_gamma = max(all_data.F7_gamma);

max_F8_theta = max(all_data.F8_theta);
max_F8_alpha = max(all_data.F8_alpha);
max_F8_lowBeta = max(all_data.F8_lowBeta);
max_F8_highBeta = max(all_data.F8_highBeta);
max_F8_gamma = max(all_data.F8_gamma);

max_T7_theta = max(all_data.T7_theta);
max_T7_alpha = max(all_data.T7_alpha);
max_T7_lowBeta = max(all_data.T7_lowBeta);
max_T7_highBeta = max(all_data.T7_highBeta);
max_T7_gamma = max(all_data.T7_gamma);

max_T8_theta = max(all_data.T8_theta);
max_T8_alpha = max(all_data.T8_alpha);
max_T8_lowBeta = max(all_data.T8_lowBeta);
max_T8_highBeta = max(all_data.T8_highBeta);
max_T8_gamma = max(all_data.T8_gamma);
 
end