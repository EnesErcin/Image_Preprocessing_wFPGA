`timescale 1ns / 1ns 

module verilog_wrapper( );
reg clock;
parameter Clockperiod = 5;
integer f;


initial clock = 1'b0;
always #(Clockperiod/2) clock = ~clock;

initial begin
    f = $fopen("Verilog_Output_img_f.txt","w");
    #5000000   $fclose(f); // <== end simulation
end

Main_tb UUT (.clk_v(clock));


always @(posedge UUT.Builder.Builder_Ready) begin
    @(posedge UUT.Builder.Builder_Ready);
    $fwrite(f,"%d,\n", UUT.Builder.Img_bit );
    $display("%d",UUT.Builder.Result_Addr_to_Bram,"  :  ", "%d",  UUT.Builder.Img_bit);
end 



endmodule
