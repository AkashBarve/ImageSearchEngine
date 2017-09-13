function [ image, table ] = rgb2quanthmmd( rgbimage, numbins )
%RGB2QUANTHMMD Summary of this function goes here
%   Detailed explanation goes here

if numbins == 32
    table = hmmdquanttable32();
    image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
elseif numbins == 128
    table = hmmdquanttable128();
    image = rgb2ind(rgb2hmmd(rgbimage)/255, table/255);
else
    error('numbins must be either 32 or 128');
end

end
