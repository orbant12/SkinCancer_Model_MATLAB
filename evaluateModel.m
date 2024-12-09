% Run after trained model is saved for insight and evaluation - Confusion Matrix

function evaluateModel()

    modelData = load("skin-cancer-detect-model.mat");
    net = modelData.net;
  
    disp('Network class:');
    disp(class(net));
    
    dataDir = fullfile('./skinImages');
    [imdsTrain, imdsValidation, labelsTrain, labelsValidation] = custom_image_preprocess(dataDir);
   
    figure;
    
    % First image from the training set
    imgTrainTable = read(imdsTrain);  
    imgTrain = imgTrainTable{1, 1};  
    imgTrain = imgTrain{1};
    subplot(1, 2, 1);
    imshow(imgTrain);
    title('First Training Image');
    
    % First image from the validation set
    imgValidationTable = read(imdsValidation); 
    imgValidation = imgValidationTable{1, 1};  
    imgValidation = imgValidation{1};  
    subplot(1, 2, 2);
    imshow(imgValidation);
    title('First Validation Image');
    
    trueLabelsTrain = labelsTrain;  % Labels from the original training set
    trueLabelsValidation = labelsValidation;  % Labels from the original validation set
    
    % Evaluating the model
    predictedLabels = classify(net, imdsValidation);
    
    % Confusion matrix
    figure;
    confusionchart(trueLabelsValidation, predictedLabels);
    
    % Accuracy
    accuracy = sum(predictedLabels == trueLabelsValidation) / numel(trueLabelsValidation);
    disp(['Validation Accuracy: ', num2str(accuracy)]);
end


function [imdsTrain, imdsValidation, labelsTrain, labelsValidation] = custom_image_preprocess(dataDir)

    imds = imageDatastore(dataDir, 'LabelSource', 'foldernames', 'IncludeSubfolders', true);
    
    [imdsTrain, imdsValidation] = splitEachLabel(imds, 0.8, 'randomize');
    
    augmentedTrain = augmentedImageDatastore([224 224], imdsTrain, 'ColorPreprocessing', 'gray2rgb');
    
    augmentedValidation = augmentedImageDatastore([224 224], imdsValidation);
    
    labelsTrain = imdsTrain.Labels;
    labelsValidation = imdsValidation.Labels;
    
    imdsTrain = augmentedTrain;
    imdsValidation = augmentedValidation;
end
