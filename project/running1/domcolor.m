function [ colors ] = domcolor( Img )
%DOMCOLOR Summary of this function goes here
%   Detailed explanation goes here

NumDomColors = 5;

[Rows Cols Ch] = size(Img);
Img2 = double (reshape (Img, Rows * Cols, Ch));

[center,U,obj_fcn] = fcm(Img2, NumDomColors, [2.0 20 1e-5 0]);
center = uint8(center);

colors = zeros(5, 4);
for i = 1:5
    colors(i, 2:4) = center(i, :);
end

maxU = max(U);
for i=1:NumDomColors
    % Find the data points with highest grade of membership in cluster 1
    index = find(U(i,:) == maxU);
    colors(i, 1) = length(index)/(Rows*Cols);
    for j=1:length(index)
       SegImg (index(j), :) = center(i,:);
    end
end


%j=1;
%for k=1:NumDomColors
%    for i=1:uint8(colors(k 1)*100)
%        DomColorMap (j, 1,1:3) = uint8(center(k,:));
%        j=j+1;
%    end
%end
%subplot (1,3,1); imshow (Img);
%subplot (1,3,2); imagesc (DomColorMap);
%Img2Display =  (reshape (SegImg, Rows, Cols, Ch));
%subplot (1,3,3); imshow (Img2Display);

end
