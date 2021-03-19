Inverter circuit

.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P=8*LAMBDA
.param width_N=4*LAMBDA
.global gnd vdd

Vdd vdd gnd 'SUPPLY'
vin in gnd pulse 0 1.8 0ns 1ns 1ns 10ns 20ns

M1 out in gnd gnd CMOSN W={width_N} L={2*LAMBDA}
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
+AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2 out in vdd vdd CMOSP W={width_P} L={2*LAMBDA}
+AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
+AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

cout out gnd 100f

.tran 0.1n 200n 

.control
run
plot v(out) v(in)
set hcopypscolor = 1
hardcopy inv_transient_resp.eps v(in) v(out)
.endc

.end


