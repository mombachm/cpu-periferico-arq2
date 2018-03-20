# cpu-periferico-arq2
Async communication using Verilog.

------
##Verilog compilation
------
* To compile verilog with Icarus verilog:

`iverilog -o out.vvp src/testbench.v`

* To to run output verilog file and generate dump file to view the waves:

`vvp out.vvp`

* To view waves on Mac OS using Scansion:

`open -a Scansion dump.vcd`

All those compilation steps were implemented on a shell script using a watchdog. When you run `build.sh`, the script will wait for changes on the source files to compile the verilog and open the generated waves.
