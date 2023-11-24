CC = $(if $(shell which clang),clang,gcc)
CFLAGS= -O3 -pedantic -Wall -Wextra -std=c99
CBMC = cbmc
TARGET = sha256

.PHONY: clean verify

$(TARGET).o: sha256.c sha256.h
	$(CC) $(CFLAGS) -c -o $@ $<

test: sha256.c sha256.h
	$(CC) $(CFLAGS) -o $(TARGET) -DSHA256_SELF_TEST__ $<

all: test $(TARGET)

clean:
	rm -f $(TARGET) *.o

verify:
	$(CBMC) sha256.c -DSHA256_SELF_TEST__ -D_cbmc_ $(if $(FUNC),--function $(FUNC),) \
		--unwind 64 --partial-loops \
		--bounds-check \
		--memory-leak-check --malloc-may-fail --malloc-fail-null \
		--pointer-check --pointer-primitive-check --pointer-overflow-check \
		--div-by-zero-check --conversion-check \
		--signed-overflow-check --unsigned-overflow-check \
		--undefined-shift-check --float-overflow-check
