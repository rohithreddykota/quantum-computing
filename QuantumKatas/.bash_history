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
cd assignments/
cd Module4-CommunicationAlgorithms/
dotnet test
dotnet test
dotnet test
dotnet test
dotnet test
dotnet test
git add .
git status
exit
nohup jupyter notebook --ip=0.0.0.0 --no-browser > jupyter.out 2>&1 &
tail -f jupyter.out
dotnet iqsharp --version
dotnet qsharp --version
pip freeze | grep qsharp
pip install qsharp-jupyterlab==1.1.3
kill -9 12
nohup jupyter notebook --ip=0.0.0.0 --no-browser > jupyter.out 2>&1 &
nohup jupyter notebook --ip=0.0.0.0 --no-browser > jupyter.out 2>&1 &
tail -f jupyter.out 
exit
exit
exit
dotnet iqsharp --version
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet iqsharp install --user
exit
cd Qu
cd assignments/Module10_QML/machine-learning/wine/
dotnet run
cd ..
dotnet run
cd wine/
dotnet run Host.cs 
dotnet run 
cd ..
cd ..
ls
cd ..
cd ..
ls
cd ..
ls
cd -
ls
cd Ka
cd katas/
ls
ls
cd ..
ls
cd tutorials/
cd QuantumClassification/
ls
ls
dotnet run
cd ..
cd ..
cd assignments/Module10_QML/machine-learning/
ls
cd wine/
ls
cd ..
cd half-moons
dotnet run
dotnet run
dotnet run
dotnet run
pip install qsharp
pip install qsharp
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
dotnet run
exit
cd assignments/Module10_QML/
ls
cd machine-learning/
ls
cd car-evaluation/
cd ..
cd car-evaluation/
nohup jupyter notebook --ip=0.0.0.0 --no-browser > jupyter.out 2>&1 &
dotnet run
cd ..
cd half-moons-assign/
dotnet run
exit
