# NES-2026  
- This workshop covers the standard cell characterization and the complete PD flow including simulation, synthesis, Floorplanning, and P&R.  
- *You can watch the PD Workshop here:*  [[Video]](https://www.youtube.com/watch?v=HakTI1QIe0A)
## Some Basic Commands 
### For Verilog Simulations :  
- ```iverilog -o sum.out rtl.v rtl_tb.v```  
- ```vvp sum.out```  
- ```gtkwave .vcd file```

### For Synthesis :
- yosys **file_name.ys**
- ```yosys half_adder.ys```
- yosys -p "read_verilog **output_netlist.v** ; show"
- ```yosys -p "read_verilog half_adder_netlist.v;show"```

### To run the complete flow :  
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . config.json```

### To run the Floorplan :
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag Floorplan -T OpenROAD.Floorplan config_new.json```

### To run the Global Placement :
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag Floorplan -F Odb.RemovePDNObstructions -T OpenROAD.GlobalPlacement config_new.json```
