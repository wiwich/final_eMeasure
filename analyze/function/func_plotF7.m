function val = func_plotF7(titleName,data,indexStart,indexEnd)
    figure; title(titleName);
    hold on;
    plot(data.F7_theta(indexStart:indexEnd));  
    plot(data.F7_alpha(indexStart:indexEnd));
    plot(data.F7_lowBeta(indexStart:indexEnd));
    plot(data.F7_highBeta(indexStart:indexEnd));
    plot(data.F7_gamma(indexStart:indexEnd));
    legend('theta','alpha','lBeta','hBeta','gamma');
    hold off;
end
    