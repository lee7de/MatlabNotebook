%% 微信公众号：数学模型（MATHmodels）
%  联系方式：mathmodels@outlook.com

function dy = odesir(t, y, beta, gamma, N)
dy = [ -beta*y(1)*y(2)/N;                 
        beta*y(1)*y(2)/N - gamma*y(2);
                           gamma*y(2)];
