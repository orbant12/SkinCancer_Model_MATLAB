% This is a program script
%-----------------------
% Live screen with a button to take picture
% After the snaphot is taken it will show results

function detect_program()
    
    vid = videoinput('macvideo', 2);
    set(vid, 'ReturnedColorSpace', 'rgb');
    vidRes = vid.VideoResolution;

    cropRect = [300, 300, 400, 400];

    % Figure and axes
    hFig = figure('Name', 'Live Camera Feed', ...
        'NumberTitle', 'off', ...
        'Toolbar', 'none', ...
        'Menubar', 'none', ...
        'Position', [100, 100, 800, 600]);

    hAxis = axes('Parent', hFig, ...
        'Units', 'normalized', ...
        'Position', [0.05, 0.15, 0.9, 0.8]);

    hImage = image(zeros(vidRes(2), vidRes(1), 3), 'Parent', hAxis);

    setappdata(hImage, 'CropRect', cropRect);

    setappdata(hImage, 'UpdatePreviewWindowFcn', @myPreview);

    preview(vid, hImage);

    hold(hAxis, 'on');
    rectangle('Position', cropRect, 'EdgeColor', 'r', 'LineWidth', 2);
    hold(hAxis, 'off');
    
    % Capture button
    uicontrol('Parent', hFig, ...
        'Style', 'pushbutton', ...
        'String', 'Capture Snapshot', ...
        'Units', 'normalized', ...
        'Position', [0.4, 0.05, 0.2, 0.05], ...
        'Callback', @(~,~)captureSnapshot(vid, hImage));

    function captureSnapshot(vid, hImage)
        im = getsnapshot(vid);
        cRect = getappdata(hImage, 'CropRect');
        imCropped = imcrop(im, cRect);

        figure('Name', 'Snapshot Result', 'NumberTitle', 'off');
        imshow(imCropped);
        title('Cropped Image');

        modelData = load("trained_melanoma_net.mat");
        net = modelData.net; 

        newImage = imresize(imCropped, [224 224]);

        label = classify(net, newImage);
        disp('Classification Result:');
        disp(label);
    end
end

function myPreview(obj, event, himage)
    % This callback just updates the displayed frame
    frame = event.Data;
    set(himage, 'CData', frame);
end
