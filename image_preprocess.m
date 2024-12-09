% image_preprocessing.m
function [imdsTrain, imdsValidation] = image_preprocess(dataDir)

    imds = imageDatastore(dataDir, ...
        'IncludeSubfolders', true, ...
        'LabelSource', 'foldernames');

    labelCount = countEachLabel(imds);
    minSetCount = min(labelCount{:,2});
    imds = splitEachLabel(imds, minSetCount, 'randomize');

    [imdsTrain, imdsValidation] = splitEachLabel(imds, 0.8, 'randomized');

    inputSize = [224 224]; 

    augmenter = imageDataAugmenter( ...
        'RandRotation', [-10 10], ...
        'RandXTranslation', [-5 5], ...
        'RandYTranslation', [-5 5]);

    imdsTrain = augmentedImageDatastore(inputSize, imdsTrain, 'DataAugmentation', augmenter);
    imdsValidation = augmentedImageDatastore(inputSize, imdsValidation);
end
