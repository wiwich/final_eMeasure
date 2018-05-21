function [st_ind en_ind] = func_findIndexRange(timestamp,start,endt)
start_time = timestamp(1,:);

[hh mm ss ms] = func_calTime(start_time,start);
start_tt = strcat(num2str(hh),':',int2str(mm),':',int2str(ss));
start_index = strmatch(start_tt,timestamp);
st_ind = start_index(1);

[hh mm ss ms] = func_calTime(start_time,endt); 
end_tt = strcat(num2str(hh),':',int2str(mm),':',int2str(ss));
end_index = strmatch(end_tt,timestamp);
en_ind = end_index(length(end_index));
end