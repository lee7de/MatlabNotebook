clc
clear
close all;

% 读图
img = imread('1.jpg');
figure('name', 'original image');
imshow(img);

% figure(12);
% imshow(histeq(img, 256));

%彩图处理
r = img(:, :, 1);
g = img(:, :, 2);
b = img(:, :, 3);

% 获得图像的尺寸大小 
[R, C]=size(r);

% ----分--图--层--处--理------
% ----r----
r_out = r;
s = zeros(1,256);
for i = 1:R
    for j=1:C
        s(1, r_out(i,j)+1)=s(1, r_out(i,j)+1)+1;
    end
end

%算概率
p = zeros(1,256);
for i = 1:256
    p(i)=s(i)/(R*C*1.0);
end

%累计直方图
c=zeros(1,256);
c(1)=p(1);
for i=2:256
    c(i)=c(i-1)+p(i);
end
%取整
% c = uint8(255.*c+0.5);
c= round(255.*c);
%  均衡
for i=1:R
    for j=1:C
        r_out(i,j)=c(r_out(i,j)+1);
    end
end

% -----g-------
g_out = g;
s=zeros(1,256);
for i=1:R
    for j=1:C
        s(1, g_out(i,j)+1) = s(1, g_out(i,j)+1)+1;
    end
end

%算概率
p=zeros(1,256);
for i=1:256
    p(i)=s(i)/(R*C*1.0);
end

%累计直方图
c=zeros(1,256);
c(1)=p(1);
for i=2:256
    c(i)=c(i-1)+p(i);
end
%取整
% c = uint8(255.*c+0.5);
c= round(255.*c);
%  均衡
for i=1:R
    for j=1:C
        g_out(i,j) = c(g_out(i,j)+1);
    end
end

% -----b-------
b_out = b;
s=zeros(1,256);
for i=1:R
    for j=1:C
        s(1, b_out(i,j)+1) = s(1, b_out(i,j) + 1) + 1;
    end
end

%算概率
p=zeros(1,256);
for i=1:256
    p(i)=s(i)/(R*C*1.0);
end

%累计直方图
c=zeros(1,256);
c(1)=p(1);
for i=2:256
    c(i)=c(i-1)+p(i);
end
%取整
% c = uint8(255.*c+0.5);
c= round(255.*c);
%  均衡
for i = 1:R
    for j = 1:C
        b_out(i,j) = c(b_out(i,j)+1);
    end
end

out = cat(3, r_out, g_out, b_out);

% 输出直方图均衡化后的图像
figure('name', 'out_hisq');
imshow(out);