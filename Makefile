CUDA_TOOLKIT := $(shell dirname $$(command -v nvcc))/..
INC          := -I$(CUDA_TOOLKIT)/include
LIBS         := -lcusparse

all: spmm_blockedell_example

spmm_blockedell_example: spmm_blockedell_example.cpp
	nvcc $(INC) spmm_blockedell_example.cpp -o spmm_blockedell_example $(LIBS)
	gcc mmio.h 

clean:
	rm -f spmm_blockedell_example

test:
	@echo "\n==== SpMM BLOCKED ELL Test ====\n"
	./spmm_blockedell_example

.PHONY: clean all test
