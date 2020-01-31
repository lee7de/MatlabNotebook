%% 微信公众号：数学模型（MATHmodels）
%  联系方式：mathmodels@outlook.com

N  = 11000000;         % 武汉人口
ts = [0, 270];         % 求解时间区间
y0 = [N-1, 1 , 0];     % 初始条件 [S0 I0 R0]
C = 14;                % 感染的平均持续时间
gamma = 1/C; 
k = 5;                 % 感染者每天平均接触人数
b = 0.04133;           % 接触时的传染概率
% b = 0.05214;
beta = k*b;
d = 0.03;              % 死亡率

[t, y] = ode45(@odesir, ts,y0, [], beta,gamma, N);
y(C+1:end,4) = (N-y(1:end-C,1))*d;
plot(t,y);
xlabel('Time (days)'); ylabel('Population')
legend('S', 'I', 'R', 'D')
