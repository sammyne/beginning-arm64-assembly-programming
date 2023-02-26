ARM64GNU=aarch64-none-linux-gnu-

AS=$(ARM64GNU)as
CC=$(ARM64GNU)gcc

srcs = $(shell find $(SRCDIR) -name "*.s")

apps = $(srcs:./%.s=%)

.PHONY: all
all: $(apps)

$(apps): %: %.s
	$(AS) -a=$@.lst -g --gdwarf-2 -o $@.o $^
	$(CC) -gdwarf -o $@.out -no-pie $@.o --static
	qemu-aarch64 ./$@.out

.PHONY: clean
clean:
	rm -f *.lst *.o *.out *.cpio.gz