FLAGS= -D VERBOSE


wave: run
	#sleep 2 && gtkwave gresult.gtkw &

run: compile
	./a.out

compile:
	iverilog $(FLAGS) arbiter.v wb_snoop_arbiter_tb.v
