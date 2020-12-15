
signalRange = 0:0.001:1;
valueTask1 = 15;
valueTask2 = 1:0.1:15;
difficultyTask2 = 0.5;
costParam = 3;

plotSettings;

[task1SignalLog, difficultyRangeTask1, maxSignal, inflectionPoint] = computeTaskDifficulty(signalRange, valueTask1, valueTask2, difficultyTask2, costParam);

fig = figure(1);
set(fig, 'Position', [100 100 width height]);
p = plot(valueTask2, inflectionPoint, '-k', 'LineWidth', lineWidth); 
ylabel({'Maximum', 'Tolerable Difficulty'}, 'fontsize', fontsize);
xlabel('Opportunity Cost', 'fontsize', fontsize);
set(gca, 'XTick', [min(valueTask2), mean(valueTask2), max(valueTask2)]);
set(gca, 'YTick', [0.5, 1]);
set(gca, 'YTicklabel', {'Easy', 'Difficult'});
set(gca, 'XTicklabel', {'Low', 'Medium', 'High'});
set(gca, 'fontSize', fontsize);
ylim([0.5, 1]);
xlim([min(valueTask2), max(valueTask2)]);


%%
signalRange = 0:0.01:1;
figure();
plot(signalRange, probCorrect(signalRange, difficultyTask1));
xlim([min(signalRange), max(signalRange)]);

%%
signalRange = 0:0.01:1;
figure();
plot(signalRange, cost(signalRange));

%%


