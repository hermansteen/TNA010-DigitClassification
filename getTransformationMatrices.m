function [TrainMatrix, TestMatrix] = getTransformationMatrices(train, test)
% Function that returns the transformation matrices for all the digits in
% the trainingdata and testdata

[rows, cols, depth] = size(train);
[rows, cols, testDepth] = size(test);

TrainMatrix = zeros(256, 6, depth);
TestMatrix = zeros(256, 6, testDepth);

for i = 1:depth
    TrainMatrix(:,:,i) = calcTransformMatrix(train(:,:,i));
end

for i = 1:testDepth
    TestMatrix(:,:,i) = calcTransformMatrix(test(:,:,i));
end
end