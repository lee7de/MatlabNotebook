year = 2012;
month = 2;
switch month
    case {1,3,5,7,8,10,12} % 一三五七八十腊，三十一天永不差
        days = 31
    case {4,6,9,11} % 四六九冬三十日
        days = 30
    case 2 % 二月需要判断是否为闰年
        if (mod(year,4) == 0 && mod(year,100) ~= 0) || (mod(year,400) == 0)
            days = 29
        else
            days = 28
        end
end