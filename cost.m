function controlCost = cost(signal, costParam)

    controlCost = exp(costParam*signal);
    
end