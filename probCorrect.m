function probabilityCorrect = probCorrect(signal, difficulty)

    probabilityCorrect = 1./(1 + exp(-10*(signal-difficulty)));
    
end