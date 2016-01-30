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

s1durationsOverall = cell(1);
s11durationsOverall = cell(1);
s21durationsOverall = cell(1);
s5durationsOverall = cell(1);
s15durationsOverall = cell(1);
s25durationsOverall = cell(1);

s21durationTotal = 0;

for i=1:size(cellA)
    if(strcmp(cellA(i,1), 's1') == 1 && strcmp(cellA(i,2), 'true'))
        s1durationsTrue(1,1) = cellA(i,1);
        s1durationsTrueTotal(1,2) = 0;
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsTrue(1, size(s1durationsTrue)+1) = cellA(i,j);
                s1durationsTrueTotal(1,1) = s1durationsTrueTotal(1,1) + cellA{i,j};
                s1durationsTrueTotal(1,2) = size(s1durationsTrue, 2);
            end;
        end;
        
        s1TrueMFD = s1durationsTrueTotal(1,1) / s1durationsTrueTotal(1,2);
        s1SDTrueMFD = std(cell2mat(s1durationsTrue(2:end)));
    end;
    if(strcmp(cellA(i,1), 's1') == 1 && strcmp(cellA(i,2), 'false'))
        s1durationsFalse(1,1) = cellA(i,1);
        s1durationsFalseTotal(1,2) = 0;
        for j=5:3:size(cellA, 2)
            disp(cellA(i,j));
            if(isnan(cellA{i,j}) == 1)
                break;
            end;
            if(isnan(cellA{i,j}) == 0)
                s1durationsFalse(1, size(s1durationsFalse)+1) = cellA(i,j);
                s1durationsFalseTotal(1,1) = s1durationsFalseTotal(1,1) + cellA{i,j};
                s1durationsFalseTotal(1,2) = size(s1durationsFalse, 2);
            end;
        end;
        
        s1FalseMFD = s1durationsFalseTotal(1,1) / s1durationsFalseTotal(1,2);
        s1SDFalseMFD = std(cell2mat(s1durationsFalse(2:end)));
    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'true'))
        s11durationsTrue(1,1) = cellA(i,1);
        s11durationsTrueTotal(1,2) = 0;
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsTrue(1, size(s11durationsTrue)+1) = cellA(i,k);
                s11durationsTrueTotal(1,1) = s11durationsTrueTotal(1,1) + cellA{i,k};
                s11durationsTrueTotal(1,2) = size(s1durationsFalse, 2);
            end;
        end;

        s11TrueMFD = s11durationsTrueTotal(1,1) / s11durationsTrueTotal(1,2);
        s11SDTrueMFD = std(cell2mat(s11durationsTrue(2:end)));

    end;
    if(strcmp(cellA(i,1), 's11') == 1 && strcmp(cellA(i,2), 'false'))
        s11durationsFalse(1,1) = cellA(i,1);
        s11durationsFalseTotal(1,2) = 0;
        for k=5:3:size(cellA, 2)
            disp(cellA(i,k));
            if(isnan(cellA{i,k}) == 1)
                break;
            end;
            if(isnan(cellA{i,k}) == 0)
                s11durationsFalse(1, size(s11durationsFalse)+1) = cellA(i,k);
                s11durationsFalseTotal(1,1) = s11durationsFalseTotal(1,1) + cellA{i,k};
                s11durationsFalseTotal(1,2) = size(s11durationsFalse, 2);
            end;
        end;
        
        s11FalseMFD = s11durationsFalseTotal(1,1) / s11durationsFalseTotal(1,2);
        s11SDFalseMFD = std(cell2mat(s11durationsFalse(2:end)));
    end;
    if(strcmp(cellA(i,1), 's21') == 1 && strcmp(cellA(i,2), 'true'))
        s21durationsTrue(1,1) = cellA(i,1);
        s21durationsTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s21durationsTrue(1, size(s21durationsTrue)+1) = cellA(i,l);
                s21durationsTrueTotal(1,1) = s21durationsTrueTotal(1,1) + cellA{i,l};
                s21durationsTrueTotal(1,2) = size(s21durationsTrue, 2);
            end;
        end;
        
        s21TrueMFD = s21durationsTrueTotal(1,1) / s21durationsTrueTotal(1,2);
        s21SDTrueMFD = std(cell2mat(s21durationsTrue(2:end)));
    end;
    if(strcmp(cellA(i,1), 's21') == 1 && strcmp(cellA(i,2), 'false'))
        s21durationsFalse(1,1) = cellA(i,1);
        s21durationsFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s21durationsFalse(1, size(s21durationsFalse)+1) = cellA(i,l);
                s21durationsFalseTotal(1,1) = s21durationsFalseTotal(1,1) + cellA{i,l};
                s21durationsFalseTotal(1,2) = size(s21durationsFalse, 2);
            end;
        end;
        
        s21FalseMFD = s21durationsFalseTotal(1,1) / s21durationsFalseTotal(1,2);
        s21SDFalseMFD = std(cell2mat(s21durationsFalse(2:end)));
    end;
    if(strcmp(cellA(i,1), 's5') == 1 && strcmp(cellA(i,2), 'false'))
        s5durationsFalse(1,1) = cellA(i,1);
        s5durationsFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s5durationsFalse(1, size(s5durationsFalse)+1) = cellA(i,l);
                s5durationsFalseTotal(1,1) = s5durationsFalseTotal(1,1) + cellA{i,l};
                s5durationsFalseTotal(1,2) = size(s5durationsFalse, 2);
            end;
        end;
        
        s5FalseMFD = s5durationsFalseTotal(1,1) / s5durationsFalseTotal(1,2);
        s5SDFalseMFD = std(cell2mat(s5durationsFalse(2:end)));
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
        s5SDTrueMFD = std(cell2mat(s5durationsTrue(2:end)));
    end;
    
    if(strcmp(cellA(i,1), 's15') == 1 && strcmp(cellA(i,2), 'false'))
        s15durationsFalse(1,1) = cellA(i,1);
        s15durationsFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s15durationsFalse(1, size(s15durationsFalse)+1) = cellA(i,l);
                s15durationsFalseTotal(1,1) = s15durationsFalseTotal(1,1) + cellA{i,l};
                s15durationsFalseTotal(1,2) = size(s15durationsFalse, 2);
            end;
        end;
        
        s15FalseMFD = s15durationsFalseTotal(1,1) / s15durationsFalseTotal(1,2);
        s15SDFalseMFD = std(cell2mat(s15durationsFalse(2:end)));
    end;
    
    if(strcmp(cellA(i,1), 's15') == 1 && strcmp(cellA(i,2), 'true'))
        s15durationsTrue(1,1) = cellA(i,1);
        s15durationsTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s15durationsTrue(1, size(s15durationsTrue)+1) = cellA(i,l);
                s15durationsTrueTotal(1,1) = s15durationsTrueTotal(1,1) + cellA{i,l};
                s15durationsTrueTotal(1,2) = size(s15durationsTrue, 2);
            end;
        end;
        
        s15TrueMFD = s15durationsTrueTotal(1,1) / s15durationsTrueTotal(1,2);
        s15SDTrueMFD = std(cell2mat(s15durationsTrue(2:end)));
    end;
    
    if(strcmp(cellA(i,1), 's25') == 1 && strcmp(cellA(i,2), 'false'))
        s25durationsFalse(1,1) = cellA(i,1);
        s25durationsFalseTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s25durationsFalse(1, size(s25durationsFalse)+1) = cellA(i,l);
                s25durationsFalseTotal(1,1) = s25durationsFalseTotal(1,1) + cellA{i,l};
                s25durationsFalseTotal(1,2) = size(s25durationsFalse, 2);
            end;
        end;
        
        s25FalseMFD = s25durationsFalseTotal(1,1) / s25durationsFalseTotal(1,2);
        s25SDFalseMFD = std(cell2mat(s25durationsFalse(2:end)));
    end;
    
    if(strcmp(cellA(i,1), 's25') == 1 && strcmp(cellA(i,2), 'true'))
        s25durationsTrue(1,1) = cellA(i,1);
        s25durationsTrueTotal(1,2) = 0;
        for l=5:3:size(cellA, 2)
            disp(cellA(i,l));
            if(isnan(cellA{i,l}) == 1)
                break;
            end;
            if(isnan(cellA{i,l}) == 0)
                s25durationsTrue(1, size(s25durationsTrue)+1) = cellA(i,l);
                s25durationsTrueTotal(1,1) = s25durationsTrueTotal(1,1) + cellA{i,l};
                s25durationsTrueTotal(1,2) = size(s25durationsTrue, 2);
            end;
        end;
        
        s25TrueMFD = s25durationsTrueTotal(1,1) / s25durationsTrueTotal(1,2);
        s25SDTrueMFD = std(cell2mat(s25durationsTrue(2:end)));
    end;
end;

s1durationsOverall = cat(2, s1durationsTrue(2:end), s1durationsFalse(2:end));
s1durationsOverallTotal = sum(cell2mat(s1durationsOverall(2:end)));
s1OverallMFD = s1durationsOverallTotal / size(s1durationsOverall, 2);
s1SDOverallMFD = std(cell2mat(s1durationsOverall));

s11durationsOverall = cat(2, s11durationsTrue(2:end), s11durationsFalse(2:end));
s11durationsOverallTotal = sum(cell2mat(s11durationsOverall(2:end)));
s11OverallMFD = s11durationsOverallTotal / size(s11durationsOverall, 2);
s11SDOverallMFD = std(cell2mat(s11durationsOverall));

s21durationsOverall = cat(2, s21durationsTrue(2:end), s21durationsFalse(2:end));
s21durationsOverallTotal = sum(cell2mat(s21durationsOverall(2:end)));
s21OverallMFD = s21durationsOverallTotal / size(s21durationsOverall, 2);
s21SDOverallMFD = std(cell2mat(s21durationsOverall));

s5durationsOverall = cat(2, s5durationsTrue(2:end), s5durationsFalse(2:end));
s5durationsOverallTotal = sum(cell2mat(s5durationsOverall(2:end)));
s5OverallMFD = s5durationsOverallTotal / size(s5durationsOverall, 2);
s5SDOverallMFD = std(cell2mat(s5durationsOverall));

s15durationsOverall = cat(2, s15durationsTrue(2:end), s15durationsFalse(2:end));
s15durationsOverallTotal = sum(cell2mat(s15durationsOverall(2:end)));
s15OverallMFD = s15durationsOverallTotal / size(s15durationsOverall, 2);
s15SDOverallMFD = std(cell2mat(s15durationsOverall));

s25durationsOverall = cat(2, s25durationsTrue(2:end), s25durationsFalse(2:end));
s25durationsOverallTotal = sum(cell2mat(s25durationsOverall(2:end)));
s25OverallMFD = s25durationsOverallTotal / size(s25durationsOverall, 2);
s25SDOverallMFD = std(cell2mat(s25durationsOverall));

subject_id =   {'s1 ';'s11';'s21';'s5 ';'s15';'s25'};
MFD_true = [s1TrueMFD; s11TrueMFD; s21TrueMFD; s5TrueMFD; s15TrueMFD; s25TrueMFD];
MFD_false = [s1FalseMFD; s11FalseMFD; s21FalseMFD; s5FalseMFD; s15FalseMFD; s25FalseMFD];
MFD_overall = [s1OverallMFD; s11OverallMFD; s21OverallMFD; s5OverallMFD; s15OverallMFD; s25OverallMFD];
MFD_SD_true = [s1SDTrueMFD; s11SDTrueMFD; s21SDTrueMFD; s5SDTrueMFD; s15SDTrueMFD; s25SDTrueMFD];
MFD_SD_false = [s1SDFalseMFD; s11SDFalseMFD; s21SDFalseMFD; s5SDFalseMFD; s15SDFalseMFD; s25SDFalseMFD];
MFD_overall_SD = [s1SDOverallMFD; s11SDOverallMFD; s21SDOverallMFD; s5SDOverallMFD; s15SDOverallMFD; s25SDOverallMFD];
writeableTable = table(subject_id, MFD_true, MFD_false, MFD_overall, MFD_SD_true, MFD_SD_false, MFD_overall_SD);
writetable(writeableTable, 'MFDDATA.csv');
