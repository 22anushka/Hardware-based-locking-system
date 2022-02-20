// module

module sequence_detector(input clock, reset, x_in, [1:8]seq, output reg y);
  
  reg [3:0] state = 4'b0000; reg [1:4] data = 4'b0000;
  parameter S0 = 4'b0000, S1 = 4'b0001,  S2 = 4'b0010,  S3 = 4'b0011,  S4 = 4'b0100,  S5 = 4'b0101,  S6 = 4'b0110,  S7 = 4'b0111, S8 = 4'b1000;
  
  always @ (posedge clock, negedge reset)
    begin
      $display("reset = %d, state = %d, data = %d%d%d%d, x_in = %d, y = %d", reset, state, data[1], data[2], data[3], data[4], x_in, y);
      data = {data[2:4], x_in};
      y <= (state == S8)?1:0;
      if(~reset)
        begin
          y <= 1'b0;
          state <= S0;
        end
      else
        begin
          case(state)
            S0: begin
              		if(data[4] == seq[1])
                      begin
                        state <= S1;
                        $display("Inside S0");
                      end
              		else
                      state <= S0;
            	end
            S1: begin
              		if(data[4] == seq[2])
                      begin
                        state <= S2;
                        $display("Inside S1");
                      end
              		else
                      begin
                        if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S2: begin
              		if(data[4] == seq[3])
                      begin
                        state <= S3;
                        $display("Inside S2");
                      end
              		else
                      begin
                        if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S3: begin
              		if(data[4] == seq[4])
                      begin
                        state <= S4;
                        $display("Inside S3");
                      end
              		else
                      begin
                        if((data[2] == seq[1]) && (data[3] == seq[2]) && (data[4] == seq[3]))
                          state <= S3;
                        else if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S4: begin
              		if(data[4] == seq[5])
                      begin
                        state <= S5;
                        $display("Inside S4");
                      end
              		else
                      begin
                        if((data[1] == seq[1]) && (data[2] == seq[2]) && (data[3] == seq[3]) && (data[4] == seq[4]))
                          state <= S4;
                        else if((data[2] == seq[1]) && (data[3] == seq[2]) && (data[4] == seq[3]))
                          state <= S3;
                        else if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S5: begin
              		if(data[4] == seq[6])
                      begin
                        state <= S6;
                        $display("Inside S5");
                      end
              		else
                      begin
                        if((data[1] == seq[1]) && (data[2] == seq[2]) && (data[3] == seq[3]) && (data[4] == seq[4]))
                          state <= S4;
                        else if((data[2] == seq[1]) && (data[3] == seq[2]) && (data[4] == seq[3]))
                          state <= S3;
                        else if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S6: begin
              		if(data[4] == seq[7])
                      begin
                        state <= S7;
                        $display("Inside S6");
                      end
              		else
                      begin
                        if((data[1] == seq[1]) && (data[2] == seq[2]) && (data[3] == seq[3]) && (data[4] == seq[4]))
                          state <= S4;
                        else if((data[2] == seq[1]) && (data[3] == seq[2]) && (data[4] == seq[3]))
                          state <= S3;
                        else if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S7: begin
              		if(data[4] == seq[8])
                      begin
                        state <= S8;
                        $display("Inside S7");
                      end
              		else
                      begin
                        if((data[1] == seq[1]) && (data[2] == seq[2]) && (data[3] == seq[3]) && (data[4] == seq[4]))
                          state <= S4;
                        else if((data[2] == seq[1]) && (data[3] == seq[2]) && (data[4] == seq[3]))
                          state <= S3;
                        else if((data[3] == seq[1]) && (data[4] == seq[2]))
                          state <= S2;
                        else if(data[4] == seq[1])
                          state <= S1;
                        else
                          state <= S0;
                      end
            	end
            S8: begin
              	$display("Inside S8");
              		if(data[4] == seq[1])
                      state <= S1;
              		else
                      state <= S0;
            	end
            default: begin
              			 state <= S0;
            		 end
          endcase
        end
      y <= (state == S8)?1:0;
    end

endmodule
