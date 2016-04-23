

CONTENT OF THE PROJECT

def -> folder that contains default stuff (the base example. It's a helloworld)

build -> where the all the stuff is compiled. Every time you run compile script this folder is destroyed and rebuilt. You can change the build directory in the Makefile

src -> where source (verilog and c) files are stored. For this project probably only files contained in src/mor1kx* will be modified. Symbolic links for linux are inserted in the root. In this way is easy to reach:
- The main testbench (orpsoc_tb.v) which is used to load the elf file
- The source files of the mor1kx architecture in the src/mor1kx/rtl/verilog folder

file_list.scr -> file that tells iverilog where to find source files. DO NOT TOUCH IT UNLESS YOU KNOW WHAT YOU'RE DOING


RULES OF THE MAKEFILE

compile [default] : compile the code. See the results in the build directory

trace : compile the code and run gtwave to show the trace.vcd file generated into the build directory

clean : remove the build directory