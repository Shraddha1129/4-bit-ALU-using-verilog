`timescale 1ns / 1ps
module ALU_4Bit (
    input [3:0] A,
    input [3:0] B,
    input [2:0] sel,
    output [3:0] result,
    output Cout
);

    wire [3:0] sum, sub_result;
    wire add_cout, sub_cout;
    
    // 4-bit Ripple Carry Adder for Addition
    assign {add_cout, sum} = A + B;
    
    // Subtraction using 2's Complement
    assign {sub_cout, sub_result} = A + (~B + 1'b1);

    // Logic Operations
    wire [3:0] and_result = A & B;
    wire [3:0] or_result = A | B;
    wire [3:0] xor_result = A ^ B;
    wire [3:0] nand_result = ~(A & B);
    wire [3:0] nor_result = ~(A | B);
    wire [3:0] xnor_result = ~(A ^ B);

    // Multiplexer for Operation Selection
    assign result = (sel == 3'b000) ? sum :
                    (sel == 3'b001) ? sub_result :
                    (sel == 3'b010) ? and_result :
                    (sel == 3'b011) ? or_result :
                    (sel == 3'b100) ? xor_result :
                    (sel == 3'b101) ? nand_result :
                    (sel == 3'b110) ? nor_result :
                    (sel == 3'b111) ? xnor_result : 4'b0000;

    // Carry Out Control
    assign Cout = (sel == 3'b000) ? add_cout :
                  (sel == 3'b001) ? sub_cout : 1'b0;

endmodule
