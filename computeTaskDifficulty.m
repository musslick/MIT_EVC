function [task1SignalLog, difficultyRangeTask1, maxSignal, inflectionPoint, EVCLog] = computeTaskDifficulty(signalRange, valueTask1, valueTask2, difficultyTask2, costParam, varargin)

    costParamTask1 = costParam;
    costParamTask2 = costParam;
    
    if(length(varargin) >= 1)
        costParamTask2 = varargin{1};
    end

    controlSignals = zeros(2, length(signalRange)*2);
    controlSignals(1,1:length(signalRange)) = signalRange;
    controlSignals(2,(length(signalRange)+1):end) = signalRange;

    difficultyRangeTask1 = 0:0.001:1;

    task1SignalLog = nan(size(difficultyRangeTask1));
    EVCLog = nan(size(difficultyRangeTask1));
    
    iterSpec = '';
    iterParam = 1;
    
    if(length(valueTask1) > 1)
        iterParam = valueTask1;
        iterSpec = 'valueTask1';
    elseif(length(valueTask2) > 1)
        iterParam = valueTask2;
        iterSpec = 'valueTask2';
    elseif(length(costParamTask1) > 1)
        iterParam = costParamTask1;
        iterSpec = 'costParamTask1';
    elseif(length(costParamTask2) > 1)
        iterParam = costParamTask2;
        iterSpec = 'costParamTask2';
    end
    
    maxSignal = nan(size(iterParam));
    inflectionPoint = nan(size(iterParam));
    EVC= nan(size(iterParam));
    
    for iterIdx = 1:length(iterParam)
        if(strcmp(iterSpec, 'valueTask1'))
            valueTask1 = iterParam(iterIdx);
        elseif(strcmp(iterSpec, 'valueTask2'))
            valueTask2 = iterParam(iterIdx);
        elseif(strcmp(iterSpec, 'costParamTask1'))
            costParamTask1 = iterParam(iterIdx);
        elseif(strcmp(iterSpec, 'costParamTask2'))
            costParamTask2 = iterParam(iterIdx);
        end
        
        for difficultyIdx = 1:length(difficultyRangeTask1)

            probedDifficultyTask1 = difficultyRangeTask1(difficultyIdx);

            EVC_task1 = probCorrect(controlSignals(1,:), probedDifficultyTask1) * valueTask1 - cost(controlSignals(1,:), costParamTask1);
            EVC_task2 = probCorrect(controlSignals(2,:), difficultyTask2) * valueTask2 - cost(controlSignals(2,:), costParamTask2);

            EVC = max(EVC_task1, EVC_task2);
            [maxEVC, signalIdx] = max(EVC);

            task1SignalLog(difficultyIdx) = controlSignals(1, signalIdx);
            EVCLog(difficultyIdx) = maxEVC;

        end
        [maxSig, inflectionPt] = max(task1SignalLog);
        maxSignal(iterIdx) = maxSig;
        inflectionPoint(iterIdx) = difficultyRangeTask1(inflectionPt);
        
    end
    
    

end