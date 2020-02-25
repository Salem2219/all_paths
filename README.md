# Floyd's Algorithm
Basic Finite State Machine with Datapath (FSMD) to compute the length of a shortest path between each pair of vertices in a simple,
undirected, weighted graph G. All weights are nonnegative and shall not be greater than 14. The input is the adjancey matrix A ((n+1)x(n+1)) of G.
The outoput is the matrix A whose ijth entry is the length of a shortest path from vertex i to vertex j.

## Notes :
- The A matrix is a ram 8x8ramsx4bits.
- If vertex i is not connected to vertex j A[i][j] should be equal to 15.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/all_paths.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd all_paths
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, n = 4. Note : the denom array contents is specified in rom_4x4bit.vhd:

    ```sh
    $ vsim work.tb
    ```
6. Add the following commands to the transcript
```sh
    $ add wave -position end  sim:/tb/dut/u2/program
    $ run 50ns
    ```
