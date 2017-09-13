function [ ] = hw4domsim( imagenames, img133, img159, img248, img271, img279, img316, img318, img325, img347, img556, img565, img866 )
%HW4DOMSIM Summary of this function goes here
%   Detailed explanation goes here

fprintf('Computing dominant colors 0%%... ');
img133_c = domcolor(img133);
img159_c = domcolor(img159);
img248_c = domcolor(img248);
fprintf('25%%... ');
img271_c = domcolor(img271);
img279_c = domcolor(img279);
img316_c = domcolor(img316);
fprintf('50%%... ');
img318_c = domcolor(img318);
img325_c = domcolor(img325);
img347_c = domcolor(img347);
fprintf('75%%... ');
img556_c = domcolor(img556);
img565_c = domcolor(img565);
img866_c = domcolor(img866);

fprintf('100%%!\n');

%% Compute the distance using dominant colors

colors = [img133_c; img159_c; img248_c; img271_c; img279_c; img316_c; img318_c; img325_c; img347_c; img556_c; img565_c; img866_c];

f = fopen('similarities.html', 'a');
fprintf(f, '<h3>Dominant color similarities</h3>\n');
fprintf(f, '<table>\n');
for i = 1:size(colors,1)/5
	fprintf(f, '<tr>\n');
	fprintf(f, '<td align="center">\n');
    fprintf(f, '<img src="%s" style="height: 86px; width: 128px;" /><br />%s\n', imagenames(i, :), imagenames(i, :));
    fprintf(f, '</td>\n');
    distances = zeros(1, size(colors, 1)/5);
    for j = 1:size(colors,1)/5     
        distances(j) = domcolordist(colors((i-1)*5+1:(i-1)*5+5, :), colors((j-1)*5+1:(j-1)*5+5, :));
    end
    [dists index] = sort(distances);
    for ind = 1:size(dists, 2)
        if index(ind) ~= i
			fprintf(f, '<td align="center">\n');
			fprintf(f, '<img src="%s" style="height: 86px; width: 128px;" /><br />%3.3f\n', imagenames(index(ind), :), dists(ind));
			fprintf(f, '</td>\n');
        end
    end
	fprintf(f, '</tr>\n');
end
fprintf(f, '</table>\n');

fclose(f);
end
