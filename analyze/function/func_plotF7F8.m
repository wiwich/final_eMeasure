function val = func_plotF7F8(titleName,data,indexStart,indexEnd)
    figure; title(titleName);
    hold on;
    plot(data.F7_theta(indexStart:indexEnd));  
    plot(data.F7_alpha(indexStart:indexEnd));
    plot(data.F7_lowBeta(indexStart:indexEnd));
    plot(data.F7_highBeta(indexStart:indexEnd));
%     plot(data.F7_gamma(indexStart:indexEnd));
    
    plot(data.F8_theta(indexStart:indexEnd));  
    plot(data.F8_alpha(indexStart:indexEnd));
    plot(data.F8_lowBeta(indexStart:indexEnd));
    plot(data.F8_highBeta(indexStart:indexEnd));
%     plot(data.F8_gamma(indexStart:indexEnd));

    legend('F7_theta','F7_alpha','F7_lBeta','F7_hBeta','F8_theta','F8_alpha','F8_lBeta','F8_hBeta');
%     legend('F7_theta','F7_alpha','F7_lBeta','F7_hBeta','F7_gamma','F8_theta','F8_alpha','F8_lBeta','F8_hBeta','F8_gamma');
    hold off;
end
    