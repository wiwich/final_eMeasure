function [rhh rmm rss rms] = func_calTime(start_time,add_time)

    ec_st = find(start_time==':');
    hh_st = str2num(start_time(1:ec_st(1)-1));
    mm_st = str2num(start_time(ec_st(1)+1:ec_st(2)-1));
    ss_st = str2num(start_time(ec_st(2)+1:ec_st(3)-1));
    ms_st = str2num(start_time(ec_st(3)+1:length(start_time)));
    
    ec_add = find(add_time==':');
    hh_add = str2num(add_time(1:ec_add(1)-1));
    mm_add = str2num(add_time(ec_add(1)+1:ec_add(2)-1));
    ss_add = str2num(add_time(ec_add(2)+1:ec_add(3)-1)); 
    ms_add = str2num(add_time(ec_add(3)+1:length(add_time)));
    
    %milli second
    rms = ms_st + ms_add;
    tmp_ss = floor(rms/1000);
    rms = mod(rms,1000);
    
    %second
    rss = ss_st + ss_add + tmp_ss;
    tmp_mm = floor(rss/60);
    rss = mod(rss,60);
    
    %minute
    rmm = mm_st + mm_add + tmp_mm;
    tmp_hh = floor(rmm/60);
    rmm = mod(rmm,60);
    
    %hour
    rhh = floor(hh_st + hh_add + tmp_hh);      
    
   
end