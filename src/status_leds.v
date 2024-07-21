module status_leds
(
    input qsfp0_up, qsfp1_up, qsfp2_up, qsfp3_up,

    output[3:0] led_l
);

assign led_l  = { ~qsfp3_up, ~qsfp2_up, ~qsfp1_up, ~qsfp0_up};

endmodule