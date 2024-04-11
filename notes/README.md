## System Info
```bash
Darwin Rohiths-MacBook-Pro.local 23.2.0 Darwin Kernel Version 23.2.0: Wed Nov 15 21:53:18 PST 2023; root:xnu-10002.61.3~2/RELEASE_ARM64_T6000 arm64
```

## Installation

```bash
brew install dotnet@6
brew install nuget
nuget install microsoft.quantum.simulators -Version 0.21.2112180703
cd ~/.nuget/packages/microsoft.quantum.simulators
AVAILABLE_MAX_VERSION=$(ls | sort -n | tail -n 1)
cp 0.21.2112180703/runtimes/osx-x64/native/* $(AVAILABLE_MAX_VERSION)/runtimes/osx-x64/native
```


## Run Using Docker Image

```bash
docker build -t katas .
docker run -it --name katas-container -p 8888:8888 -v .:/home/jovyan/ katas /bin/bash
# run tests
cd ~/BasicGates/
dotnet test
# run juptyer notebook
cd ~/BasicGates/ && jupyter notebook --ip=0.0.0.0 --no-browser 
nohup jupyter notebook --ip=0.0.0.0 --no-browser > jupyter.out 2>&1 &
```


### Issues with Docker Image

```bash
pip install traitlets==5.9.0
pip install qsharp-jupyterlab
```

### iqsharp issue

```bash
dotnet iqsharp --version
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet add package Microsoft.Quantum.MachineLearning --version 0.28.302812
dotnet iqsharp install --user
```

### Run Tests

```bash
dotnet test --filter T1_Test
```
