clc;
clear;
close all;

path = '1.jpg';
img = imread(path);

figure('name', '原图')
imshow(img);

% 膨胀：这里对灰度图腐蚀，其他类型图像同理
gray = rgb2gray(img);
figure('name', '灰度图')
imshow(gray);

[m,n] = size(gray);
pz = gray; % 提前预分配，优化速度
for i = 2 : m-1
    for j = 2 : n-1
        % con是选了3*3大小的卷积区域，然后腐蚀
        con = gray(i-1:i+1, j-1:j+1);
        % 一次max求每列最大，二次是整体最大
        pz(i,j) = max(max(con));
        
    end
end

figure('name', 'fs');
imshow(pz);