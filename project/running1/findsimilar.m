function [ sims ] = findsimilar( img )
% Finds the most similar images to the given image.

similarities = [];

% should load this elsewhere for speed
load db/features

[csd128 edge] = calcfeatures(img);

% calculate distances
for i = 1:size(names, 1)
    %a = pdist([csd32; csd32hist(i, :)]);
    b = pdist([csd128; csd128hist(i, :)]);
    %c = domcolordist(dom, domcolors((i*5-4):i*5, :));
    d = ehddist(edge, edges(i, :), 1, 1, 5);
    %similarities = [similarities; a b c d];
    similarities = [similarities; b d];
end

% normalize the columns
for i = 1:size(similarities, 2)
    m = mean(similarities(:, i));
    s = std(similarities(:, i));
    similarities(:, i) = (similarities(:, i) - m) ./ s;   
end

% give the ehd slightly less weight than csd
similarities(:, 2) = 0.8*similarities(:, 2);

% add the similarities together
sims = sum(similarities');

% first show the target image
figure;
subplot(5,5,1);
imshow(img);

% next plot the results in the correct order
[val I] = sort(sims);
%figure;
for i = 1:20
    f = imread(['db/' names(I(i), :)]);
    subplot(5,5,i+1);
    imshow(f);
end

end
