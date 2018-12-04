/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input button,
    input io_reset,
    input io_startgame,
    input [9:0] io_button,
    output reg [3:0] io_sel,
    output reg [7:0] io_seg,
    output reg led_strip
  );
  
  
  
  reg rst;
  
  reg checkEqualsZero;
  
  reg checkOtherStack;
  
  reg checkLessThanTwo;
  
  reg checkLessThanOne;
  
  reg checkLeftStackZero;
  
  reg checkMiddleStackZero;
  
  reg checkRightStackZero;
  
  wire [16-1:0] M_alu16_out;
  wire [1-1:0] M_alu16_z;
  wire [1-1:0] M_alu16_v;
  wire [1-1:0] M_alu16_n;
  wire [1-1:0] M_alu16_overflow;
  wire [16-1:0] M_alu16_getA;
  wire [16-1:0] M_alu16_getB;
  wire [6-1:0] M_alu16_getOpcode;
  reg [16-1:0] M_alu16_a;
  reg [16-1:0] M_alu16_b;
  reg [6-1:0] M_alu16_opcode;
  alu_1 alu16 (
    .a(M_alu16_a),
    .b(M_alu16_b),
    .opcode(M_alu16_opcode),
    .out(M_alu16_out),
    .z(M_alu16_z),
    .v(M_alu16_v),
    .n(M_alu16_n),
    .overflow(M_alu16_overflow),
    .getA(M_alu16_getA),
    .getB(M_alu16_getB),
    .getOpcode(M_alu16_getOpcode)
  );
  
  localparam ADD = 6'h00;
  
  localparam SUB = 6'h01;
  
  localparam AND = 6'h18;
  
  localparam OR = 6'h1e;
  
  localparam XOR = 6'h16;
  
  localparam AONLY = 6'h1a;
  
  localparam SHL = 6'h20;
  
  localparam SHR = 6'h21;
  
  localparam SRA = 6'h23;
  
  localparam CMPEQ = 6'h33;
  
  localparam CMPLE = 6'h35;
  
  localparam CMPLT = 6'h37;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_detectMoveLP1_out;
  reg [1-1:0] M_detectMoveLP1_in;
  edge_detector_3 detectMoveLP1 (
    .clk(clk),
    .in(M_detectMoveLP1_in),
    .out(M_detectMoveLP1_out)
  );
  wire [1-1:0] M_detectMoveRP1_out;
  reg [1-1:0] M_detectMoveRP1_in;
  edge_detector_3 detectMoveRP1 (
    .clk(clk),
    .in(M_detectMoveRP1_in),
    .out(M_detectMoveRP1_out)
  );
  wire [1-1:0] M_detectUpRm1P1_out;
  reg [1-1:0] M_detectUpRm1P1_in;
  edge_detector_3 detectUpRm1P1 (
    .clk(clk),
    .in(M_detectUpRm1P1_in),
    .out(M_detectUpRm1P1_out)
  );
  wire [1-1:0] M_detectDnRm2P1_out;
  reg [1-1:0] M_detectDnRm2P1_in;
  edge_detector_3 detectDnRm2P1 (
    .clk(clk),
    .in(M_detectDnRm2P1_in),
    .out(M_detectDnRm2P1_out)
  );
  wire [1-1:0] M_detectMoveLP2_out;
  reg [1-1:0] M_detectMoveLP2_in;
  edge_detector_3 detectMoveLP2 (
    .clk(clk),
    .in(M_detectMoveLP2_in),
    .out(M_detectMoveLP2_out)
  );
  wire [1-1:0] M_detectMoveRP2_out;
  reg [1-1:0] M_detectMoveRP2_in;
  edge_detector_3 detectMoveRP2 (
    .clk(clk),
    .in(M_detectMoveRP2_in),
    .out(M_detectMoveRP2_out)
  );
  wire [1-1:0] M_detectUpRm1P2_out;
  reg [1-1:0] M_detectUpRm1P2_in;
  edge_detector_3 detectUpRm1P2 (
    .clk(clk),
    .in(M_detectUpRm1P2_in),
    .out(M_detectUpRm1P2_out)
  );
  wire [1-1:0] M_detectDnRm2P2_out;
  reg [1-1:0] M_detectDnRm2P2_in;
  edge_detector_3 detectDnRm2P2 (
    .clk(clk),
    .in(M_detectDnRm2P2_in),
    .out(M_detectDnRm2P2_out)
  );
  wire [1-1:0] M_detectReset_out;
  reg [1-1:0] M_detectReset_in;
  edge_detector_3 detectReset (
    .clk(clk),
    .in(M_detectReset_in),
    .out(M_detectReset_out)
  );
  wire [1-1:0] M_detectStart_out;
  reg [1-1:0] M_detectStart_in;
  edge_detector_3 detectStart (
    .clk(clk),
    .in(M_detectStart_in),
    .out(M_detectStart_out)
  );
  wire [1-1:0] M_buttonMoveLP1_out;
  reg [1-1:0] M_buttonMoveLP1_in;
  button_conditioner_13 buttonMoveLP1 (
    .clk(clk),
    .in(M_buttonMoveLP1_in),
    .out(M_buttonMoveLP1_out)
  );
  wire [1-1:0] M_buttonMoveRP1_out;
  reg [1-1:0] M_buttonMoveRP1_in;
  button_conditioner_13 buttonMoveRP1 (
    .clk(clk),
    .in(M_buttonMoveRP1_in),
    .out(M_buttonMoveRP1_out)
  );
  wire [1-1:0] M_buttonRemove1P1_out;
  reg [1-1:0] M_buttonRemove1P1_in;
  button_conditioner_13 buttonRemove1P1 (
    .clk(clk),
    .in(M_buttonRemove1P1_in),
    .out(M_buttonRemove1P1_out)
  );
  wire [1-1:0] M_buttonRemove2P1_out;
  reg [1-1:0] M_buttonRemove2P1_in;
  button_conditioner_13 buttonRemove2P1 (
    .clk(clk),
    .in(M_buttonRemove2P1_in),
    .out(M_buttonRemove2P1_out)
  );
  wire [1-1:0] M_buttonMoveLP2_out;
  reg [1-1:0] M_buttonMoveLP2_in;
  button_conditioner_13 buttonMoveLP2 (
    .clk(clk),
    .in(M_buttonMoveLP2_in),
    .out(M_buttonMoveLP2_out)
  );
  wire [1-1:0] M_buttonMoveRP2_out;
  reg [1-1:0] M_buttonMoveRP2_in;
  button_conditioner_13 buttonMoveRP2 (
    .clk(clk),
    .in(M_buttonMoveRP2_in),
    .out(M_buttonMoveRP2_out)
  );
  wire [1-1:0] M_buttonRemove1P2_out;
  reg [1-1:0] M_buttonRemove1P2_in;
  button_conditioner_13 buttonRemove1P2 (
    .clk(clk),
    .in(M_buttonRemove1P2_in),
    .out(M_buttonRemove1P2_out)
  );
  wire [1-1:0] M_buttonRemove2P2_out;
  reg [1-1:0] M_buttonRemove2P2_in;
  button_conditioner_13 buttonRemove2P2 (
    .clk(clk),
    .in(M_buttonRemove2P2_in),
    .out(M_buttonRemove2P2_out)
  );
  wire [1-1:0] M_buttonStart_out;
  reg [1-1:0] M_buttonStart_in;
  button_conditioner_13 buttonStart (
    .clk(clk),
    .in(M_buttonStart_in),
    .out(M_buttonStart_out)
  );
  wire [1-1:0] M_buttonReset_out;
  reg [1-1:0] M_buttonReset_in;
  button_conditioner_13 buttonReset (
    .clk(clk),
    .in(M_buttonReset_in),
    .out(M_buttonReset_out)
  );
  wire [10-1:0] M_randl_out;
  reg [1-1:0] M_randl_enable;
  lfsr_rand_23 randl (
    .clk(clk),
    .rst(rst),
    .enable(M_randl_enable),
    .out(M_randl_out)
  );
  wire [10-1:0] M_randm_out;
  reg [1-1:0] M_randm_enable;
  lfsr_rand_23 randm (
    .clk(clk),
    .rst(rst),
    .enable(M_randm_enable),
    .out(M_randm_out)
  );
  wire [10-1:0] M_randr_out;
  reg [1-1:0] M_randr_enable;
  lfsr_rand_23 randr (
    .clk(clk),
    .rst(rst),
    .enable(M_randr_enable),
    .out(M_randr_out)
  );
  reg [9:0] M_leftstack_d, M_leftstack_q = 10'h3ff;
  reg [9:0] M_middlestack_d, M_middlestack_q = 10'h3ff;
  reg [9:0] M_rightstack_d, M_rightstack_q = 10'h3ff;
  reg [15:0] M_turn_blink_d, M_turn_blink_q = 16'h0000;
  reg [7:0] M_location_blink_d, M_location_blink_q = 8'h00;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_26 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  reg [15:0] M_playerscores_d, M_playerscores_q = 16'h0000;
  wire [120-1:0] M_led_manager_led_output;
  reg [10-1:0] M_led_manager_leftstack;
  reg [10-1:0] M_led_manager_middlestack;
  reg [10-1:0] M_led_manager_rightstack;
  led_manager_27 led_manager (
    .clk(clk),
    .rst(rst),
    .leftstack(M_led_manager_leftstack),
    .middlestack(M_led_manager_middlestack),
    .rightstack(M_led_manager_rightstack),
    .led_output(M_led_manager_led_output)
  );
  reg [119:0] M_led_output_d, M_led_output_q = 120'h000000000000000000000000000000;
  
  
  localparam START_states = 4'd0;
  localparam P1L_states = 4'd1;
  localparam P1M_states = 4'd2;
  localparam P1R_states = 4'd3;
  localparam P1C_states = 4'd4;
  localparam P2L_states = 4'd5;
  localparam P2M_states = 4'd6;
  localparam P2R_states = 4'd7;
  localparam P2C_states = 4'd8;
  
  reg [3:0] M_states_d, M_states_q = START_states;
  
  always @* begin
    M_states_d = M_states_q;
    M_playerscores_d = M_playerscores_q;
    M_middlestack_d = M_middlestack_q;
    M_led_output_d = M_led_output_q;
    M_leftstack_d = M_leftstack_q;
    M_rightstack_d = M_rightstack_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_seg = 8'hff;
    io_sel = 4'hf;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_seg_values = M_playerscores_q;
    M_alu16_a = 16'h0000;
    M_alu16_b = 16'h0000;
    M_alu16_opcode = 6'h00;
    M_led_manager_leftstack = M_leftstack_q;
    M_led_manager_middlestack = M_middlestack_q;
    M_led_manager_rightstack = M_rightstack_q;
    M_led_output_d = M_led_manager_led_output;
    led_strip = 1'h0;
    M_buttonStart_in = io_startgame;
    M_detectStart_in = M_buttonStart_out;
    M_buttonReset_in = io_reset;
    M_detectReset_in = M_buttonReset_out;
    M_buttonMoveLP1_in = io_button[0+3+0-:1];
    M_buttonMoveRP1_in = io_button[0+4+0-:1];
    M_buttonRemove1P1_in = io_button[0+0+0-:1];
    M_buttonRemove2P1_in = io_button[0+2+0-:1];
    M_buttonMoveLP2_in = io_button[5+3+0-:1];
    M_buttonMoveRP2_in = io_button[5+4+0-:1];
    M_buttonRemove1P2_in = io_button[5+0+0-:1];
    M_buttonRemove2P2_in = io_button[5+2+0-:1];
    M_detectMoveLP1_in = M_buttonMoveLP1_out;
    M_detectMoveRP1_in = M_buttonMoveRP1_out;
    M_detectUpRm1P1_in = M_buttonRemove1P1_out;
    M_detectDnRm2P1_in = M_buttonRemove2P1_out;
    M_detectMoveLP2_in = M_buttonMoveLP2_out;
    M_detectMoveRP2_in = M_buttonMoveRP2_out;
    M_detectUpRm1P2_in = M_buttonRemove1P2_out;
    M_detectDnRm2P2_in = M_buttonRemove2P2_out;
    M_randl_enable = 1'h1;
    M_randm_enable = 1'h1;
    M_randr_enable = 1'h1;
    
    case (M_states_q)
      START_states: begin
        M_randl_enable = 1'h1;
        M_randm_enable = 1'h1;
        M_randr_enable = 1'h1;
        M_seg_values = M_playerscores_q;
        M_leftstack_d = M_randl_out;
        M_middlestack_d = M_randm_out;
        M_rightstack_d = M_randr_out;
        if (M_detectStart_out == 1'h1) begin
          M_states_d = P1M_states;
        end else begin
          M_states_d = START_states;
        end
      end
      P1M_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_alu16_a = M_leftstack_q;
          checkEqualsZero = M_alu16_out[0+0-:1];
          if (checkEqualsZero == 1'h1) begin
            M_states_d = P1M_states;
          end else begin
            M_states_d = P1L_states;
          end
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_alu16_a = M_rightstack_q;
            checkEqualsZero = M_alu16_out[0+0-:1];
            if (checkEqualsZero == 1'h1) begin
              M_states_d = P1M_states;
            end else begin
              M_states_d = P1R_states;
            end
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_middlestack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P1M_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_middlestack_d = M_alu16_out;
                M_states_d = P1C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_middlestack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P1M_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_middlestack_d = M_alu16_out;
                  M_states_d = P1C_states;
                end
              end
            end
          end
        end
      end
      P1L_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_states_d = P1L_states;
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_alu16_a = M_middlestack_q;
            checkEqualsZero = M_alu16_out[0+0-:1];
            if (checkEqualsZero == 1'h1) begin
              M_states_d = P1R_states;
              M_alu16_a = M_rightstack_q;
              checkOtherStack = M_alu16_out[0+0-:1];
              if (checkOtherStack == 1'h1) begin
                M_states_d = P1L_states;
              end
            end else begin
              M_states_d = P1M_states;
            end
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_leftstack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P1L_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_leftstack_d = M_alu16_out;
                M_states_d = P1C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_leftstack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P1L_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_leftstack_d = M_alu16_out;
                  M_states_d = P1C_states;
                end
              end
            end
          end
        end
      end
      P1R_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_alu16_a = M_middlestack_q;
          checkEqualsZero = M_alu16_out[0+0-:1];
          if (checkEqualsZero == 1'h1) begin
            M_states_d = P1L_states;
            M_alu16_a = M_leftstack_q;
            checkOtherStack = M_alu16_out[0+0-:1];
            if (checkOtherStack == 1'h1) begin
              M_states_d = P1R_states;
            end
          end else begin
            M_states_d = P1M_states;
          end
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_states_d = P1R_states;
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_rightstack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P1R_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_rightstack_d = M_alu16_out;
                M_states_d = P1C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_rightstack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P1R_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_rightstack_d = M_alu16_out;
                  M_states_d = P1C_states;
                end
              end
            end
          end
        end
      end
      P2M_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_alu16_a = M_leftstack_q;
          checkEqualsZero = M_alu16_out[0+0-:1];
          if (checkEqualsZero == 1'h1) begin
            M_states_d = P2M_states;
          end else begin
            M_states_d = P2L_states;
          end
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_alu16_a = M_rightstack_q;
            checkEqualsZero = M_alu16_out[0+0-:1];
            if (checkEqualsZero == 1'h1) begin
              M_states_d = P2M_states;
            end else begin
              M_states_d = P2R_states;
            end
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_middlestack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P2M_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_rightstack_d = M_alu16_out;
                M_states_d = P2C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_middlestack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P2M_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_rightstack_d = M_alu16_out;
                  M_states_d = P2C_states;
                end
              end
            end
          end
        end
      end
      P2L_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_states_d = P2L_states;
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_alu16_a = M_middlestack_q;
            checkEqualsZero = M_alu16_out[0+0-:1];
            if (checkEqualsZero == 1'h1) begin
              M_states_d = P2R_states;
              M_alu16_a = M_rightstack_q;
              checkOtherStack = M_alu16_out[0+0-:1];
              if (checkOtherStack == 1'h1) begin
                M_states_d = P2L_states;
              end
            end else begin
              M_states_d = P2M_states;
            end
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_leftstack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P2L_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_leftstack_d = M_alu16_out;
                M_states_d = P2C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_leftstack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P2L_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_leftstack_d = M_alu16_out;
                  M_states_d = P2C_states;
                end
              end
            end
          end
        end
      end
      P2R_states: begin
        M_seg_values = M_playerscores_q;
        M_randl_enable = 1'h0;
        M_randm_enable = 1'h0;
        M_randr_enable = 1'h0;
        if (M_detectReset_out == 1'h1) begin
          M_states_d = START_states;
        end
        M_alu16_b = 16'h0001;
        M_alu16_opcode = 6'h37;
        if (M_detectMoveLP1_out == 1'h1) begin
          M_alu16_a = M_middlestack_q;
          checkEqualsZero = M_alu16_out[0+0-:1];
          if (checkEqualsZero == 1'h1) begin
            M_states_d = P2L_states;
            M_alu16_a = M_leftstack_q;
            checkOtherStack = M_alu16_out[0+0-:1];
            if (checkOtherStack == 1'h1) begin
              M_states_d = P2R_states;
            end
          end else begin
            M_states_d = P2M_states;
          end
        end else begin
          if (M_detectMoveRP1_out == 1'h1) begin
            M_states_d = P2R_states;
          end else begin
            if (M_detectUpRm1P1_out == 1'h1) begin
              M_alu16_a = M_rightstack_q;
              M_alu16_b = 16'h0001;
              M_alu16_opcode = 6'h37;
              checkLessThanOne = M_alu16_out;
              if (checkLessThanOne == 16'h0001) begin
                M_states_d = P2R_states;
              end else begin
                M_alu16_opcode = 6'h21;
                M_rightstack_d = M_alu16_out;
                M_states_d = P2C_states;
              end
            end else begin
              if (M_detectDnRm2P1_out == 1'h1) begin
                M_alu16_a = M_rightstack_q;
                M_alu16_b = 16'h0002;
                M_alu16_opcode = 6'h37;
                checkLessThanTwo = M_alu16_out;
                if (checkLessThanTwo == 16'h0001) begin
                  M_states_d = P2R_states;
                end else begin
                  M_alu16_opcode = 6'h21;
                  M_rightstack_d = M_alu16_out;
                  M_states_d = P2C_states;
                end
              end
            end
          end
        end
      end
      P1C_states: begin
        M_alu16_a = M_leftstack_q;
        M_alu16_b = 8'h00;
        M_alu16_opcode = 6'h33;
        if (M_alu16_out && M_middlestack_q == 16'h0000 && M_rightstack_q == 16'h0000) begin
          if (M_playerscores_q[8+3-:4] == 4'h9) begin
            M_playerscores_d[8+3-:4] = 4'h0;
            M_playerscores_d[12+3-:4] = M_playerscores_q[12+3-:4] + 4'h1;
          end else begin
            M_playerscores_d[8+3-:4] = M_playerscores_q[8+3-:4] + 4'h1;
          end
          M_states_d = START_states;
        end else begin
          M_alu16_a = M_leftstack_q;
          M_alu16_b = 8'h01;
          M_alu16_opcode = 6'h37;
          if (M_middlestack_q >= 8'h01) begin
            M_states_d = P2M_states;
          end else begin
            if (!M_alu16_out) begin
              M_states_d = P2L_states;
            end else begin
              M_states_d = P2R_states;
            end
          end
        end
      end
      P2C_states: begin
        M_alu16_a = M_leftstack_q;
        M_alu16_b = 8'h00;
        M_alu16_opcode = 6'h33;
        if (M_alu16_out && M_middlestack_q == 16'h0000 && M_rightstack_q == 16'h0000) begin
          if (M_playerscores_q[0+3-:4] == 4'h9) begin
            M_playerscores_d[0+3-:4] = 1'h0;
            M_playerscores_d[4+3-:4] = M_playerscores_q[4+3-:4] + 4'h1;
          end else begin
            M_playerscores_d[0+3-:4] = M_playerscores_q[0+3-:4] + 4'h1;
          end
          M_states_d = START_states;
        end else begin
          M_alu16_a = M_leftstack_q;
          M_alu16_b = 8'h01;
          M_alu16_opcode = 6'h37;
          if (M_middlestack_q >= 16'h0000) begin
            M_states_d = P2M_states;
          end else begin
            if (!M_alu16_out) begin
              M_states_d = P2L_states;
            end else begin
              M_states_d = P2R_states;
            end
          end
        end
      end
      default: begin
        M_states_d = P1M_states;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_states_q <= 1'h0;
    end else begin
      M_states_q <= M_states_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_leftstack_q <= 10'h3ff;
      M_middlestack_q <= 10'h3ff;
      M_rightstack_q <= 10'h3ff;
      M_turn_blink_q <= 16'h0000;
      M_location_blink_q <= 8'h00;
      M_playerscores_q <= 16'h0000;
      M_led_output_q <= 120'h000000000000000000000000000000;
    end else begin
      M_leftstack_q <= M_leftstack_d;
      M_middlestack_q <= M_middlestack_d;
      M_rightstack_q <= M_rightstack_d;
      M_turn_blink_q <= M_turn_blink_d;
      M_location_blink_q <= M_location_blink_d;
      M_playerscores_q <= M_playerscores_d;
      M_led_output_q <= M_led_output_d;
    end
  end
  
endmodule