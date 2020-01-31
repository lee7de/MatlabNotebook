%% 微信公众号：数学模型（MATHmodels）
%  联系方式：mathmodels@outlook.com

m = 500;n = 500;      % 元胞自动空间大小
% 用 1, 2, 3, 4 分别表示 S, E, I, R. 无人区域用 0 表示
[S, E, I, R] = deal(1,2,3,4); 

rhoS = 0.95;          % 初始易感人群密度
rhoE = 2758/11000000; % 初始潜伏人群密度

% X 为每个元胞的状态
X = zeros(m,n); X(rand(m,n)<rhoS) = S;  X(rand(m,n)<rhoE) = E;

time = zeros(m,n);    % 计时：用于计算潜伏时间和治疗时间
% 邻居方位 d 
d = {[1,0], [0,1], [-1,0], [0,-1]};

T = 7;                % 平均潜伏期
D = 14;               % 平均治愈时间
P = 3.6/T/4;          % R0 = 3.6，潜伏期平均感染 3.6 个

% 每个元胞的潜伏期和治愈时间服从均值为T和D的正态分布
Tmn = normrnd(T,T/2,m,n); Dmn = normrnd(D,D/2,m,n);

figure('position',[50,50,1200,400])
subplot(1,2,1)
h1 = imagesc(X); 
colormap(jet(5))
labels = {'无人','易感','潜伏','发病','移除'};
lcolorbar(labels);
subplot(1,2,2)
h2 = plot(0, [0,0,0,0]); axis([0,400,0,m*n])

for t = 1:450
    % 邻居中潜伏和发病的元胞数量
    N = zeros(size(X));
    for j = 1:length(d)
        N = N + (circshift(X,d{j})==E|circshift(X,d{j})==I);
    end
    
    % 分别找出四种状态的元胞
    isS = (X==S); isE = (X==E); isI = (X==I); isR = (X==R);
    
    % 将四种状态的元胞数量存到 Y 中
    Y(t,:) = sum([isS(:) isE(:) isI(:) isR(:)]);
        
    % 计算已经潜伏的时间和已经治疗的时间
    time(isE|isI) = time(isE|isI) + 1; 
    
    % 规则一：如果S邻居有N个染病的，则S以概率N*P变为E，否则保持为S
    ifS2E = rand(m,n)<(N*P);
    Rule1 = E*(isS & ifS2E) + S*(isS & ~ifS2E);
    
    % 规则二：如果E达到潜服期，则转变为I，否则保持为E
    ifE2I = time>Tmn;
    Rule2 = I*(isE & ifE2I) + E*(isE & ~ifE2I);
    time(isE & ifE2I) = 0;
    
    % 规则三：如果I达到治愈时间，则转变为R，否则保持为I
    ifI2R = time>Dmn;
    Rule3 = I*(isI & ~ifI2R) + R*(isI & ifI2R);
    
    % 规则四：已经治愈R有抗体，保持为R
    Rule4 = R*isR;
    
    % 叠加所有规则，更新所有元胞状态
    X = Rule1 + Rule2 + Rule3 + Rule4;
    
    set(h1, 'CData', X);
    for i = 1:4; set(h2(i), 'XData', 1:t, 'YData', Y(1:t,i)); end
    drawnow
end
