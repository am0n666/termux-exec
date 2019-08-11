CFLAGS += -Wall -Wextra -Werror -Oz

libtermux-exec.so: termux-exec.c
	$(CC) $(CFLAGS) termux-exec.c -shared -fPIC -o libtermux-exec.so

install: libtermux-exec.so
	install libtermux-exec.so /data/data/amon/lib/libtermux-exec.so

uninstall:
	rm -f /data/data/amon/lib/libtermux-exec.so

test: libtermux-exec.so
	@LD_PRELOAD=${CURDIR}/libtermux-exec.so ./run-tests.sh

clean:
	rm -f libtermux-exec.so tests/*-actual

.PHONY: clean install test uninstall
