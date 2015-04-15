test_datei_auslesen;

%Das CellArray wird durchlaufen
for n = 1:length(check)
    %Gucke ob der jeweilige String in dem Cellarray drin ist.
    found = strfind(check{n},'sa1.phn');
    %Rückgabe ist entweder eine leere Liste wenn der String nicht gefunden
    %wird oder eine Double die den Index des ersten Charakters beinhaltet
    %Wenn der string mehr als Einmal pro zeile vorhanden ist, dann werden
    %alle anfangsindizes abgespeichert.
end