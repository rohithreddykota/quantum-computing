namespace Microsoft.Quantum.Samples {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Math;


    function WithProductKernel(scale : Double, sample : Double[]) : Double[] {
        return sample + [scale * Fold(TimesD, 1.0, sample)];
    }

    function Preprocess(samples : Double[][]) : Double[][] {
        return Mapped(
            WithProductKernel(1.0, _),
            samples
        );
    }

    function ClassifierStructure() : ControlledRotation[] {
        return [
            ControlledRotation((0, new Int[0]), PauliX, 4),
            ControlledRotation((0, new Int[0]), PauliZ, 5),
            ControlledRotation((1, new Int[0]), PauliX, 6),
            ControlledRotation((1, new Int[0]), PauliZ, 7),
            ControlledRotation((0, [1]), PauliX, 0),
            ControlledRotation((1, [0]), PauliX, 1),
            ControlledRotation((1, new Int[0]), PauliZ, 2),
            ControlledRotation((2, new Int[0]), PauliX, 6),
            ControlledRotation((2, [1]), PauliX, 1),
            ControlledRotation((2, new Int[0]), PauliX, 0)
        ];
    }

    operation TrainModel(
        trainingVectors : Double[][],
        trainingLabels : Int[],
        initialParameters : Double[][],
        initialBias : Double
    ) : (Double[], Double) {
        let samples = Mapped(
            LabeledSample,
            Zipped(Preprocess(trainingVectors), trainingLabels)
        );
        Message("Ready to train.");
        let classifierStructure = ClassifierStructure();
        // message length of classifierStructure is 8
        Message($"Classifier structure length: {Length(classifierStructure)}");
        let mapped = Mapped(
                SequentialModel(ClassifierStructure(), _, initialBias),
                initialParameters
            );
        Message($"Mapped length: {Length(mapped)}");
        Message($"Example Map - Mapped[0]: {mapped[0]}");
        Message($"Samples length: {Length(samples)}");
        Message($"Mapped length: {Length(mapped)}");
        let (optimizedModel, nMisses) = TrainSequentialClassifier(
            mapped,
            samples,
            DefaultTrainingOptions()
                w/ LearningRate <- 0.1
                w/ MinibatchSize <- 150
                w/ Tolerance <- 0.005
                w/ NMeasurements <- 10000
                w/ MaxEpochs <- 8
                w/ VerboseMessage <- Message,
            SamplingSchedule([0..Length(trainingVectors) - 1]),
            SamplingSchedule([0..Length(trainingVectors) - 1]),
        );
        Message($"Training complete!");
        return (optimizedModel::Parameters, optimizedModel::Bias);
    }

    operation ValidateModel(
        validationVectors : Double[][],
        validationLabels : Int[],
        parameters : Double[],
        bias : Double
    ) : Double {
        let samples = Mapped(
            LabeledSample,
            Zipped(Preprocess(validationVectors), validationLabels)
        );
        let tolerance = 0.005;
        let nMeasurements = 10000;
        let results = ValidateSequentialClassifier(
            SequentialModel(ClassifierStructure(), parameters, bias),
            samples,
            tolerance,
            nMeasurements,
            SamplingSchedule([0..Length(validationVectors) - 1]),
        );
        return IntAsDouble(results::NMisclassifications) / IntAsDouble(Length(samples));
    }

    operation ClassifyModel(
        samples : Double[][],
        parameters : Double[],
        bias : Double,
        tolerance  : Double,
        nMeasurements : Int
    )
    : Int[] {
        let model = Default<SequentialModel>()
            w/ Structure <- ClassifierStructure()
            w/ Parameters <- parameters
            w/ Bias <- bias;
        let features = Preprocess(samples);
        let probabilities = EstimateClassificationProbabilities(
            tolerance, model,
            features, nMeasurements
        );
        return InferredLabels(model::Bias, probabilities);
    }

}
