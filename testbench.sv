// Testbench

module testbench_moore_FSM;
  wire t_y_out;
  reg t_x_in, t_clock, t_reset;
  reg [1:8] t_inp;
  
  sequence_detector M0 (t_clock, t_reset, t_x_in, t_inp, t_y_out);
  
  initial #2400 $finish;
  
  initial begin 
      for(integer i = 1; i <= 8; i++) begin
        t_inp[i] = $urandom;
      end
    
      repeat(2) begin
      	#800 t_reset = 0; 
      	for(integer i = 1; i <= 8; i++) begin
        	t_inp[i] = $random; 
      	end
      #1 t_reset = 1;
      end   
  end
  
  initial begin
    t_clock = 0; forever #1 t_clock = ~t_clock;
  end
  
  initial begin
  	t_x_in = $random;
  	forever #1 t_x_in = $urandom; 
  end
  
  initial fork
    $dumpfile ("dump.vcd");
    $dumpvars (1, testbench_moore_FSM);
    #0 t_reset = 0;
    #1 t_reset = 1;
  join
  
endmodule
