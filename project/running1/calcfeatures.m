function [ hist128 edge ] = calcfeatures( img )
% Computes the features of the given image.

%[hmmd, map] = rgb2quanthmmd(img, 32);
%hist32 = colordescriptor(hmmd, map);

[hmmd, map] = rgb2quanthmmd(img, 128);
hist128 = colordescriptor(hmmd, map);

% downscale the img by 2 for calculating csd since it only slightly affects
% the results and is much faster.
%[x y z] = size(img);
%dom = domcolor(img(1:2:x, 1:2:y, :));

edge = ehd(img, 0.10);

end
