#include <assert.h>
#include <unistd.h>
#include <stdio.h>
#include "disastrOS.h"
#include "disastrOS_syscalls.h"
#include "disastrOS_descriptor.h"

void internal_terminate(){
	int vict_pid=(int)running->syscall_args[0];
	PCBPtr* vict_ptr=0;
	PCB* aux=running;
	if(running->children.size){
		vict_ptr=PCBPtr_byPID(&running->children, vict_pid);
	}
	while(aux->parent!=NULL && vict_ptr==0){
		vict_ptr=PCBPtr_byPID(&running->parent->children, vict_pid);
		aux=aux->parent;
	}
	if(vict_ptr==0){
		running->syscall_retvalue=DSOS_ETERMINATE;
		return;
	}
	PCB* vict=vict_ptr->pcb; 
	
	vict->signals = DSOS_SIGHTRMNT;

	 
	return;
}

 