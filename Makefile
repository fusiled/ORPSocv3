MAKEDIR="makeDir"
BUILDIR="build"

compile:
	bash $(MAKEDIR)/compile $(BUILDIR)

trace: compile
	gtkwave $(BUILDIR)/trace.vcd

clean:
	rm -r $(BUILDIR) 
