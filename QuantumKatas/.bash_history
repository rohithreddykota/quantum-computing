cd ~/BasicGates/ && jupyter notebook --ip=0.0.0.0 --no-browser 
ls
jupyter notebook --ip=0.0.0.0 --no-browser 
cd ~/BasicGates/ && jupyter notebook --ip=0.0.0.0 --no-browser 
pip uninstall traitlets
pip install traitlets==5.9.0
cd ~/BasicGates/ && jupyter notebook --ip=0.0.0.0 --no-browser 
ls
cd ..
ls
cd assignments/
ls
cd Module1_StandaloneProject_2/
dotnet run
dotnet run
ls
dotnet run
dotnet run Program.qs 
dotnet run Program.qs 
dotnet run
dotnet simulate
dotnet run -s SparseSimulator
dotnet run -s SparseSimulator
pip install qsharp-jupyterlab
cd ~/BasicGates/ && jupyter notebook --ip=0.0.0.0 --no-browser
dotnet run -s SparseSimulator
cd ..
ls
cd assignments/
cd Module1_StandaloneProject_2/
dotnet run -s SparseSimulator
dotnet run -s SparseSimulator
ll
ls
ls -al
dotnet run -s SparseSimulator
cd ..
cd ..
cd BasicGates/
dotnet test --filter T101_StateFlip
exit
cd assignments/
ls
cd Module2_SingleQubitSystem/
ls
dotnet test --filter T1_Test
dotnet test --filter T1_Test
exit
cd assignments/Module2_SingleQubitSystem/
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
exit
docker ps
cd assignments/Module2_SingleQubitSystem/
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
exit
cd assignments/
ls
cd Module2_SingleQubitSystem/
dotnet test --filter T1_Test
dotnet test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
operation Task5 (statePrep : Qubit => Unit) : (Double, Double) {
    mutable countZero = 0;
    let numRepetitions = 1000;
    for (_ in 1..numRepetitions) {
        using (q = Qubit()) {
            statePrep(q);
            if (M(q) == Zero) {
                set countZero += 1;
            }
            Reset(q);
        }
    }
    let alpha = Sqrt(IntAsDouble(countZero) / numRepetitions);
    let beta = Sqrt(1.0 - alpha * alpha);
    return (alpha, beta);
dotnet test 
ls
dotnet test 
dotnet test --filter T4_Test
dotnet test --filter T3_Test
ls
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T2_Test
dotnet test
dotnet test
dotnet test --filter T3_Test
dotnet test --filter T4_Test
gsutil ls gs://ws1-digitalturbine.rilldata.com/uploads/ignite_events_hourly-backfill/
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_test
dotnet test --filter T1_test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T1_Test
dotnet test --filter T3_Test
dotnet test --filter T3_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T2_Test
dotnet test --filter T1_Test
dotnet test --filter T3_Test
dotnet test --filter T4_Test
dotnet test --filter T4_Test
dotnet test --filter T4_Test
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
dotnet test 
exit
cd assignments/
cd Module3-MultiQubitSystems/
dotnet test
exit
cd assignments/
cd Module4-CommunicationAlgorithms/
ls
docker run -it --name katas-container -p 8888:8888 katas /bin/bash
exit
