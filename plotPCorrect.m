
signalRange = 0:0.001:1;
valueTask1 = 15;
valueTask2 = 5;
difficultyTask1 = 0.3;
difficultyTask2 = 0.6;
costParamTask1 = 3;

plotSettings;
color = [129 0 126]/255;

fig = figure(1);
set(fig, 'Position', [100 100 width height]);
plot(signalRange, probCorrect(signalRange, difficultyTask1), '-b', 'LineWidth', lineWidth); hold on;
plot(signalRange, probCorrect(signalRange, difficultyTask2), '-', 'Color', color, 'LineWidth', lineWidth); hold off;
ylabel({'Expected Probability of' 'Correct Response'}, 'fontsize', fontsize);
xlabel('Control Signal Intensity', 'fontsize', fontsize);
set(gca, 'XTick', [0, 0.5, 1]);
set(gca, 'YTick', [0, 0.5, 1]);
% set(gca, 'XTicklabel', {'Easy', 'Difficult', 'Very Difficult'});
set(gca, 'fontSize', fontsize);
ylim([0, 1]);
xlim([0, 1]);