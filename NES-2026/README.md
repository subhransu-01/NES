# NES-2026  
- This workshop covers the standard cell characterization and the complete PD flow including simulation, synthesis, Floorplanning, and P&R.  
- *You can watch the PD Workshop here:*  [[Video]](https://youtu.be/QiA_UqFxFpY?si=GYlmt730DaBgbOoe)
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

### To run the Detailed Placement :
-  ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag Floorplan -F Odb.WriteVerilogHeader -T OpenROAD.DetailedPlacement config_new.json```

### To run the Global Routing :
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag run -F OpenROAD.STAMidPNR-1 -T OpenROAD.GlobalRouting config.json```

### To run the Detailed Routing :  
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag run -F OpenROAD.CheckAntennas -T OpenROAD.DetailedRouting config.json```

### To run the Clock Tree Synthesis :
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag run -F Odb.WriteVerilogHeader -T OpenROAD.CTS config.json```

### To generates Manufacturability Reports :
- ```librelane -p sky130A -s sky130_fd_sc_hd --design-dir . --run-tag run -F Odb.RemoveRoutingObstructions -T Misc.ReportManufacturability config.json```






