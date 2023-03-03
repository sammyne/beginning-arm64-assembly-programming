ARM64GNU=aarch64-none-linux-gnu-

AS=$(ARM64GNU)as
CC=$(ARM64GNU)gcc

QEMU_LD_PREFIX=/opt/gcc-arm/aarch64-none-linux-gnu

srcs = $(shell find $(SRCDIR) -name "*.s")

apps = $(srcs:./%.s=%)

up4debugs = $(apps:%=up4debug-%)
debugs = $(apps:%=debug-%)

.PHONY: all
all: $(apps)

#	$(CC) -gdwarf -o $@.out -no-pie $@.o --static
$(apps): %: %.s
	$(AS) -a=$@.lst -g --gdwarf-5 -o $@.o $^
	$(CC) -gdwarf -o $@.out -no-pie $@.o --static
	qemu-aarch64 ./$@.out

$(up4debugs): up4debug-%: %
	qemu-aarch64 -L $(QEMU_LD_PREFIX) -g 1234 $^.out

$(debugs): debug-%: %
	gdb-multiarch -q --nh \
		-ex 'set architecture aarch64' \
		-ex 'set sysroot /opt/gcc-arm/aarch64-none-linux-gnu' \
		-ex 'file $^.out' \
		-ex 'target remote localhost:1234'


.PHONY: clean
clean:
	rm -f *.lst *.o *.out
