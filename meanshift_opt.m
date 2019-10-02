function [labels,peaks] = meanshift_opt(data,r)


NumColumn = size(data,2);

data = data(:,1:NumColumn);

global labels ; 
labels = 1:NumColumn;
t = 0.001;
maxDist = Inf;

PeaksAfterMerge = data;

while maxDist >= t
    peaks= findpeak_opt(data,PeaksAfterMerge,r);

    for i = 1:min(size(peaks,2),size(PeaksAfterMerge,2))
        distance = pdist2(peaks(:,i)',PeaksAfterMerge(:,i)');
    end
    maxDist = max(distance);

    PeaksAfterMerge = merge(peaks,r);    
    
end
end

