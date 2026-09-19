// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
reg [2:0] t_sel;
wire [7:0] t_dout;
  // TODO: instantiate DUT here
lut #(.WIDTH(8), .DEPTH(8)) U1 (
    .sel(t_sel),
    .dout(t_dout)
);
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, U1);
    end
  end


    // TODO: apply different input combinations
initial begin
    integer i;

    for (i = 0; i < 8; i = i + 1) begin
        t_sel = i;
        #5;

        if (t_dout !== i * i)
            $display("FAIL: sel=%0d expected=%0d got=%0d",
                     i, i * i, t_dout);
        else
            $display("PASS: sel=%0d dout=%0d", i, t_dout);
    end

    $finish;
end


  initial
    $monitor($time, " sel=%0d | dout=%0d", t_sel, t_dout);

endmodule
