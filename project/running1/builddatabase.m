function [  ] = builddatabase(  )
% Generates a database of features based on the images in the db/ folder.

d = dir('db/*.jpg');
names = [];

csd128hist = [];
edges = [];

for i = 1:size(d, 1)
    fprintf('Extracting features for %s... ', d(i).name);
    names = strvcat(names, d(i).name);
    img = imread(['db/' d(i).name]);

    tic;
    [hist128 edge] = calcfeatures(img);
    csd128hist = [csd128hist; hist128];
    edges = [edges; edge];
    toc;
end

save db/features names csd128hist edges

end
