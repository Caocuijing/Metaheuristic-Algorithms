clc;
clear;
% 问题定义和参数设置
coords = importdata('Bier127_1.txt');
coords = coords*0.01;
nCities = size(coords, 1);
fobj = @(route) TotalDistance(route, coords); %route是30*52 30种路径是不同的52个城市排列


ps = 30; % 粒子群大小
dim = nCities; % 维度
lb = -100; % 下界
ub = 100; % 上界
Max_iteration = 1000;
% results(1:30) = struct('best_fitness', [], 'best_formula', []); % 初始化结果结构数组

% 运行遗传规划
    % fobj = @(x) cec18_func(x',Function_name);
    [best_fitness, best_formula, GP_curve] = GP_TAtest(fobj, ps, dim, lb, ub, Max_iteration);

% 输出最佳公式
    fprintf('Best evolved formula %s\n', best_formula);
    fprintf('Best fitness = %f\n', best_fitness);
    % results(Function_name).best_fitness = best_fitness;
    % results(Function_name).best_formula = best_formula;

% save('results.mat', 'results');

% % 绘图
% figure
% plot(GP_curve,'Color','b','linewidth',2)
% title('适应度曲线')
% xlabel('迭代次数');
% ylabel('适应度值');
% axis tight
% grid on
% box on
% legend('GP_curve')




