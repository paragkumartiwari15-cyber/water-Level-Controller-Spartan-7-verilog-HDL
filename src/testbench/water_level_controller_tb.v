`timescale 1ns / 1ps

module tb_water_level_controller_system;

    // Inputs
    reg clk;
    reg rst_n;
    reg L0, L1, L2, L3, L4;

    // Outputs
    wire motor_out;
    wire alarm_buzzer;
    wire [4:0] led_indicators;

    // Instantiate the DUT (Device Under Test)
    water_level_controller_system uut (
        .clk(clk),
        .rst_n(rst_n),
        .L0(L0),
        .L1(L1),
        .L2(L2),
        .L3(L3),
        .L4(L4),
        .motor_out(motor_out),
        .alarm_buzzer(alarm_buzzer),
        .led_indicators(led_indicators)
    );

    // Clock Generation (100 MHz)
    always #5 clk = ~clk;

    initial begin

        // Initialize Inputs
        clk = 0;
        rst_n = 0;

        L0 = 0;
        L1 = 0;
        L2 = 0;
        L3 = 0;
        L4 = 0;

        // Reset
        #20;
        rst_n = 1;

        // -----------------------------
        // Tank Empty (0%)
        // -----------------------------
        #20;
        L0 = 1;

        // -----------------------------
        // Water reaches 25%
        // -----------------------------
        #40;
        L1 = 1;

        // -----------------------------
        // Water reaches 50%
        // -----------------------------
        #40;
        L2 = 1;

        // -----------------------------
        // Water reaches 75%
        // -----------------------------
        #40;
        L3 = 1;

        // -----------------------------
        // Tank Full (100%)
        // -----------------------------
        #40;
        L4 = 1;

        #40;

        if (motor_out == 1'b0 &&
            alarm_buzzer == 1'b1 &&
            led_indicators == 5'b11111)
        begin
            $display("------------------------------------");
            $display("TEST PASSED");
            $display("Tank FULL");
            $display("Motor OFF");
            $display("Buzzer ON");
            $display("LED = %b", led_indicators);
            $display("------------------------------------");
        end
        else
        begin
            $display("------------------------------------");
            $display("TEST FAILED");
            $display("Motor = %b", motor_out);
            $display("Buzzer = %b", alarm_buzzer);
            $display("LED = %b", led_indicators);
            $display("------------------------------------");
        end

        // -----------------------------
        // Water Level Falling
        // -----------------------------
        #40;
        L4 = 0;

        #40;
        L3 = 0;
        #40;
        L2 = 0;
        #40;
        L1 = 0;
        #40;
        L0 = 0;
        #50;
        $finish;
    end
endmodule
