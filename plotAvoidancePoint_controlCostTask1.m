
signalRange = 0:0.001:1;
valueTask1 = 15;
valueTask2 = 5;
difficultyTask2 = 0.5;
costParamTask1 = 3:0.01:5;
costParamTask2 = 3;

plotSettings;

[task1SignalLog, difficultyRangeTask1, maxSignal, inflectionPoint] = computeTaskDifficulty(signalRange, valueTask1, valueTask2, difficultyTask2, costParamTask1, costParamTask2);

fig = figure(1);
set(fig, 'Position', [100 100 width height]);
p = plot(costParamTask1, inflectionPoint, '-k', 'LineWidth', lineWidth); 
ylabel({'Maximum', 'Tolerable Difficulty'}, 'fontsize', fontsize);
xlabel({'Cost of Control for Primary Task'}, 'fontsize', fontsize);
set(gca, 'YTick', [0, 1]);
set(gca, 'XTick', [min(costParamTask1), mean(costParamTask1), max(costParamTask1)]);
set(gca, 'YTicklabel', {'Easy', 'Difficult'});
set(gca, 'XTicklabel', {'Low', 'Medium', 'High'});
set(gca, 'fontSize', fontsize);
ylim([0, 1]);
xlim([min(costParamTask1), max(costParamTask1)]);
% xlim([0, 1]);

