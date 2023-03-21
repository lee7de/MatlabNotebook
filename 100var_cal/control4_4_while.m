num = 50; % 以50为例，显示水滴数的变化过程。由于num的计算过程没有加分号，会输出每次运算的结果。
while num ~= 1 % 还没有减小到1时，不断循环
    if mod(num,2) == 0 % 如果是偶数
        num = num / 2
    else % 如果是奇数
        num = num * 3 + 1
    end
end