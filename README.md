# SO_P Disastros OpenProcess
Per compilare ed eseguire il programma: 

make

export LD_LYBRARY_PATH=${PWD}

./disastrOS_test


Il progetto richiedeva l'implementazione di una syscall che, dato un file .so al cui interno è definita una funzione, leggesse tramite dlopen un simbolo.
In questo caso il simbolo letto è "disastrOS_spawn" che ci fornisce un puntatore a funzione proprio alla syscall spawn.

#disastrOS_fileRead
Il file .so, che viene generato dal makefile è libdisastrOS.so .
L'implementazione della syscall, che legge in libdisastrOS.so è nel file disastrOSfileRead.c.La syscall prende come argomento un puntatore a funzione compatibile con la 
disastrOS_spawn in cui verrà salvato il puntatore ottenuto grazie alla funzione dlopen(). 
A quel punto possiamo lanciare nel test la funzione tramite il puntatore alla syscall spawn.

#disastrOS_terminate
La seconda richiesta era l'implementazione di una syscall terminate che permetteva di usccidere un thread.
Tale funzione si trova nel file disastrOS_terminate.c. La funzione prende come argomento il pid del processo da terminare, verifica se esiste, infine manda un segnale
al processo, svegliandolo se in waiting. Ricevuto il segnale, il processo effettua una exit e termina.
     
