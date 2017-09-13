%% Load the images

imagenames = ['133.jpg'; '159.jpg'; '248.jpg'; '271.jpg'; '279.jpg';
    '316.jpg'; '318.jpg'; '325.jpg'; '347.jpg'; '556.jpg'; '565.jpg';
    '866.jpg'];

img133 = imread('133.jpg');
img159 = imread('159.jpg');
img248 = imread('248.jpg');
img271 = imread('271.jpg');
img279 = imread('279.jpg');
img316 = imread('316.jpg');
img318 = imread('318.jpg');
img325 = imread('325.jpg');
img347 = imread('347.jpg');
img556 = imread('556.jpg');
img565 = imread('565.jpg');
img866 = imread('866.jpg');

fprintf('Images loaded!\n');

%% Clear the output file
f = fopen('similarities.html', 'w');
fclose(f);

%% Calculate 32 bin similarities
hw4hmmdsim(imagenames, img133, img159, img248, img271, img279, img316, img318, img325, img347, img556, img565, img866, 32);

%% Calculate 128 bin similarities
hw4hmmdsim(imagenames, img133, img159, img248, img271, img279, img316, img318, img325, img347, img556, img565, img866, 128);

%% Compute the dominant color similarities
hw4domsim(imagenames, img133, img159, img248, img271, img279, img316, img318, img325, img347, img556, img565, img866);
