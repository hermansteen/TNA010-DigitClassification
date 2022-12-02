function [TrainMatrix, TestMatrix] = getTransformationMatrices(train, test)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
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