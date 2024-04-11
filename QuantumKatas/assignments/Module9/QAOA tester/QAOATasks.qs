// Copyright (c) Microsoft Corporation. All rights reserved.

namespace Quantum.QAOA {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    
    //////////////////////////////////////////////////////////////////
    // This is the testing harness for the QAOA assignment (module "Hybrid Quantum Algorithms").
    // You submit this assignment as a Jupyter Notebooks with 4 tasks!
    // This testing harness is designed only to help you validate your solutions for tasks 2-3.
    //////////////////////////////////////////////////////////////////

    // Task 2.  QAOA phase change unitary (4 points).
    operation Task2 (qs : Qubit[], gamma : Double) : Unit is Adj + Ctl {
        let n = Length(qs);
        // covert all to 1111...
        for i in 1 .. n - 1 {
            CNOT(qs[i], qs[i - 1]);
        }
        for i in 0 .. n - 1 {
        // convert to 0 if not apply R1
        X(qs[i]);
        R1(-2.0 * gamma, qs[i]);
        }
    }


    // Task 3.  QAOA mixer unitary (3 points).
    operation Task3 (qs : Qubit[], beta : Double) : Unit is Adj + Ctl {
            for q in qs {
        Rx(2.0 * beta, q);
    }

    }
}
