module mealy_fsm (
    input  wire clk,
    input  wire reset,
    input  wire [3:0] total,
    input  wire vendA,
    input  wire vendB,
    output reg  [3:0] cambio
);

    reg [3:0] saldo;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            saldo <= 0;
            cambio <= 0;
        end else begin
            if (vendA) begin
                saldo <= total - 2;
                cambio <= total - 2;
            end else if (vendB) begin
                saldo <= total - 3;
                cambio <= total - 3;
            end else begin
                saldo <= total;
                cambio <= 0;
            end
        end
    end

endmodule
