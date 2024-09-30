# Drone Signal Classification Using VGG16

### Project Description

This project demonstrates the classification of drone signals using a VGG16-based deep learning model. Signals were captured from drone controllers such as Elsec, Mavic Classic, Mavic Pro, and Phantom Pro. The raw signals were preprocessed using MATLAB, where spectrograms were generated and noise was added using the `awgn` function at 15dB. These spectrograms were used to train the VGG16 model, achieving 100% accuracy.

---

## Folder Structure

### **Dataset**
This folder contains 4 subfolders for different drone controllers: Elsec, Mavic Classic, Mavic Pro, and Phantom Pro. Each subfolder contains 801 spectrogram images of size `224x224`.

#### Specifications:
1. The `awgn` function in MATLAB was used to add noise to the signals.
2. Noise was added at 15dB to the signals.

### **Outcomes**
This folder contains the following results from the trained model:
1. **Confusion Matrix**: Displays the confusion matrix for testing results.
2. **Precision and Recall Scores**: Provides precision and recall metrics for model performance.
3. **Training Progress**: Tracks data from the model training process.
4. **Test Accuracy**: Contains accuracy values from testing the model with the test dataset.

- **Accuracy Achieved**: 100%

---

## Scripts

1. **`generateSpectrograms.m`**  
   MATLAB script to generate spectrogram images from raw IQ data. The input is a `.txt` file containing binary IQ values, where the least significant 16 bits (LSB) represent the Q value and the most significant 16 bits (MSB) represent the I value.

2. **`Drone_Classification_With_Noise_15db.ipynb`**  
   This Jupyter Notebook contains the VGG16 model definition, training, and testing procedures.

---

## Model

- **`VGG16_Drone_Model.h5`**  
  The trained model file, which can be loaded at any time using the `load_model` function for further testing or evaluation.

---

## Dataset Info

- **Sampling Frequency (fs)**: 30.72 MHz
- **Drone Signals Used**: Elsec, Mavic Pro, Mavic Classic, Phantom Pro

For each signal file, spectrograms were generated using 1M samples.

---

## Report

The **Report** folder contains the complete project report, documenting the process, results, and findings.

---

## License

[MIT License](LICENSE)

