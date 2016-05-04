MAKEDIR="makeDir"
BUILDIR="build"
EXECUTABLE=""
SRC="def/test.c"

synthesys: 
	bash $(MAKEDIR)/compile $(BUILDIR) $(EXECUTABLE) 

trace: synthesys
	gtkwave $(BUILDIR)/trace.vcd &

clean:
	rm -r $(BUILDIR) 
