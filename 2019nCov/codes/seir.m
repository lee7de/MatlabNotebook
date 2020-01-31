%% 微信公众号：数学模型（MATHmodels）
%  联系方式：mathmodels@outlook.com

N  = 11000000;         % 武汉人口
ts = [0, 250];         % 求解时间区间
y0 = [N-1, 1 , 0, 0];  % 初始条件 [S0 I0 R0]
C = 14;                % 感染的平均持续时间
gamma = 1/C; 
k = 5;                 % 感染者每天平均接触人数  
b = 0.05214;           % 接触时的传染概率
beta = k*b;
alpha = 1/7;
[t, y] = ode45(@odeseir, ts,y0, [], beta,gamma,alpha,N);
plot(t,y);
xlabel('Time (days)'); ylabel('Population')
legend('S', 'E', 'I', 'R')

%% ------------------------------------------------------------------------

function dy = odeseir(t, y, beta, gamma, alpha, N)
dy = [ -beta*y(1)*y(2)/N;  
        beta*y(1)*y(2)/N - alpha*y(2);
        alpha*y(2)       - gamma*y(3)
                           gamma*y(3)];
end