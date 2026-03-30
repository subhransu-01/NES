**************************** CMOS Inverter Dynamic Characteristics **************************
************************* Designer: Santunu Sarangi, Date: 27/01/1026, Bhubaneswar **********************

.title CMOS Inverter Characteristics

.lib ~/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.global Vdd Gnd
.temp 27

.param mp=1
.param mn=1

xmp1  Out  In   Sp    Vdd   sky130_fd_pr__pfet_01v8  w=1.26  l=0.15  m=mp
xmn1  Out  In   Dn    Gnd   sky130_fd_pr__nfet_01v8  w=0.42  l=0.15  m=mn
Cl    Out  Gnd   20f

Vsup  Vdd  Gnd  dc  1.8
Vin   In   Gnd  pulse (0  1.8  10n  100p  100p   4.9n  10n) 

Vcmp  Vdd  Sp   dc  0
Vcmn  Dn   Gnd  dc  0

.tran  10p  50n

.control
run
set color0 = white
set color1 = black

plot V(In)+2 V(Out) xlabel 'Time (ns)' ylabel 'Voltage (V)'

meas tran Trise     TRIG V(Out) VAL=0.18 RISE=3 TARG V(Out) VAL=1.62 RISE=3
meas tran Tfall     TRIG V(Out) VAL=1.62 FALL=3 TARG V(Out) VAL=0.18 FALL=3
meas tran Tphl      TRIG V(In)  VAL=0.9  RISE=3 TARG V(Out) VAL=0.9  Fall=3
meas tran Tplh      TRIG V(In)  VAL=0.9  FALL=3 TARG V(Out) VAL=0.9  RISE=3
let Tp = (Tphl+Tplh)/2
print Tp
.endc
.end


