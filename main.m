% Set data directory
dataDir = fullfile('./skinImages'); 

% Image Preprocessing | image_preprocess.m
[imdsTrain, imdsValidation] = image_preprocess(dataDir);

% Dataset Stat | datasetStat.m
datasetStat(dataDir);

% Model Definition | model.m
lgraph = model();

% Train the Model | train_model.m
net = train_model(imdsTrain, imdsValidation, lgraph);

% Save the trained network
save('skin-cancer-detect-model.mat', 'net');
