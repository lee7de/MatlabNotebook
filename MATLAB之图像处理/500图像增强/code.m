clc
clear
close all;

% 读图
img = imread('11.jpg');

%灰度图处理
gray = rgb2gray(img);
figure('name', 'original gray');
imshow(gray);

%读取灰度图 及直方图
[R,C]=size(gray);
% figure(2);
% imhist(I);

%统计灰度
s=zeros(1,256);
for i=1:R
    for j=1:C
        s(1,gray(i,j)+1)=s(1,gray(i,j)+1)+1;
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
        gray(i,j)=c(gray(i,j)+1);
    end
end
%8 输出直方图均衡化后的图像
figure('name', 'out_hisq');
imshow(gray);
% figure(4);
% imhist(I);