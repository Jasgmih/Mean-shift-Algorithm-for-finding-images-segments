function [peak,cpts] = findpeak_opt(data,mean_matrix,r)

global labels;

%% first speedup
label = 1:size(mean_matrix,2); % change the name of label
k = 0;
for i = 1:size(mean_matrix,2)
    if label(i) > k
        ind = find(label > label(i));
        dis = pdist2(mean_matrix(:,i)',mean_matrix(:,ind)');
        index = find(dis <= r);
        label(i) = k+1;
        label(ind(index)) = label(i);
        k = k+1;
    end
end

for i = 1:size(mean_matrix,2)
    labels (labels == i) = label(i);
end

k = 1;
for i = 1:size(mean_matrix,2)
    if label(i) >= k
        inde(k) = i;
        k = k+1;
    end
    
end
mean_matrix = mean_matrix(:,inde);


%% calculate the peaks
peak= findpeak(data,mean_matrix,r);

%% second speedup
% cpts = zeros(size(peak,2),size(data,2));
c = 4;
for j = 1:size(peak,2)
    delta = (peak(:,j)-mean_matrix(:,j))/c;
    matr = [mean_matrix(:,j)+delta,mean_matrix(:,j)+2*delta,mean_matrix(:,j)+3*delta];
    dis = pdist2(data',matr')';
    mindis = min(dis);
    Index = find(mindis <= r/c);
%     cpts(i,Index) = 1;
    labels(Index) = j;
end

peak = deletePeak(peak);

end

