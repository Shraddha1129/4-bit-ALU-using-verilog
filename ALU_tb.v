`timescale 1ns / 1ps
module ALU_tb_v;
	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [2:0] sel;
	// Outputs
	wire [3:0] result;
   wire Cout;

	// Instantiate the uut
	ALU_4Bit uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.result(result), 
		.Cout(Cout)
	);
	initial begin
        $monitor("A = %b, B = %b, sel = %b, result = %b, Cout = %b", A, B, sel, result, Cout);

        // Test Cases
        A = 4'b1010; B = 4'b0101; sel = 3'b000; #10; // Addition
        A = 4'b1100; B = 4'b0011; sel = 3'b001; #10; // Subtraction
        A = 4'b1010; B = 4'b0101; sel = 3'b010; #10; // AND
        A = 4'b1111; B = 4'b0000; sel = 3'b011; #10; // OR
        A = 4'b1010; B = 4'b1100; sel = 3'b100; #10; // XOR
        A = 4'b1100; B = 4'b1010; sel = 3'b101; #10; // NAND
        A = 4'b1100; B = 4'b1010; sel = 3'b110; #10; // NOR
        A = 4'b1100; B = 4'b1010; sel = 3'b111; #10; // XNOR
        
        $stop;
    end

endmodule

