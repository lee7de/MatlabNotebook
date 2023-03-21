%主函数
function coloraverage()
I=imread('111.png');
imshow(I);
I1=I(:,:,1);%提取红色分量
I2=I(:,:,2);%提取绿色分量
I3=I(:,:,3);%提取蓝色分量
I1=histogram(I1);   %构造的函数
I2=histogram(I2);
I3=histogram(I3);
c=cat(3,I1,I2,I3);  %cat用于构造多维数组
subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(c);
 
%调用的（直方图均衡化）构造函数
function d=histogram(I)%构造histogram函数
J=I;
[m,n]=size(I);      %确定矩阵大小
area=m*n;
a=zeros(1,256);     %产生1*256的零矩阵a,用来存放原始图像各个灰度值的个数
b=zeros(1,256);
for i=1:m           %记录各个灰度值的个数
    for j=1:n
        d=I(i,j)+1;   %获取(i,j)位置的灰度值(注意：灰度值为0-255，对应矩阵的1-256）
        a(1,d)=a(1,d)+1;    %矩阵a上对应灰度值的计数+1
    end
end
for i=1:256         %均衡化
    sum=0;
    for j=1:i
        sum=sum+a(1,j);
    end
    b(1,i)=sum*255/area;
end
for i=1:m           %用均衡化后的数据代替原位置的数据
    for j=1:n
        d=J(i,j)+1;
        J(i,j)=b(1,d);
    end
end
d=J;