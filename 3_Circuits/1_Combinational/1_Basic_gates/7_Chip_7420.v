/*
                   +----------------------+
                   |        7420          |
                   |                      |
   p1a ----------- |                      | ----------- p2a
   p1b ----------- |                      | ----------- p2b
   p1c ----------- |                      | ----------- p2c
   p1d ----------- |                      | ----------- p2d
                   |                      |
                   |      ______          |      ______
                   |     |      \         |     |      \
                   |     | NAND  )o-- p1y |     | NAND  )o-- p2y
                   |     |______/         |     |______/
                   |                      |
                   |        VCC           |
                   |        GND           |
                   +----------------------+

Left Inputs                      Right Inputs

p1a ----\                         /---- p2a
p1b -----\                       /----- p2b
p1c ------)o---- p1y     p2y ----o(------ p2c
p1d -----/                       \----- p2d

        (4-input NAND)       (4-input NAND)

              VCC
               |
             [7420]
               |
              GND
*/
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
  
    assign p1y=~(p1a&p1b&p1c&p1d);
    assign p2y=~(p2a&p2b&p2c&p2d);

endmodule


