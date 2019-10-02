% function peak= findpeak(data,idx,r)
% 
% distance = pdist2(data',data(:,idx)');
% point_index = find(distance <= r);
% newData = data(:,point_index);
% peak =mean(newData,2);
% 
% end

function peak= findpeak(data,mean_matrix,r)

NumColumn = size(data,2);
distance = pdist2(data',mean_matrix');
[row column] = find(distance <= r);


k = 1;
j = 1;
for i = 1:size(row)
    if column(i) == k
        new_point_index(j) = row(i);
        j=j+1;
    else
        newData = data(:,new_point_index);
        peak(:,k) =mean(newData,2);
        new_point_index = [];
        new_point_index(1) = row(i);
        k= k+1;
        j = 2;
    end
end
newData = data(:,new_point_index);
peak(:,k) =mean(newData,2);



end



