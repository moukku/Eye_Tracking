data = readtable('train_fixations.csv','Delimiter',',','ReadVariableNames',false);
cellA = table2cell(data);

s1durationsTrue = cell(1);
s11durationsTrue = cell(1);
s21durationsTrue = cell(1);
s5durationsTrue = cell(1);
s15durationsTrue = cell(1);
s25durationsTrue = cell(1);

s1durationsFalse = cell(1);
s11durationsFalse = cell(1);
s21durationsFalse = cell(1);
s5durationsFalse = cell(1);
s15durationsFalse = cell(1);
s25durationsFalse = cell(1);
s21durationTotal = 0;

for i=1:size(cellA)
    if(strcmp(cellA(i,1), 's1') == 1 && strcmp(cellA(i,2), 'true'))
        s1durationsTrue(1,1) = cellA(i,1);
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsTrue(1, size(s1durationsTrue)+1) = cellA(i,j);
            end;
        end;
    end;
    if(strcmp(cellA(i,1), 's1') == 1 && strcmp(cellA(i,2), 'false'))
        s1durationsFalse(1,1) = cellA(i,1);
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsFalse(1, size(s1durationsFalse)+1) = cellA(i,j);
            end;
        end;
    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'true'))
        s11durationsTrue(1,1) = cellA(i,1);
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsTrue(1, size(s11durationsTrue)+1) = cellA(i,k);
            end;
        end;
    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'false'))
        s11durationsFalse(1,1) = cellA(i,1);
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsFalse(1, size(s11durationsFalse)+1) = cellA(i,k);
            end;
        end;
    end;
    if(strcmp(cellA(i,1), 's21') == 1 && strcmp(cellA(i,2), 'true'))
        s21durationsTrue(1,1) = cellA(i,1);
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s21durationsTrue(1, size(s21durationsTrue)+1) = cellA(i,l);
            end;
        end;
    end;
    if(strcmp(cellA(i,1), 's21') == 1 && strcmp(cellA(i,2), 'false'))
        s21durationsFalse(1,1) = cellA(i,1);
        s21durationFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                %s21durationsFalse(1, size(s21durationsFalse)+1) = cellA(i,l);
                s21durationFalseTotal(1,1) = s21durationFalseTotal(1,1) + cellA{i,l};
                s21durationFalseTotal(1,2) = s21durationFalseTotal(1,2) + 1;
            end;
        end;
        
        s21MFD = s21durationFalseTotal(1,1) / s21durationFalseTotal(1,2);
    end;
    if(strcmp(cellA(i,1), 's5') == 1)

    end;
    if(strcmp(cellA(i,1), 's15') == 1)
    end;
    if(strcmp(cellA(i,1), 's25') == 1)
    end;
end;
