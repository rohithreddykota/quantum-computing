## Quantum Machine Learning - Banknote Authentication

The task is to implement a quantum machine learning algorithm for banknote authentication. The dataset is available at [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/banknote+authentication).  

The dataset contains 1372 data points, each with 4 features and a label. The task is to classify the data points into two classes: genuine and forged banknotes.


### Contents

- Traings.qs: Q# implementation to be used for training the model.
- classical_ml.ipybn: Classical machine learning implementation for comparison.
- quantum_ml.ipybn: Quantum machine learning implementation.
- BankNoteAuth.csproj: Main C# project file for the application.


### References

- The paper ['Circuit-centric quantum classifiers', by Maria Schuld, Alex Bocharov, Krysta Svore and Nathan Wiebe](https://arxiv.org/abs/1804.00633). Used it to understand the concept of quantum classifiers and the implementation of the quantum circuit for the same.

- [QunatumKatas/tutorials/QuantumClassification](https://github.com/microsoft/QuantumKatas/tree/main/tutorials/QuantumClassification) provided the basic structure of the code and the implementation of the quantum circuit for the quantum classifier.

- [Quantum Machine Learning Samples](https://github.com/microsoft/Quantum/tree/main/samples/machine-learning) from Microsoft Quantum repository.
