%% 微信公众号：数学模型（MATHmodels）
%  联系方式：mathmodels@outlook.com

N  = 11000000;         % 武汉人口
C = 14;                % 感染的平均持续时间
gamma = 1/C; 
% b = 0.04133;           
b = 0.05214;           % 接触时的传染概率
d = 0.03;              % 死亡率

% 第一阶段：政府未管控
ts = [0, 46];
y0 = [N-1, 1 , 0];
k = 5;
beta = k*b;
[t1, y1] = ode45(@odesir, ts, y0, [], beta,gamma, N);

% 第二阶段：政府管控
y0 = y1(end,:);
ts = [47, 250];
k = 1.0;
beta = k*b;
[t2, y2] = ode45(@odesir, ts, y0, [], beta,gamma, N);

% 合并两个阶段
t = [t1; t2(2:end)];
y = [y1; y2(2:end,:)];
y(C+1:end,4) = (N-y(1:end-C,1))*d;
plot(t,y(:,2:end));
xlabel('Time (days)'); ylabel('Population')
legend('I', 'R', 'D')
