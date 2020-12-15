
signalRange = 0:0.001:1;
valueTask1 = [5:1:20];
valueTask2 = 5;
difficultyTask2 = 0.5;
costParam = 3;

plotSettings;

[task1SignalLog, difficultyRangeTask1, maxSignal, inflectionPoint] = computeTaskDifficulty(signalRange, valueTask1, valueTask2, difficultyTask2, costParam);

fig = figure(1);
set(fig, 'Position', [100 100 width height]);
p = plot(valueTask1, maxSignal, '-k', 'LineWidth', lineWidth); 
ylabel({'Maximum', 'Control Signal Intensity'}, 'fontsize', fontsize);
xlabel({'Subjective Value of ' 'Accurate Performance on Task'}, 'fontsize', fontsize);
set(gca, 'XTick', [min(valueTask1), mean(valueTask1), max(valueTask1)]);
set(gca, 'YTick', [0, 0.5, 1]);
set(gca, 'XTicklabel', {'Low', 'Medium', 'High'});
set(gca, 'fontSize', fontsize);
ylim([0, 1]);
% xlim([0, 1]);

