function [] = datasetStat(dataDir)

    imds = imageDatastore(dataDir, ...
        'IncludeSubfolders', true, ...
        'LabelSource', 'foldernames');
    
    labelCount = countEachLabel(imds);

    totalImages = length(imds.Files);
    categories = unique(imds.Labels);
    numCategories = numel(categories);

    disp('--------------------------------------');
    disp('Dataset Statistics:');
    disp(['Total number of images: ', num2str(totalImages)]);
    disp(['Number of categories: ', num2str(numCategories)]);
    disp('Label distribution:');
    disp(labelCount);
    disp('--------------------------------------');
end
