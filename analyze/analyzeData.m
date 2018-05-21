%% clear old data
clc; clear; close all;
addpath('./function');         % Add this function folder

%%  subject_0016_masterTos - laLuna Neutral (00:00:15:00 - 00:00:35:00)
% --Initial Value
FILENAME = '0016_masterTos/0016_master_trigger_part1.csv';
WRITE_FILENAME = '0016_part1_neutral_1.csv';
LABEL_STATUS = 'Neutral';
CLIP_BEGIN_EMO = '00:00:15:0';
CLIP_FINISH_EMO = '00:00:25:00';
func_analyze(FILENAME,LABEL_STATUS ,CLIP_BEGIN_EMO,CLIP_FINISH_EMO,WRITE_FILENAME)

% -- Read Data and find trigger
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,CLIP_BEGIN_EMO,CLIP_FINISH_EMO);
% func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Neutral(laLuna)'); %real data
func_writeEmotionTrigger(WRITE_FILENAME,LABEL_STATUS,data,st_ind, en_ind); %real data

% --Normalization
ALL_DATA_FILENAME = '0016_masterTos/0016_masterTos.csv';
nml_data = func_normalization(ALL_DATA_FILENAME, data);
% func_plotF7F8(FILENAME, nml_data, st_ind, en_ind); title('Neutral(laLuna)'); %normalize data

% --sliding windows & writing feature extraction
FEATURE_FILENAME = '0016_featureExtraction.csv';
OVERLAP = 3; %data overap: 3 data
WINDOWSIZE = 7; %windowsize: 10 data
nml_dt = [nml_data.F7_theta, nml_data.F7_alpha, nml_data.F7_lowBeta, nml_data.F7_highBeta, nml_data.F7_gamma,...
    nml_data.F8_theta, nml_data.F8_alpha, nml_data.F8_lowBeta, nml_data.F8_highBeta, nml_data.F8_gamma,...
    nml_data.T7_theta, nml_data.T7_alpha, nml_data.T7_lowBeta, nml_data.T7_highBeta, nml_data.T7_gamma,...
    nml_data.T8_theta, nml_data.T8_alpha, nml_data.T8_lowBeta, nml_data.T8_highBeta, nml_data.T8_gamma];
 func_slidingWindow(FEATURE_FILENAME,LABEL_STATUS,OVERLAP,WINDOWSIZE,nml_dt,'w',1);


%% subject_0016_masterTos - eyeOperating Negative (00:00:05:00 - 00:00:20:00)
% --Initial Value
FILENAME = '0016_masterTos/0016_master_trigger_part2_2.csv';
WRITE_FILENAME = '0016_part2_2_negative_1.csv';
LABEL_STATUS = 'Negative';
CLIP_BEGIN_EMO = '00:00:10:00';
CLIP_FINISH_EMO = '00:00:20:00';
func_analyze(FILENAME,LABEL_STATUS ,CLIP_BEGIN_EMO,CLIP_FINISH_EMO,WRITE_FILENAME)

% -- Read Data and find trigger
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,CLIP_BEGIN_EMO,CLIP_FINISH_EMO);
% func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Neutral(laLuna)'); %real data
func_writeEmotionTrigger(WRITE_FILENAME,LABEL_STATUS,data,st_ind, en_ind); %real data

% --Normalization
ALL_DATA_FILENAME = '0016_masterTos/0016_masterTos.csv';
nml_data = func_normalization(ALL_DATA_FILENAME, data);
% func_plotF7F8(FILENAME, nml_data, st_ind, en_ind); title('Neutral(laLuna)'); %normalize data

% --sliding windows & writing feature extraction
FEATURE_FILENAME = '0016_featureExtraction.csv';
OVERLAP = 3; %data overap: 3 data
WINDOWSIZE = 7; %windowsize: 10 data
nml_dt = [nml_data.F7_theta, nml_data.F7_alpha, nml_data.F7_lowBeta, nml_data.F7_highBeta, nml_data.F7_gamma,...
    nml_data.F8_theta, nml_data.F8_alpha, nml_data.F8_lowBeta, nml_data.F8_highBeta, nml_data.F8_gamma,...
    nml_data.T7_theta, nml_data.T7_alpha, nml_data.T7_lowBeta, nml_data.T7_highBeta, nml_data.T7_gamma,...
    nml_data.T8_theta, nml_data.T8_alpha, nml_data.T8_lowBeta, nml_data.T8_highBeta, nml_data.T8_gamma];
func_slidingWindow(FEATURE_FILENAME,LABEL_STATUS,OVERLAP,WINDOWSIZE,nml_dt,'a+',0);

%% subject_0016_masterTos - IcelandTravel Positive (00:00:02:00 - 00:00:15:00)
% --Initial Value
FILENAME = '0016_masterTos/0016_master_trigger_part3_2.csv';
WRITE_FILENAME = '0016_part3_2_positive_1.csv';
LABEL_STATUS = 'Positive';
CLIP_BEGIN_EMO = '00:00:05:00';
CLIP_FINISH_EMO = '00:00:15:00';
func_analyze(FILENAME,LABEL_STATUS ,CLIP_BEGIN_EMO,CLIP_FINISH_EMO,WRITE_FILENAME)

% -- Read Data and find trigger
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,CLIP_BEGIN_EMO,CLIP_FINISH_EMO);
% func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Neutral(laLuna)'); %real data
func_writeEmotionTrigger(WRITE_FILENAME,LABEL_STATUS,data,st_ind, en_ind); %real data

% --Normalization
ALL_DATA_FILENAME = '0016_masterTos/0016_masterTos.csv';
nml_data = func_normalization(ALL_DATA_FILENAME, data);
% func_plotF7F8(FILENAME, nml_data, st_ind, en_ind); title('Neutral(laLuna)'); %normalize data

% --sliding windows & writing feature extraction
FEATURE_FILENAME = '0016_featureExtraction.csv';
OVERLAP = 3; %data overap: 3 data
WINDOWSIZE = 7; %windowsize: 10 data
nml_dt = [nml_data.F7_theta, nml_data.F7_alpha, nml_data.F7_lowBeta, nml_data.F7_highBeta, nml_data.F7_gamma,...
    nml_data.F8_theta, nml_data.F8_alpha, nml_data.F8_lowBeta, nml_data.F8_highBeta, nml_data.F8_gamma,...
    nml_data.T7_theta, nml_data.T7_alpha, nml_data.T7_lowBeta, nml_data.T7_highBeta, nml_data.T7_gamma,...
    nml_data.T8_theta, nml_data.T8_alpha, nml_data.T8_lowBeta, nml_data.T8_highBeta, nml_data.T8_gamma];
func_slidingWindow(FEATURE_FILENAME,LABEL_STATUS,OVERLAP,WINDOWSIZE,nml_dt,'a+',0);
