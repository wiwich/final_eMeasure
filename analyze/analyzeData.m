%% clear old data
clc; clear; close all;
addpath('./function');         % Add this function folder

%% subject_0016_sj

%laLuna Neutral (00:00:15:00 - 00:00:35:00)
FILENAME = '0016_sj/0016_sj_trigger_part1.csv';
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,'00:00:15:0','00:00:35:00');
func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Neutral (laLuna)');
WRITE_FILENAME = '0016_part1_neutral_1.csv';
func_writeEmotionTrigger(WRITE_FILENAME,'Neutral',data,st_ind, en_ind);
 
%eyeOperating Negative (00:00:10:00 - 00:00:20:00)
FILENAME = '0016_sj/0016_sj_trigger_part2_2.csv';
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,'00:00:10:0','00:00:20:00');
func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Negative (eyeOperating)');
WRITE_FILENAME = '0016_part2_2_negative_1.csv';
func_writeEmotionTrigger(WRITE_FILENAME,'Negative',data,st_ind, en_ind);

%IcelandTravel Positive (00:00:02:00 - 00:00:15:00)
FILENAME = '0016_sj/0016_sj_trigger_part3_2.csv';
data = tdfread(FILENAME,',');
[st_ind en_ind] = func_findIndexRange(data.timestamp,'00:00:02:00','00:00:15:00');
func_plotF7F8(FILENAME, data, st_ind, en_ind); title('Positive (icelandTravel)');
WRITE_FILENAME = '0016_part3_2_positive_1.csv';
func_writeEmotionTrigger(WRITE_FILENAME,'Positive',data,st_ind, en_ind);