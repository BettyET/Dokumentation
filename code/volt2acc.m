%---------------------------------------------------------------%
% Wandeln in die Beschleunigung (g)                             %
%---------------------------------------------------------------%
function [valueAcc]=volt2acc(chargePerG, chargeGain, valueVolt)
    valueAcc = (valueVolt * 1000) / (chargeGain*chargePerG);
end
%---------------------------------------------------------------%