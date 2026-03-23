interface inter #(parameter depth=8, data_width=8);

  logic wclk;
  logic wrst;
  logic w_en;
  
  logic rclk;
  logic rrst;
  logic r_en;
  
  logic [data_width-1:0] data_in;
  logic [data_width-1:0] data_out;
  
  logic full;
  logic empty;
  
  clocking w_drive @(negedge wclk);
    default input #1 output #0;
    output wrst, w_en, data_in;
    input full;
  endclocking
  
  clocking w_monit @(posedge wclk);
    default input #1;
    input wrst, w_en, data_in, full;
  endclocking
  
  clocking r_drive @(negedge rclk);
    default input #1 output #0;
    output rrst, r_en;
    input data_out, empty;
  endclocking 
  
  clocking r_monit @(posedge rclk);
    default input #1;
    input rrst, r_en, data_out, empty;
  endclocking
  
  modport wd(clocking w_drive, input wclk);
  modport wm(clocking w_monit, input wclk);
  modport rd(clocking r_drive, input rclk);
  modport rm(clocking r_monit, input rclk);
    
endinterface
