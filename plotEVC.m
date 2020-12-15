
signalRange = 0:0.001:1;
valueTask1 = 15;
valueTask2 = 5;
difficultyTask2 = 0.5;
costParam = 3;

plotSettings;

[task1SignalLog, difficultyRangeTask1, maxSignal, inflectionPoint, EVCLog] = computeTaskDifficulty(signalRange, valueTask1, valueTask2, difficultyTask2, costParam);

fig = figure(1);
set(fig, 'Position', [100 100 width height]);
p = plot(difficultyRangeTask1, EVCLog, '-k', 'LineWidth', lineWidth); hold on;

n = length(difficultyRangeTask1);
cd = [uint8(jet(n)*255) uint8(ones(n,1))].';
color1 = [0 0 255];
color2 = [255 0 0];
cd(1, 1:end) = round(linspace(color1(1), color2(1), n));
cd(2, 1:end) = round(linspace(color1(2), color2(2), n));
cd(3, 1:end) = round(linspace(color1(3), color2(3), n));
drawnow
set(p.Edge, 'ColorBinding','interpolated', 'ColorData',cd)
hold off;
ylabel('EVC', 'fontsize', fontsize);
xlabel({'Task Difficulty'}, 'fontsize', fontsize);
set(gca, 'XTick', [0, 0.5, 1]);
% set(gca, 'YTick', [0, 0.5, 1]);
set(gca, 'XTicklabel', {'Easy', 'Difficult', 'Extreme'});
set(gca, 'fontSize', fontsize);
% ylim([0, 1]);
xlim([0, 1]);

