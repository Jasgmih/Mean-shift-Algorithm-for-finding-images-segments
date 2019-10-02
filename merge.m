function [newPeaks] = merge(peaks,r)

global labels;

NumColumn = size(peaks,2);
newlabels = 1:NumColumn;
delete = [];

for i = 2:NumColumn

   k = 0;
   
   for j = 1:i-1
%        if newlabels(j) > k
           if pdist2(peaks(:,j)',peaks(:,i)') <= r/2
              
               delete = [delete ,i];
               labels(labels == newlabels(i)) = labels(j);
               labels(labels > newlabels(i)) = labels(labels > newlabels(i)) -1;
               newlabels(i) = newlabels(j);
               
               if i < NumColumn
                newlabels(i+1:end) = newlabels(i+1:end)-1;
               end
              
               break;
           else
               k = newlabels(j);        
           end
%        end 
   end
   
   
   
end

peaks(:,delete)= [];
newPeaks = peaks;




% for i = 2:NumColumn
%    
%    k = 0;
%    newP = true;
%    
%    labels(i) = max(labels(1:i-1))+1;
%    for j = 1:i-1
%        if labels(j) > k
%            if pdist2(peaks(:,j)',peaks(:,i)') <= r/2
%                labels(i) = labels(j);
%                newP = false;
%                break;
%            else
%                k = labels(j);        
%            end
%        end 
%    end
%    
%    if newP
%         newPeaks(:,k+1) = peaks(:,i);
%    end
%    
% end

% k = 0;
% for i=1:NumColumn
%     if labels(i) >k
%         newPeaks(:,k+1) = peaks(:,i);
%         k = labels(i);
%     end
% end





end

