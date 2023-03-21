unitPrice = 10; % 单价10元/斤
weight = 8; % 输入购买的重量（斤）
if weight >= 5
    price = unitPrice * weight * 0.8
else
    price = unitPrice * weight
end