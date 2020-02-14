clc;
clear;
close all;

%-----读--取--图--片--并--显--示---------
% imread 读去一张图片，括号里格式为字符串，这字符串表示你要读取图片的路径
img = imread('1.jpg');

% 函数figure: 建立一个窗口 可以直接用数字去编号：
% figure(1);
% 关于figure的用法参考：https://blog.csdn.net/qq_30387863/article/details/80301996
% 命名编号：括号里两个参数：第一个是指定参数为'name', 第二个写你要起的名字
figure('name', '小黑')

% 函数imshow：显示图片 括号里面是需要显示的图片的名字
imshow(img);

% -----图--像--的--表--示-----
% 关于图像里面的数据格式，常见的是uint8和double 
% 其中，uint8指的是没有符号的整数，即非负整数，double指的是精确度比较高的浮点数

% 彩图和灰度图的转化不是可逆的，彩图到灰度图可以用函数rgb2gray
gray = rgb2gray(img);
figure('name', 'gray');
imshow(gray);

% ---保存图片到指定位置---
% 用 imwrite(A,filename) 
% 将图像数据 A 写入 filename 指定的文件，并从扩展名推断出文件格式。