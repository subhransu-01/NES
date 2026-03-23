# NES - 2026  
- This workshop covers the standard cell characterization and the complete PD flow including simulation, synthesis, Floorplanning, and P&R.  
- *You can watch the PD Workshop here:*  [[Video]](https://www.youtube.com/watch?v=HakTI1QIe0A)
## Some Basic Commands
### For Verilog Simulations  
- ```iverilog -o sum.out rtl.v rtl_tb.v```  
- ```vvp sum.out```  
- ```gtkwave .vcd file```

### For Synthesis 
- yosys **file_name**.ys
- ```yosys half_adder.ys```
- yosys -p "read_verilog **output_netlist.v** ; show"
- ```yosys -p "read_verilog half_adder_netlist.v ; show"```
