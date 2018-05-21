function new_data = func_normalization(FILENAME, data)
    all_data = tdfread(FILENAME,',');
    
    max_val = [max(all_data.F7_theta) max(all_data.F7_alpha) max(all_data.F7_lowBeta) max(all_data.F7_highBeta) max(all_data.F7_gamma) ...
        max(all_data.F8_theta) max(all_data.F8_alpha) max(all_data.F8_lowBeta) max(all_data.F8_highBeta) max(all_data.F8_gamma) ...
        max(all_data.T7_theta) max(all_data.T7_alpha) max(all_data.T7_lowBeta) max(all_data.T7_highBeta) max(all_data.T7_gamma) ...
        max(all_data.T8_theta) max(all_data.T8_alpha) max(all_data.T8_lowBeta) max(all_data.T8_highBeta) max(all_data.T8_gamma) ...
        ];
    max_val = max(max_val);
    new_data.F7_theta = data.F7_theta / max_val; % plot(data1.F7_theta(st_ind:en_ind));  
    new_data.F7_alpha = data.F7_alpha / max_val;
    new_data.F7_lowBeta = data.F7_lowBeta / max_val;
    new_data.F7_highBeta = data.F7_highBeta / max_val;
    new_data.F7_gamma = data.F7_gamma / max_val;

    new_data.F8_theta = data.F8_theta / max_val; % plot(data1.F7_theta(st_ind:en_ind));  
    new_data.F8_alpha = data.F8_alpha / max_val;
    new_data.F8_lowBeta = data.F8_lowBeta / max_val;
    new_data.F8_highBeta = data.F8_highBeta / max_val;
    new_data.F8_gamma = data.F8_gamma / max_val;

    new_data.T7_theta = data.T7_theta / max_val; % plot(data1.F7_theta(st_ind:en_ind));  
    new_data.T7_alpha = data.T7_alpha / max_val;
    new_data.T7_lowBeta = data.T7_lowBeta / max_val;
    new_data.T7_highBeta = data.T7_highBeta / max_val;
    new_data.T7_gamma = data.T7_gamma / max_val;

    new_data.T8_theta = data.T8_theta / max_val; % plot(data1.F7_theta(st_ind:en_ind));  
    new_data.T8_alpha = data.T8_alpha / max_val;
    new_data.T8_lowBeta = data.T8_lowBeta / max_val;
    new_data.T8_highBeta = data.T8_highBeta / max_val;
    new_data.T8_gamma = data.T8_gamma / max_val;
    
%     data.F7_theta = data.F7_theta / max(all_data.F7_theta); % plot(data1.F7_theta(st_ind:en_ind));  
%     data.F7_alpha = data.F7_alpha / max(all_data.F7_alpha);
%     data.F7_lowBeta = data.F7_lowBeta / max(all_data.F7_lowBeta);
%     data.F7_highBeta = data.F7_highBeta / max(all_data.F7_highBeta);
%     data.F7_gamma = data.F7_gamma / max(all_data.F7_gamma);
% 
%     data.F8_theta = data.F8_theta / max(all_data.F8_theta); % plot(data1.F7_theta(st_ind:en_ind));  
%     data.F8_alpha = data.F8_alpha / max(all_data.F8_alpha);
%     data.F8_lowBeta = data.F8_lowBeta / max(all_data.F8_lowBeta);
%     data.F8_highBeta = data.F8_highBeta / max(all_data.F8_highBeta);
%     data.F8_gamma = data.F8_gamma / max(all_data.F8_gamma);
% 
%     data.T7_theta = data.T7_theta / max(all_data.T7_theta); % plot(data1.F7_theta(st_ind:en_ind));  
%     data.T7_alpha = data.T7_alpha / max(all_data.T7_alpha);
%     data.T7_lowBeta = data.T7_lowBeta / max(all_data.T7_lowBeta);
%     data.T7_highBeta = data.T7_highBeta / max(all_data.T7_highBeta);
%     data.T7_gamma = data.T7_gamma / max(all_data.T7_gamma);
% 
%     data.T8_theta = data.T8_theta / max(all_data.T8_theta); % plot(data1.F7_theta(st_ind:en_ind));  
%     data.T8_alpha = data.T8_alpha / max(all_data.T8_alpha);
%     data.T8_lowBeta = data.T8_lowBeta / max(all_data.T8_lowBeta);
%     data.T8_highBeta = data.T8_highBeta / max(all_data.T8_highBeta);
%     data.T8_gamma = data.T8_gamma / max(all_data.T8_gamma);

end