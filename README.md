# VLSI Design 

This repository consists of all the Implementations done as a part of the VLSI Design Course in Spring 2021. 


# Folders

## Assignment 1
Assignment based on NgSpice Simulation for various circuits with their analysis. The analysis reports can be found in the respective folder.

## Assignment 2
Assignment based on MAGIC, ngSpice Simulation with optimizations of ring oscillators and their analysis. The analysis reports can be found in the respective folder.

## Assignment 3
Assignment based on MAGIC, ngSpice Simulation, Verilog involving optimisation of widths for multiplexor, GCD finder circuit. The analysis reports can be found in the respective folder.


### Requirements:
	1) MAGIC
	2) NgSpice
	3) iVerilog
	4) gtkwave

### Run:
	To run NGSpice Files:
		$ngspice file_name.<cir or sp>
	To run MAGIC Files:
		$magic -T SCN6M_DEEP.09.tech27 <layout name>.mag
	To run Verilog Files:
		$iverilog <testbench-file>.v <module-file>.v 
		$./a.out
		$gtkwave dump.vcd
		
