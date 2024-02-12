%%qsharp
// # Summary
operation StatePrepare(q : Qubit) : Unit is Adj {
    Ry(3.1415 / 7.0, q);
}

operation QuantumRepeater(N : Int) : Result {
    use qs = Qubit[2 ^ N];
    // Prepare the Bell pairs
    for i in 0 .. 2 .. Length(qs) - 1 {
        H(qs[i]);
        CNOT(qs[i], qs[i+1]);
    }
    // In this block iteratively teleport states 
    // to entangle more and more distant pairs of qubits
    // until we entangle the two ends of the array.
    for power in 2 .. N {
        let step = 2 ^ power;
        for i in 0 .. step .. Length(qs) - 1 {
            let q1Idx = i;
            let q2Idx = i + step - 1;

            let bsm = BellStateMeasurement(qs[q1Idx], qs[q2Idx]);
            TeleportationFixup(qs[i + step - 1], bsm);
        }
    }
    // Allocate a new qubit and prepare a state to teleport.
    use qToTeleport = Qubit();
    StatePrepare(qToTeleport);

    // Teleport the state.
    let bsm = BellStateMeasurement(qToTeleport, qs[0]);
    TeleportationFixup(qs[Length(qs) - 1], bsm);

    // Apply Adjoint of the state preparation to the teleportation target.
    // It should end up in the |0⟩ state.
    Adjoint StatePrepare(qs[Length(qs) - 1]);
    return MResetZ(qs[Length(qs) - 1]);
}
