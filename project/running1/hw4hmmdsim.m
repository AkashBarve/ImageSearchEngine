function [ ] = hw4hmmdsim( imagenames, img133, img159, img248, img271, img279, img316, img318, img325, img347, img556, img565, img866, bins )
%DOHW4HMMD Summary of this function goes here
%   Detailed explanation goes here

%% Convert images to HMMD

% the map is the same for all images
[hmmd133, map] = rgb2quanthmmd(img133, bins);
hmmd159 = rgb2quanthmmd(img159, bins);
hmmd248 = rgb2quanthmmd(img248, bins);
hmmd271 = rgb2quanthmmd(img271, bins);
hmmd279 = rgb2quanthmmd(img279, bins);
hmmd316 = rgb2quanthmmd(img316, bins);
hmmd318 = rgb2quanthmmd(img318, bins);
hmmd325 = rgb2quanthmmd(img325, bins);
hmmd347 = rgb2quanthmmd(img347, bins);
hmmd556 = rgb2quanthmmd(img556, bins);
hmmd565 = rgb2quanthmmd(img565, bins);
hmmd866 = rgb2quanthmmd(img866, bins);

fprintf('Converted images to %d bin HMMD!\n', bins);

%% Compute the color descriptor histograms

hist133 = colordescriptor(hmmd133, map);
hist159 = colordescriptor(hmmd159, map);
hist248 = colordescriptor(hmmd248, map);
hist271 = colordescriptor(hmmd271, map);
hist279 = colordescriptor(hmmd279, map);
hist316 = colordescriptor(hmmd316, map);
hist318 = colordescriptor(hmmd318, map);
hist325 = colordescriptor(hmmd325, map);
hist347 = colordescriptor(hmmd347, map);
hist556 = colordescriptor(hmmd556, map);
hist565 = colordescriptor(hmmd565, map);
hist866 = colordescriptor(hmmd866, map);

fprintf('%d bin histograms found!\n', bins);

%% Compute distances

distances = squareform(pdist([hist133; hist159; hist248; hist271; hist279;
    hist316; hist318; hist325; hist347; hist556; hist565; hist866]));

fprintf('Found the distances!\n');

%% Print the results

f = fopen('similarities.html', 'a');
fprintf(f, '<h3>%d bin similarities</h3>\n', bins);
fprintf(f, '<table>\n');
for i = 1:size(distances, 1)
	fprintf(f, '<tr>\n');
	fprintf(f, '<td align="center">\n');
	fprintf(f, '<img src="%s" style="height: 86px; width: 128px;" /><br />%s\n', imagenames(i, :), imagenames(i, :));
	fprintf(f, '</td>\n');
	row = distances(i, :);
	[dists index] = sort(row);
	for ind = 1:size(dists, 2)
		if index(ind) ~= i
			fprintf(f, '<td align="center">\n');
			fprintf(f, '<img src="%s" style="height: 86px; width: 128px;" /><br />%1.3f\n', imagenames(index(ind), :), dists(ind)/dists(size(distances, 1)));
			fprintf(f, '</td>\n');
		end
	end
	fprintf(f, '</tr>\n');
end
fprintf(f, '</table>\n');
fclose(f);

end
