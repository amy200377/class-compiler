################################################################################
#
# Makefile @[src/riscv_recursive]
#
################################################################################

default: run



################################################################################
#
# project environment
#
################################################################################

updir1 = $(abspath $(PWD)/..)
updir2 = $(abspath $(updir1)/..)
updir3 = $(abspath $(updir2)/..)
updir4 = $(abspath $(updir3)/..)

PROJHOME ?= $(updir2)

TOOL_INSTALL_ROOT = /home/amy/rocket/



################################################################################
#
# RISC-V tool-chain environment
#
################################################################################

ROCKET_TOOLS_ROOT = $(TOOL_INSTALL_ROOT)/rocket-tools

ROCKET_TOOLS_BIN = $(ROCKET_TOOLS_ROOT)/_install/bin
ROCKET_TOOL_PREFIX ?= riscv64-unknown-elf

GCC = $(ROCKET_TOOLS_BIN)/$(ROCKET_TOOL_PREFIX)-gcc
OBJDUMP = $(ROCKET_TOOLS_BIN)/$(ROCKET_TOOL_PREFIX)-objdump

SPIKE = $(ROCKET_TOOLS_BIN)/spike


################################################################################
#
# compilation rules
#
################################################################################

COMPILE_TARGETS += test.exe test.s test.dis

C_SRC_FILES += $(wildcard *.c)

OBJFILES += $(C_SRC_FILES:.c=.o)

%.s: %.c
	$(GCC) -S $^ -o $@

%.o: %.c
	$(GCC) -c $^ -o $@

%.dis: %.exe
	$(OBJDUMP) -d $^ > $@

%.exe: $(OBJFILES)
	$(GCC) $(OBJFILES) -o $@

compile: $(COMPILE_TARGETS)

compile.clean:
	rm -f *.o *.s *.exe *.dis



################################################################################
#
# simulation rules
#
################################################################################

SIM_TARGETS += test.out

%.out: %.exe
	$(SPIKE) pk $^ > $@

sim: $(SIM_TARGETS)

sim.clean:
	rm -f *.out



################################################################################
#
# user interface
#
################################################################################

TASKS += compile sim

TARGETS += $(COMPILE_TARGETS) $(SIM_TARGETS)
CLEAN_TARGETS += $(addsuffix .clean, $(TASKS))

run: $(TARGETS)

clean: $(CLEAN_TARGETS)

