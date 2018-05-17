function val = func_plotF8(titleName,data,indexStart,indexEnd)
    figure; title(titleName);
    hold on;
    plot(data.F8_theta(indexStart:indexEnd));  
    plot(data.F8_alpha(indexStart:indexEnd));
    plot(data.F8_lowBeta(indexStart:indexEnd));
    plot(data.F8_highBeta(indexStart:indexEnd));
    plot(data.F8_gamma(indexStart:indexEnd));
    legend('theta','alpha','lBeta','hBeta','gamma');
    hold off;
end
    