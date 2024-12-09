% returns the model

function lgraph = model()

    net = resnet18;

    lgraph = layerGraph(net);

    numClasses = 2;

    % Remove layers that are not needed
    lgraph = removeLayers(lgraph, {'fc1000','prob','ClassificationLayer_predictions'});

    % Add new layers
    newLayers = [
        fullyConnectedLayer(numClasses, 'Name', 'fc', 'WeightLearnRateFactor', 10, 'BiasLearnRateFactor', 10)
        softmaxLayer('Name', 'softmax')
        classificationLayer('Name', 'classification')];

    % Connect new layers
    lgraph = addLayers(lgraph, newLayers);
    lgraph = connectLayers(lgraph, 'pool5', 'fc');
end
