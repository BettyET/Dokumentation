%Function [valueAcc]=volt2acc(chargePerG, chargeGain, valueVolt)
%
%Wandelt die gemessene Spannung in die Beschleunigung in g um. 
%
%ARGUMENTS: chargePerG  - Empfindlichkeit Sensor
%           chargeGain  - Eingestellte Verstärkung am Ladungsverstärker
%           (mv/g)
%           valueVolt   - Zu wandelnde Werte
%
%RETURNS  : valueAcc    - Gewandelte Beschleunigungswerte (g)
%

%%%%%%%% Matlab code follows %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------------------------------------%
% Wandeln in die Beschleunigung (g)                             %
%---------------------------------------------------------------%
function [valueAcc]=volt2acc(chargePerG, chargeGain, valueVolt)
    valueAcc = (valueVolt * 1000) / (chargeGain*chargePerG);
end
%---------------------------------------------------------------%