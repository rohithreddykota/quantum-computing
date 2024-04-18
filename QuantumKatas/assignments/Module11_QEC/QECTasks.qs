// Copyright (c) Microsoft Corporation. All rights reserved.

namespace Quantum.QEC {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;

    //////////////////////////////////////////////////////////////////
    // This is the set of programming assignments for the module "Quantum error correction".
    //////////////////////////////////////////////////////////////////

    // The tasks cover the following topics:
    //  - quantum error correction: sign flip and Shor error correction codes
    //
    // We recommend to solve the following katas before doing these assignments:
    //  - QEC_BitFlipCode
    // from https://github.com/Microsoft/QuantumKatas


    // Task 1. Sign flip code: encode logical state (1 point).
    // Input: three qubits in the state |ψ⟩ ⊗ |0⟩ ⊗ |0⟩, where |ψ⟩ = α|0⟩ + β|1⟩ is the state of qs[0].
    // Goal: create a state |̅ψ⟩ = α|+++⟩ + β|---⟩ on these qubits.
    operation Task1(qs : Qubit[]) : Unit is Adj {
        CNOT(qs[0], qs[1]);
        H(qs[1]);

        CNOT(qs[0], qs[2]);
        H(qs[2]);

        H(qs[0]);
    }


    // Task 2. Sign flip code: detect Z error (1 point).
    // Input: three qubits that are either in the state |̅ψ⟩ = α|+++⟩ + β|---⟩
    //        or in one of the states Z𝟙𝟙|̅ψ⟩, 𝟙Z𝟙|̅ψ⟩ or 𝟙𝟙Z|̅ψ⟩
    //        (i.e., state |̅ψ⟩ with a Z error applied to one of the qubits).
    // Goal: determine whether a Z error has occurred, and if so, on which qubit.
    // The state of the qubits after your operation is applied should not change.
    // Error | Output
    // ======+=======
    // None  | -1
    // X𝟙𝟙   | 0
    // 𝟙X𝟙   | 1
    // 𝟙𝟙X   | 2
    operation Task2(qs : Qubit[]) : Int {
        use a = Qubit[2];
        
        H(qs[0]);
        CNOT(qs[0], a[0]);
        H(qs[0]);

        H(qs[1]);
        CNOT(qs[1], a[0]);
        CNOT(qs[1], a[1]);
        H(qs[1]);

        H(qs[2]);
        CNOT(qs[2], a[1]);
        H(qs[2]);

        let result1 = Measure([PauliZ], [a[0]]) == One ? 1 | 0;
        let result2 =  Measure([PauliZ], [a[1]]) == One ? 1 | 0;

        if result1 == 1 {
            return result2;
        } elif result2 == 1 {
            return 2;
        } else {
            return -1;
        }
    }


    // Task 3. Shor code: encode logical state (2 points).
    // Input: 9 qubits in the state |ψ⟩ ⊗ |0...0⟩, where |ψ⟩ = α|0⟩ + β|1⟩ is the state of qs[0].
    // Goal: create the state |̅ψ⟩ - the logical state representation of |ψ⟩ using thr Shor error correction code.
    operation Task3(qs : Qubit[]) : Unit is Adj {
        Task1([qs[0], qs[3], qs[6]]);

        for i in 0..3..6 {
            CNOT(qs[i], qs[i+1]);
            CNOT(qs[i], qs[i+2]);
        }
    }


    // Task 4. Shor code: detect single error (4 points).
    // Input: 9 qubits that are either in the state |̅ψ⟩ - the logical representation of state |ψ⟩ using thr Shor error correction code -
    //        or in one of the states that are a result of applying a single X, Y, or Z gate to one of the qubits of the state |̅ψ⟩.
    // Goal: determine whether an error has occurred, and if so, what type of error and on which qubit.
    // The first element of the return is an Int - the index of the qubit on which the error occurred, or -1 if no error occurred.
    // The second element of the return is a Pauli indicating the type of the error (PauliX, PauliY, or PauliZ).
    //   * If no error occurred, the second element of the return can be any value, it is not validated.
    //   * In case of a single Z error, the qubit on which it occurred cannot be identified uniquely.
    //     In this case, the return value should be the index of the triplet of qubits in which the error occurred (0 for qubits 0 .. 2, 1 for qubits 3 .. 5, and 2 for qubits 6 .. 8).
    // The state of the qubits after your operation is applied should not change.
    // Examples:
    //     Error    |    Output
    // =============+==============
    // None         | (-1, PauliI)
    // X on qubit 0 | (0, PauliX)
    // Y on qubit 4 | (4, PauliY)
    // Z on qubit 8 | (2, PauliZ)
    operation FindBitError(qs: Qubit[], bitAncillas: Qubit[], startIndex : Int, ancillaIndex : Int, initialIndex: Int) : Int {
        CNOT(qs[startIndex], bitAncillas[ancillaIndex]);
        CNOT(qs[startIndex + 1], bitAncillas[ancillaIndex]);
        CNOT(qs[startIndex + 1], bitAncillas[ancillaIndex + 1]);
        CNOT(qs[startIndex + 2], bitAncillas[ancillaIndex + 1]);

        let result0 = M(bitAncillas[ancillaIndex]);
        let result1 = M(bitAncillas[ancillaIndex + 1]);

        if (result0 == One and result1 == Zero) {
            return startIndex;
        } elif (result0 == One and result1 == One) {
            return startIndex + 1;
        } elif (result0 == Zero and result1 == One) {
            return startIndex + 2;
        }

        return initialIndex;
    }

    operation ApplyHadamardForAll(qs: Qubit[]) : Unit {
        for i in 0..8 {
            H(qs[i]);
        }
    }

    operation Task4(qs : Qubit[]) : (Int, Pauli) {
        mutable bitErrorValue = -1;
        mutable phaseErrorValue = -1;

        use bitAncillas = Qubit[6];
        use phaseAncillas = Qubit[2];

        set bitErrorValue = FindBitError(qs, bitAncillas, 0, 0, bitErrorValue);
        set bitErrorValue = FindBitError(qs, bitAncillas, 3, 2, bitErrorValue);
        set bitErrorValue = FindBitError(qs, bitAncillas, 6, 4, bitErrorValue);

        ApplyHadamardForAll(qs);
        for i in 0..5 {
            CNOT(qs[i], phaseAncillas[0]);
        }
        for i in 3..8 {
            CNOT(qs[i], phaseAncillas[1]);
        }
        ApplyHadamardForAll(qs);

        let result6 = M(phaseAncillas[0]) == One ? 1 | 0;
        let result7 = M(phaseAncillas[1]) == One ? 1 | 0;
        if (result6 == 1) {
            set phaseErrorValue = result7;
        }  elif (result7 == 1) {
            set phaseErrorValue = 2;
        }

        if (bitErrorValue != -1) {
            if (phaseErrorValue != -1) {
                return (bitErrorValue, PauliY);
            } else {
                return (bitErrorValue, PauliX);
            }
        } elif (phaseErrorValue != -1) {
            return (phaseErrorValue, PauliZ);
        } else {
            return (-1, PauliI);
        }

    }

}
