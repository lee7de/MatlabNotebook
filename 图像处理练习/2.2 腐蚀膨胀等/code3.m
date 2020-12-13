clc;
clear;
close all;

path = '1.jpg';
img = imread(path);

figure('name', '原图')
imshow(img);

% ----开--运--算------
gray = rgb2gray(img);
figure('name', '灰度图')
imshow(gray);

% 先腐蚀
[m,n] = size(gray);

fs = gray; 
for i = 2 : m-1
    for j = 2 : n-1
        con = gray(i-1:i+1, j-1:j+1);
        fs(i,j) = min(min(con));
    end
end

% 后膨胀

pz = fs;
for i = 2 : m-1
    for j = 2 : n-1
        con = fs(i-1:i+1, j-1:j+1);
        pz(i,j) = max(max(con));
    end
end

open_img = pz;
figure('name', 'open_img');
imshow(open_img);

% ------顶--帽:找出多膨胀的那一块亮度--------
% 原图-开运算的图
top_hat = gray - open_img;
figure('name', 'top_hat');
imshow(top_hat);

% 备注： 由上面代码变换顺序做一下微调整，便可以得到闭运算、黑帽

