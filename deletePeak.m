function [peaks] = deletePeak(mean_matrix) 
% delete repeat peaks

global labels;
delete = [];
 for i = 1:size(mean_matrix,2)
    ifempty = find(labels == i);
    if isempty(ifempty)
        delete = [delete,i];
    end
 end
 
 mean_matrix(:,delete) = [];
 peaks = mean_matrix;
 
 for i = 1:size(delete,2)
     labels(labels > delete(i)) = labels(labels > delete(i)) -1;
     delete(i+1:end) = delete(i+1:end) -1;
 end
 
end

