%Function [meas]=readOszData(folder, nrOfMeas)
%
%Liest die Daten des Oszilloskopes ein (3 Kanäle). 
%
%ARGUMENTS: folder      - String Name des Ordner, in welchem sich die Daten
%                         befinden
%           nrOfMeas    - Nummer der Messung
%
%RETURNS  : meas        - Cell Array mit drei Einträgen der drei Kanäle,
%                         für jeden Kanal Zeit- und Datenwerte
%
%%%%%%%% Matlab code follows %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------------------------------------%
% Einlesen der Daten einer Messung (3 Kanäle)                   %
%---------------------------------------------------------------%
function [meas] = readOszData(folder, nrOfMeas)

    % Leere Zelle für 3 Kanäle, mit je 500002 Zeit- und Werteinträgen
    meas = zeros(500002,2,3);
    
    for ch=1:3                                  % Für alle Kanäle 1 bis 3
        chStr = int2str(ch);
        measurementStr = int2str(nrOfMeas);
        filename = ['C', chStr ,'Trace0000',measurementStr, '.dat'];
        fID = fopen((filename), 'r');           % Datei öffnen (Lesezugriff)
        C = textscan(fID,'%f %f');              % Datei in Arrays abfüllen
        fclose(fID);                            % Datei schliesen

        % Daten verarbeiten und abfüllen
        data = cell2mat(C);  
        meas(:,1,ch) = data(:,1);               % Zeit (s)
        meas(:,2,ch) = data(:,2);               % Spannung (V)
        assignin ('base',['CH' num2str(ch)], struct('time' ,data(:,1),...
            'value' , data(:,2)));
    end 
end
%---------------------------------------------------------------%