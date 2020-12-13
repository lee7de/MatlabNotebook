clc;
clear;
close all;

img = imread('1.jpg');

figure('name', '原图');
imshow(img);

gray = rgb2gray(img);
[m, n] = size(gray);

% 预设好矩阵大小
x_sobel = double(gray);
y_sobel = double(gray);
img_sobel = gray;
for i = 2:m-1
    for j = 2:n-1
        % 分别用x、y方向的算子检测边缘，然后合成
        % x_con = [-1,0,1; -2,0,2; -1,0,1];
        % y_con = [-1,-2,-1; 0,0,0; 1,2,1];
        x_sobel(i,j) = (-1*gray(i-1, j-1) + gray(i-1, j+1) ... % 三个省略号表示接着下一行
            -2*gray(i, j-1) + 2*gray(i, j+1) ...
            -1*gray(i+1, j-1) + gray(i+1, j+1));
        
        y_sobel(i, j) = (-1*gray(i-1, j-1) - 2*gray(i-1, j) - gray(i-1, j+1) ...
            +gray(i+1, j-1) + 2*gray(i+1, j) + gray(i+1, j+1));
    end
end
img_sobel = sqrt(x_sobel.^2 + y_sobel.^2);
figure('name', 'img_sobel');
imshow(uint8(img_sobel));

