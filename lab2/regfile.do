add wave din
add wave reset
add wave clk
add wave write
add wave read_a
add wave read_b
add wave write_address
add wave out_a
add wave out_b

force reset '1'
run 1

force din X"FFFFFFFF"
force clk '0'
force write '1'
force write_address X"5"
force reset '0'
force read_a X"5"
force read_b X"4"
run 2

force clk '1'
run 2

force clk '0'
force din X"FFFF0001"
force write '0'
force write_address X"4"
run 2

force clk '1'
run 2

force write '1'
force clk '0'
run 2

force clk '1'
run 2

force clk '0'
force read_a X"1F"
run 2

force read_a X"4"
run 2

force clk '1'
force reset '1'
force read_a X"5"
run 2
