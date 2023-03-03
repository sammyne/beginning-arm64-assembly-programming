ARM64GNU=aarch64-none-linux-gnu-

AS=$(ARM64GNU)as
CC=$(ARM64GNU)gcc

srcs = $(shell find $(SRCDIR) -name "*.s")

apps = $(srcs:./%.s=%)

up4debugs = $(apps:%=up4debug-%)
debugs = $(apps:%=debug-%)

.PHONY: all
all: $(apps)

$(apps): %: %.s
	$(AS) -a=$@.lst -g --gdwarf-5 -o $@.o $^
	$(CC) -gdwarf -o $@.out -no-pie $@.o --static
	qemu-aarch64 ./$@.out

# ref: https://stackoverflow.com/a/51310791/10878967
$(up4debugs): up4debug-%: %
	qemu-aarch64 -g 1234 $^.out

# ref: https://stackoverflow.com/a/51310791/10878967
#  sysroot seems to be not required
#		-ex 'set sysroot /opt/gcc-arm/aarch64-none-linux-gnu' \ 
$(debugs): debug-%: %
	gdb-multiarch -q --nh 							\
		-ex 'set architecture aarch64' 		\
		-ex 'file $^.out' 								\
		-ex 'target remote localhost:1234'

.PHONY: clean
clean:
	rm -f *.lst *.o *.out
