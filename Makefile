CC=gcc
CCOPTS=--std=gnu99 -Wall -fPIC
AR=ar

HEADERS=disastrOS.h\
	disastrOS_constants.h\
	disastrOS_descriptor.h\
	disastrOS_globals.h\
	disastrOS_pcb.h\
	disastrOS_resource.h\
	disastrOS_syscalls.h\
	disastrOS_timer.h\
	linked_list.h\
	pool_allocator.h\

OBJS=pool_allocator.o\
     linked_list.o\
     disastrOS_timer.o\
     disastrOS_pcb.o\
     disastrOS_resource.o\
     disastrOS_descriptor.o\
     disastrOS.o\
     disastrOS_fork.o\
     disastrOS_wait.o\
     disastrOS_spawn.o\
     disastrOS_exit.o\
     disastrOS_shutdown.o\
     disastrOS_schedule.o\
     disastrOS_preempt.o\
     disastrOS_sleep.o\
     disastrOS_open_resource.o\
     disastrOS_close_resource.o\
     disastrOS_destroy_resource.o\
	 disastrOS_fileRead.o\
	 disastrOS_terminate.o

LIBS=libdisastrOS.a
LIB=libdisastrOS.so
BINS=disastrOS_test

#disastros_test

.phony: clean all


all:	$(LIB) $(BINS)

%.o:	%.c $(HEADERS)
	$(CC) $(CCOPTS) -c -o $@  $<

libdisastrOS.so: $(OBJS) $(HEADERS)
	gcc -shared -o $@ $^


disastrOS_test:		disastrOS_test.c $(LIB)
	$(CC) $(CCOPTS) -o $@ $^ -ldl

clean:
	rm -rf *.o *.so *~ $(LIB) $(LIBS) $(BINS)
