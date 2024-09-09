module seq( output reg x,
  output reg y,
  output reg [1:0] w,
           output reg [1:0] z);
  initial
    begin
      x = 1'b0;
      #5 y = 1'b1;
      #10 w = {x,y};
      #20 z = {y,x};
    end
endmodule

module tb;
  wire x,y;
  wire [1:0] w,z;
  seq uut (x,y,w,z);
  initial 
    begin
      $monitor("time = %0t:x = %b, y = %b, w = %b, z = %b",$time,x,y,w,z);
    end
endmodule

# time = 0:x = 0, y = x, w = xx, z = xx
# time = 5:x = 0, y = 1, w = xx, z = xx
# time = 15:x = 0, y = 1, w = 01, z = xx
# time = 35:x = 0, y = 1, w = 01, z = 10





fork-join



module seq( output reg x,
  output reg y,
  output reg [1:0] w,
           output reg [1:0] z);
  initial
    fork
      x = 1'b0;
      #5 y = 1'b1;
      #10 w = {x,y};
      #20 z = {y,x};
    join
endmodule


module tb;
  wire x,y;
  wire [1:0] w,z;
  seq uut (x,y,w,z);
  initial 
    begin
      $monitor("time = %0t:x = %b, y = %b, w = %b, z = %b",$time,x,y,w,z);
    end
endmodule

# time = 0:x = 0, y = x, w = xx, z = xx
# time = 5:x = 0, y = 1, w = xx, z = xx
# time = 10:x = 0, y = 1, w = 01, z = xx
# time = 20:x = 0, y = 1, w = 01, z = 10
