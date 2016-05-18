%Function [meas]=readOszData(folder, nrOfMeas)
%
%Liest die Daten des Oszilloskopes ein (3 Kan�le). 
%
%ARGUMENTS: folder      - String Name des Ordner, in welchem sich die Daten
%                         befinden
%           nrOfMeas    - Nummer der Messung
%
%RETURNS  : meas        - Cell Array mit drei Eintr�gen der drei Kan�le,
%                         f�r jeden Kanal Zeit- und Datenwerte
%
%%%%%%%% Matlab code follows %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
        fclose(fID);                            % Datei schliesen

        % Daten verarbeiten und abf�llen
        data = cell2mat(C);  
        meas(:,1,ch) = data(:,1);               % Zeit (s)
        meas(:,2,ch) = data(:,2);               % Spannung (V)
        assignin ('base',['CH' num2str(ch)], struct('time' ,data(:,1),...
            'value' , data(:,2)));
    end 
end
%---------------------------------------------------------------%