function [segmIm, labels, peaks] = imSegment(im, r, feature_type);
%IMSEGMENT image segmentation.
%   Description of its functionaility is given in the assignment
%
%   Parameters: 
%       im: RGB image
%       r: raduis of clusters
%       feature_type: the feature type you use in your implementation as
%       suggested in the assignment description: '3D' or '5D'
%   Output:
%       SegmIm: segmentated image where its pixels' values are colored
%       based on the labels
%		Labels: labels for each data point
%		Peaks:  peaks associated with data points

LAB = rgb2lab(im);
L = LAB(:,:,1);
A = LAB(:,:,2);
B = LAB(:,:,3);
maxLAB = max(max(max(LAB)))/10;
% minLAB = min(min(min(LAB)))/10;
minLAB = 0.;

l = L(:)';
a = A(:)';
b = B(:)';

if feature_type == '3D'
    data = [l;a;b];
end

if feature_type == '5D'
    Y = repmat(1:size(A,1),1,size(A,2));
    X = repmat(1:size(A,2),1,size(A,1));
    X = sort(X);
    X = (X-min(X)).*(maxLAB-minLAB)./(max(X)-min(X))+minLAB;
    Y = (Y-min(Y)).*(maxLAB-minLAB)./(max(Y)-min(Y))+minLAB;
    data = [l;a;b;X;Y];
end

[labels peaks] = meanshift_opt(data,r);
disp(max(labels));

figure(1),imshow(im);

figure(2),plot3dclusters(data, labels, peaks);

segmIm = vec2mat(labels,size(A,1))';
figure(3),imagesc(segmIm);


f = @() meanshift(data,r);
timeit(f)
 
end

