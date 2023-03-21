clc;
clear;
close all;

path = '1.jpg';
img = imread(path);

figure('name', '原图')
imshow(img);

% ----------对--灰--度--图--腐--蚀---------
% gray = rgb2gray(img);
% figure('name', '灰度图')
% imshow(gray);
% 
% [m,n] = size(gray);
% fs = gray; % 提前预分配，优化速度
% for i = 2 : m-1
%     for j = 2 : n-1
%         % con是选了3*3大小的卷积区域，然后腐蚀
%         con = gray(i-1:i+1, j-1:j+1);
%         fs(i,j) = min(min(con));
%         
%     end
% end
% 
% figure('name', 'fs');
% imshow(fs);

%------------对--彩--色--图-------------
r = img(:, :, 1);
g = img(:, :, 2);
b = img(:, :, 3);

[m, n] = size(r);

r_out = r;
for i = 2 : m-1
    for j = 2 : n-1
        con = r(i-1:i+1, j-1:j+1);
        r_out(i,j) = min(min(con));
    end
end

g_out = g;
for i = 2 : m-1
    for j = 2 : n-1
        con = g(i-1:i+1, j-1:j+1);
        g_out(i,j) = min(min(con));
    end
end

b_out = b;
for i = 2 : m-1
    for j = 2 : n-1
        con = b(i-1:i+1, j-1:j+1);
        b_out(i,j) = min(min(con));
    end
end

out = cat(3, r_out, g_out, b_out);

figure('name', 'fs_color');
imshow(out);
