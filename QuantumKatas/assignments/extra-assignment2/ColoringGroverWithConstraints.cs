using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using System;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Reflection;
using static System.Math;

namespace Microsoft.Quantum.Samples
{
  static async Task Main()
  {
    // todo: create num vertices
    let emptySquareEdges = new List<(Int, Int)> { (0, 1), (1, 2), (2, 3), (3, 0), (0, 4), (1, 5), (2, 6), (3, 7), (4, 5), (5, 6), (6, 7), (7, 4) };
    let bitsPerColor = 2;
    let numVertices = 7;
    let oracle = ApplyVertexColoringOracle(numVertices, bitsPerColor, emptySquareEdges, _, _);
    let coloring = FindColorsWithGrover(numVertices, bitsPerColor, numIterations, oracle, statePrep);
  }
}
