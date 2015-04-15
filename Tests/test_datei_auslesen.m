%Testscript um zu sehen wie Dateien eingelesen werden.

%oeffnet UI um Datei auszuwaehlen
[Dateiname, Pfad] = uigetfile('*.txt','Bitte Datei auswählen!');

%Dateiname wird ausgegeben
fprintf('Die eingelesene Datei ist: %s\n',Dateiname)

%oeffnet die Datei um binaer zu lesen
fid=fopen(fullfile(Pfad,Dateiname), 'r');

%Der Inhalt der Datei eingelesen und in check abgespeichert
check=textscan(fid,'%s');

%check ist ein cell Datentyp. Dieser soll dargestellt werden
%celldisp(check)

%Dateizugriff wird beendet. Datei wird geschlossen
fclose(fid);
