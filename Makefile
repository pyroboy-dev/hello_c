# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = cc                        # compiler to use

LINKERFLAG = -lm

SRCS := $(wildcard *.c)
BINS := $(SRCS:%.c=%)

all: ${BINS}

%: %.o
	@echo "Linking..."
	${CC} ${LINKERFLAG} $< -o $@

%.o: %.c
	@echo "Compiling.."
	${CC} -c -Wall $<

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${BINS}
