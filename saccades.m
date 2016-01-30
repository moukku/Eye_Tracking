clear;
fixt = readtable('train_fixations.csv', 'Delimiter', ',', 'ReadVariableNames', false);
numsubjects = 34;

% Make array out of numerical values
fixa = table2array(fixt(:,3:end));

% Initialize NaN-filled matrix for saccades (to avoid misinterpreting 0) 
sf = size(fixa);
saca = NaN([sf(1), ((3+sf(2)) / 6)-1], 'like', fixa);

% Euclidean distance function for saccade amplitudes
edist = @(x1,y1, x2,y2) sqrt((x2-x1)^2 + (y2-y1)^2);

% Compute saccade amplitudes
for i = 1:sf(1)
    for j = 1:6:(sf(2)-3)
        saca(i,(j+5)/6) = edist(fixa(i, j), fixa(i,j+1), fixa(i,j+3), fixa(i,j+4));
    end
end

% Compute numbers of saccades by finding first NaN
for i = 1:size(saca,1)
    nans = find(isnan(saca(i,:)));
    if(isempty(nans))
        numsaccades(i) = size(saca,1);
    else
        nanindex = min(nans);
        numsaccades(i) = nanindex-1;
    end
end
numsaccades = numsaccades';

% Now we can get rid of NaN
saca(isnan(saca))=0;

%Sum all saccades in a recording
saccsum = sum(saca,2);

%Empty matrix for computed values
saccvalues = zeros(numsubjects,6);

%True MSA
for i = 1:numsubjects
    %Find rows matching subject
    slogical = strcmp(fixt.Var1,strcat('s',int2str(i)));
    %Find rows with 'true'
    tlogical = strcmp(fixt.Var2, 'true');
    %Combine
	[index,~] = find(slogical & tlogical);
    %Mean
    saccvalues(i,1) = sum(saccsum(index));
    saccvalues(i,1) = saccvalues(i,1)/sum(numsaccades(index));
    %Standard deviation
    saccvalues(i,2) = sqrt(sum(saccsum(index)-saccvalues(i,1))/sum(numsaccades(index)));
end

%False MSA
%Done similarly as above
for i = 1:numsubjects
    slogical = strcmp(fixt.Var1,strcat('s',int2str(i)));
    tlogical = strcmp(fixt.Var2, 'false');
	[index,~] = find(slogical & tlogical);
    saccvalues(i,3) = sum(saccsum(index));
    saccvalues(i,3) = saccvalues(i,3)/sum(numsaccades(index));
     saccvalues(i,4) = sqrt(sum(saccsum(index)-saccvalues(i,3))/sum(numsaccades(index)));
end

%Overall MSA
for i = 1:numsubjects
    slogical = strcmp(fixt.Var1,strcat('s',int2str(i)));
    [sindex,~] = find(slogical);
    saccvalues(i,5) = sum(saccsum(sindex));
    saccvalues(i,5) = saccvalues(i,5)/sum(numsaccades(sindex));
    saccvalues(i,6) = sqrt(sum(saccsum(sindex)-saccvalues(i,5))/sum(numsaccades(sindex)));
end


