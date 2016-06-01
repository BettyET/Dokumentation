%---------------------------------------------------------------%
% Einlesen der Daten einer Messung (3 Kan�le)                   %
%---------------------------------------------------------------%
function [meas] = readOszData(folder, nrOfMeas)

    % Leere Zelle f�r 3 Kan�le, mit je 500002 Zeit- und Werteintr�gen
    meas = zeros(500002,2,3);
    
    for ch=1:3                                  % F�r alle Kan�le 1 bis 3
        chStr = int2str(ch);
        measurementStr = int2str(nrOfMeas);
        filename = ['C', chStr ,'Trace0000',measurementStr, '.dat'];
        fID = fopen((filename), 'r');           % Datei �ffnen (Lesezugriff)
        C = textscan(fID,'%f %f');              % Datei in Arrays abf�llen
        fclose(fID);                            % Datei schlisesen

        % Daten verarbeiten und abf�llen
        data = cell2mat(C);  
        meas(:,1,ch) = data(:,1);               % Zeit (s)
        meas(:,2,ch) = data(:,2);               % Spannung (V)
        assignin ('base',['CH' num2str(ch)], struct('time' ,data(:,1),...
            'value' , data(:,2)));
    end 
end
%---------------------------------------------------------------%