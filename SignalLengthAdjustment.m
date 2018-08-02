%Reshaping the length of the signal to the average lengths for that bin,
%across trials

%Sample
for i=1:size(SLFP,1)
    for j=1:size(SLFP,2)
        Slengths(i,j)=length(SLFP{i,j});
    end
end
Slengths_m=ceil(mean(Slengths,1));

for i=8:size(SLFP,1)
    for j=1:size(SLFP,2)
        SLFP_RS{i,j}=resample(SLFP{i,j},Slengths_m(1,j),length(SLFP{i,j}));
    end
end

%Choice
for i=1:size(CLFP,1)
    for j=1:size(CLFP,2)
        Clengths(i,j)=length(CLFP{i,j});
    end
end
Clengths_m=ceil(mean(Clengths,1));

for i=1:size(CLFP,1)
    for j=1:size(CLFP,2)
        CLFP_RS{i,j}=resample(CLFP{i,j},Clengths_m(1,j),length(CLFP{i,j}));
    end
end