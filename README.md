# Skin Cancer Detection using Res-Net18 Model

## Overview

A deep learning project that uses Convolutional Neural Networks (CNN) to classify skin images into benign and malignant categories. The model is based on ResNet-18 architecture with transfer learning for improved accuracy in melanoma detection.

### With the trained model AVG accuracy is : ~89%

## Usage

- Training the model: run `main.m`
- Evaluating model: run `evaluateModel.m`
- Use Skin Cancer Detection with User Interface: run `detection_program.m`
- Other Functions are helper functions ....

```matlab
% Run the main script
main

% For evaluation
evaluateModel

% Program with user interface
detection_program
```

## Project Structure

The project consists of several key MATLAB scripts:

- `main.m` - Main execution script
- `image_preprocess.m` - Image preprocessing and data augmentation
- `datasetStat.m` - Dataset statistics and analysis
- `model.m` - ResNet-18 model definition and modification
- `train_model.m` - Model training implementation
- `evaluateModel.m` - Model evaluation and testing

## Features

- Binary classification of skin lesions (benign/malignant)
- Data augmentation with random rotations and translations
- Transfer learning using pre-trained ResNet-18
- Real-time image processing capabilities
- Comprehensive model evaluation tools

## Requirements

- MATLAB R2021a or later
- Deep Learning Toolbox
- Image Processing Toolbox

## Installation

1. Clone the repository:

```bash
git clone https://github.com/orbant12/SkinCancer-Model_MATLAB.git
```

1. Ensure all required MATLAB toolboxes are installed
2. Download the pre-trained ResNet-18 model through MATLAB's Deep Learning Toolbox



## Model Architecture

The project uses a modified ResNet-18 architecture:

- Input layer: 224x224x3 RGB images
- Pre-trained ResNet-18 layers (modified final layers)
- Custom fully connected layer for binary classification
- Softmax activation function
- Binary cross-entropy loss

## Training Configuration

- Batch size: 32
- Learning rate: 1e-4
- Epochs: 10
- Optimizer: SGDM (Stochastic Gradient Descent with Momentum)

## Results

The model achieved an accuracy of `88.26%` on the validation dataset.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Citations

- https://www.nature.com/articles/s41598-024-75143-4
- https://pmc.ncbi.nlm.nih.gov/articles/PMC8382232/
