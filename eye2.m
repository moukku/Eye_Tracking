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
        s1durationTrueTotal(1,2) = 0;
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsTrue(1, size(s1durationsTrue)+1) = cellA(i,j);
                s1durationTrueTotal(1,1) = s1durationTrueTotal(1,1) + cellA{i,j};
                s1durationTrueTotal(1,2) = size(s1durationsTrue, 2);
            end;
        end;
        
        s1TrueMFD = s1durationTrueTotal(1,1) / s1durationTrueTotal(1,2);
    end;
    if(strcmp(cellA(i,1), 's1') == 1 && strcmp(cellA(i,2), 'false'))
        s1durationsFalse(1,1) = cellA(i,1);
        s1durationFalseTotal(1,2) = 0;
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsFalse(1, size(s1durationsFalse)+1) = cellA(i,j);
                s1durationFalseTotal(1,1) = s1durationFalseTotal(1,1) + cellA{i,j};
                s1durationFalseTotal(1,2) = size(s1durationsFalse, 2);
            end;
        end;
        
        s1FalseMFD = s1durationFalseTotal(1,1) / s1durationFalseTotal(1,2);
    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'true'))
        s11durationsTrue(1,1) = cellA(i,1);
        s11durationTrueTotal(1,2) = 0;
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsTrue(1, size(s11durationsTrue)+1) = cellA(i,k);
                s11durationTrueTotal(1,1) = s11durationTrueTotal(1,1) + cellA{i,k};
                s11durationTrueTotal(1,2) = size(s11durationsTrue, 2);
            end;
        end;

        s11TrueMFD = s11durationTrueTotal(1,1) / s11durationTrueTotal(1,2);

    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'false'))
        s11durationsFalse(1,1) = cellA(i,1);
        s11durationFalseTotal(1,2) = 0;
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsFalse(1, size(s11durationsFalse)+1) = cellA(i,k);
                s11durationFalseTotal(1,1) = s11durationFalseTotal(1,1) + cellA{i,k};
                s11durationFalseTotal(1,2) = size(s11durationsFalse, 2);
            end;
        end;
        
        s11FalseMFD = s11durationFalseTotal(1,1) / s11durationFalseTotal(1,2);
    end;
    if(strcmp(cellA(i,1), 's21') == 1 && strcmp(cellA(i,2), 'true'))
        s21durationsTrue(1,1) = cellA(i,1);
        s21durationTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s21durationsTrue(1, size(s21durationsTrue)+1) = cellA(i,l);
                s21durationTrueTotal(1,1) = s21durationTrueTotal(1,1) + cellA{i,l};
                s21durationTrueTotal(1,2) = size(s21durationsTrue, 2);
            end;
        end;
        
        s21TrueMFD = s21durationTrueTotal(1,1) / s21durationTrueTotal(1,2);
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
                s21durationsFalse(1, size(s21durationsFalse)+1) = cellA(i,l);
                s21durationFalseTotal(1,1) = s21durationFalseTotal(1,1) + cellA{i,l};
                s21durationFalseTotal(1,2) = size(s21durationsFalse, 2);
            end;
        end;
        
        s21FalseMFD = s21durationFalseTotal(1,1) / s21durationFalseTotal(1,2);
    end;
    if(strcmp(cellA(i,1), 's5') == 1 && strcmp(cellA(i,2), 'false'))
        s5durationsFalse(1,1) = cellA(i,1);
        s5durationFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s5durationsFalse(1, size(s5durationsFalse)+1) = cellA(i,l);
                s5durationFalseTotal(1,1) = s5durationFalseTotal(1,1) + cellA{i,l};
                s5durationFalseTotal(1,2) = size(s5durationsFalse, 2);
            end;
        end;
        
        s5FalseMFD = s5durationFalseTotal(1,1) / s5durationFalseTotal(1,2);
    end;
    
    if(strcmp(cellA(i,1), 's5') == 1 && strcmp(cellA(i,2), 'true'))
        s5durationsTrue(1,1) = cellA(i,1);
        s5durationTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s5durationsTrue(1, size(s5durationsTrue)+1) = cellA(i,l);
                s5durationTrueTotal(1,1) = s5durationTrueTotal(1,1) + cellA{i,l};
                s5durationTrueTotal(1,2) = size(s5durationsTrue, 2);
            end;
        end;
        
        s5TrueMFD = s5durationTrueTotal(1,1) / s5durationTrueTotal(1,2);
    end;
    
    if(strcmp(cellA(i,1), 's15') == 1 && strcmp(cellA(i,2), 'false'))
        s15durationsFalse(1,1) = cellA(i,1);
        s15durationFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s15durationsFalse(1, size(s15durationsFalse)+1) = cellA(i,l);
                s15durationFalseTotal(1,1) = s15durationFalseTotal(1,1) + cellA{i,l};
                s15durationFalseTotal(1,2) = size(s15durationsFalse, 2);
            end;
        end;
        
        s15FalseMFD = s15durationFalseTotal(1,1) / s15durationFalseTotal(1,2);
    end;
    
    if(strcmp(cellA(i,1), 's15') == 1 && strcmp(cellA(i,2), 'true'))
        s15durationsTrue(1,1) = cellA(i,1);
        s15durationTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s15durationsTrue(1, size(s15durationsTrue)+1) = cellA(i,l);
                s15durationTrueTotal(1,1) = s15durationTrueTotal(1,1) + cellA{i,l};
                s15durationTrueTotal(1,2) = size(s15durationsTrue, 2);
            end;
        end;
        
        s15TrueMFD = s15durationTrueTotal(1,1) / s15durationTrueTotal(1,2);
    end;
    
    if(strcmp(cellA(i,1), 's25') == 1 && strcmp(cellA(i,2), 'false'))
        s25durationsFalse(1,1) = cellA(i,1);
        s25durationFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s25durationsFalse(1, size(s25durationsFalse)+1) = cellA(i,l);
                s25durationFalseTotal(1,1) = s25durationFalseTotal(1,1) + cellA{i,l};
                s25durationFalseTotal(1,2) = size(s25durationsFalse, 2);
            end;
        end;
        
        s25FalseMFD = s25durationFalseTotal(1,1) / s25durationFalseTotal(1,2);
    end;
    
    if(strcmp(cellA(i,1), 's25') == 1 && strcmp(cellA(i,2), 'true'))
        s25durationsTrue(1,1) = cellA(i,1);
        s25durationTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s25durationsTrue(1, size(s25durationsTrue)+1) = cellA(i,l);
                s25durationTrueTotal(1,1) = s25durationTrueTotal(1,1) + cellA{i,l};
                s25durationTrueTotal(1,2) = size(s25durationsTrue, 2);
            end;
        end;
        
        s25TrueMFD = s25durationTrueTotal(1,1) / s25durationTrueTotal(1,2);
    end;
end;
