Simple RC low pass configuration
* First line is the title. It can also be left blank\\
*`*' used for comments\\

* Circuit discription
R1 in out 1k
C2 out 0 1nf
*R1  out 0 1k
*C2 in out 1nf

* Input source description (square waveform)
vin in 0 pulse 0 5 0ns 100ns 100ns 10us 20us
* vin in+ in- pulse VLow VHigh delay rise-time fall-time on-period time-period

** sin input with ac option (for TRANSIENT and AC analysis)
*vin in gnd sin(0 30mv 1MEG 0 0 0) ac 1

* Input source for AC only 
*vin in gnd ac 1

* Type of analysis (transient)
.tran 0.1u 60u
**Format: .tran step_size stop_time

** AC analysis - comment .op statement and use following
*.ac dec 10 1k 1MEG
**Format: .ac dec no_pf_points_per_decade fstart fstop

.control
set color0=white ** color0 is used to set the background of the plot (manual sec:17.7))
set color1=black ** color1 is used to set the grid color of the plot (manual sec:17.7))

run
plot v(in) v(out)
*plot db(-v(out)/v(in))
* Saving plots to ps file
*set hcopypscolor = 0 *Black Background
set hcopypscolor = 1 *White background
hardcopy rc_ckt_tr_out_1.eps v(in) v(out)
.endc
