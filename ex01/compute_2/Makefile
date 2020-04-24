################################################################################
#
# Makefile @[LLVM_IR]
#
################################################################################

default: all



################################################################################
#
# project environment
#
################################################################################

#detect upper directories
updir1 = $(abspath $(PWD)/..)
updir2 = $(abspath $(updir1)/..)
updir3 = $(abspath $(updir2)/..)
updir4 = $(abspath $(updir3)/..)
updir5 = $(abspath $(updir4)/..)

#set project environment
export PROJHOME = $(updir2)



################################################################################
#
# LLVM compilation rules
#
################################################################################

#clang setup
CLANG = clang
CLANG_OPT += -c -emit-llvm

#to enable code transform by opt
CLANG_OPT += -Xclang -disable-O0-optnone

#llvm tools
OPT = opt
DIS = llvm-dis

COMPILE_TARGETS += compute.ll compute.pst.png

%.bc: %.c
	$(CLANG) $(CLANG_OPT) $*.c -o $@

%.ll: %.bc
	$(DIS) $^ -o $@

%.pst.dot: %.bc
	$(OPT) -dot-regions $^ -o $@
	mv reg.compute.dot $@

%.fig: %.dot
	dot -Tfig $^ > $@

%.png: %.dot
	dot -Tpng $^ > $@

compile: $(COMPILE_TARGETS)

compile.clean:
	rm -f *.bc *.ll *.dot *.fig *.png



################################################################################
#
# user interface
#
################################################################################

TARGETS += compile
CLEAN_TARGETS += $(addsuffix .clean, $(TARGETS))

all: $(TARGETS)

clean: $(CLEAN_TARGETS)
