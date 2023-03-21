clc;
clear;
close all;

img = imread('C:\Users\lider\OneDrive - stu.xaut.edu.cn\桌面\111.jpg');

gray = rgb2gray(img);
figure('name', 'gray');
imshow(gray);

[m, n] = size(gray);

avg_filter = gray;
for i = 2:m-1
    for j = 2:n-1
        
        filter_con = gray(i-1:i+1, j-1:j+1);
        k = sum(sum(filter_con))/9;
        avg_filter(i, j) = k;
    
    end
end

figure('name', 'avg_filter');
imshow(avg_filter);