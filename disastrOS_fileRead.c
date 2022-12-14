#include "disastrOS_syscalls.h"
#include <stdio.h>
#include <dlfcn.h>
void internal_fileRead(){
	void* handle;
	
	handle=dlopen("libdisastrOS.so",RTLD_LAZY);
	 if (!handle) {
		running->syscall_retvalue=DSOS_EFILEREAD;
		return;
	 }
	
      void (**func)(void (*f)(void*), void* args)=(void (**)(void (*)(void*), void* ))running->syscall_args[0];
	
	 
	*func=(void (*)(void (*)(void*), void* ))dlsym(handle,"disastrOS_spawn");	
	
	if (!func) {
        /* no such symbol */
	    dlclose(handle);
		running->syscall_retvalue=DSOS_EFILEREAD;
	    return;
	}
	
	
	dlclose(handle);
	
	return;
}