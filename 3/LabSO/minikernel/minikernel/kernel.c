/*	
 *  kernel/kernel.c
 *
 *  Minikernel. Versi�n 1.0
 *
 *  Fernando P�rez Costoya
 *
 */

/*
 *
 * Fichero que contiene la funcionalidad del sistema operativo
 *
 */

#include "kernel.h"	/* Contiene defs. usadas por este modulo */

/*
 *
 * Funciones relacionadas con la tabla de procesos:
 *	iniciar_tabla_proc buscar_BCP_libre
 *
 */

/*
 * Funci�n que inicia la tabla de procesos
 */
static void iniciar_tabla_proc(){
	int i;

	for (i=0; i<MAX_PROC; i++){
		tabla_procs[i].estado=NO_USADA;
      
    }
}

/*
 * Funci�n que busca una entrada libre en la tabla de procesos
 */
static int buscar_BCP_libre(){
	int i;

	for (i=0; i<MAX_PROC; i++)
		if (tabla_procs[i].estado==NO_USADA)
			return i;
	return -1;
}

/*
 *
 * Funciones que facilitan el manejo de las listas de BCPs
 *	insertar_ultimo eliminar_primero eliminar_elem
 *
 * NOTA: PRIMERO SE DEBE LLAMAR A eliminar Y LUEGO A insertar
 */

/*
 * Inserta un BCP al final de la lista.
 */
static void insertar_ultimo(lista_BCPs *lista, BCP * proc){
	printk("insertar_ultimo()");
    if (lista->primero==NULL)
		lista->primero= proc;
	else
		lista->ultimo->siguiente=proc;
	lista->ultimo= proc;
	proc->siguiente=NULL;
}

/*
 * Elimina el primer BCP de la lista.
 */
static void eliminar_primero(lista_BCPs *lista){
    printk("eliminar_primero()");
	if (lista->ultimo==lista->primero)
		lista->ultimo=NULL;
	lista->primero=lista->primero->siguiente;
}

/*
 * Elimina un determinado BCP de la lista.
 */
static void eliminar_elem(lista_BCPs *lista, BCP * proc){
    printk("eliminar_elem()");
	BCP *paux=lista->primero;

	if (paux==proc)
		eliminar_primero(lista);
	else {
		for ( ; ((paux) && (paux->siguiente!=proc));
			paux=paux->siguiente);
		if (paux) {
			if (lista->ultimo==paux->siguiente)
				lista->ultimo=paux;
			paux->siguiente=paux->siguiente->siguiente;
		}
	}
}



/*
 *
 * Funciones relacionadas con la planificacion
 *	espera_int planificador
 */

/*
 * Espera a que se produzca una interrupcion
 */
static void espera_int(){
	printk("espera_int()");
    int nivel;

	//printk("-> NO HAY LISTOS. ESPERA INT\n");

	/* Baja al m�nimo el nivel de interrupci�n mientras espera */
	nivel=fijar_nivel_int(NIVEL_1);
	halt();
	fijar_nivel_int(nivel);
}

/*
 * Funci�n de planificacion que implementa un algoritmo FIFO.
 */
static BCP * planificador(){
	printk("planificador()");
    TICKS_restantes=TICKS_RODAJA;
	while (lista_listos.primero==NULL)
		espera_int();		/* No hay nada que hacer */
	return lista_listos.primero;
}


/*
 * Funci�n para bloquear un proceso
 */
static void bloquear_proceso()
{
	printk("bloquear_proceso()");
    BCP *p_proc_anterior;
    int interrupcion=fijar_nivel_int(3);
    
    p_proc_actual->estado=BLOQUEADO; //cambiamos el estado a BLOQUEADO
    eliminar_primero(&lista_listos);//lo quitamos de la lista de listos
    insertar_ultimo(&lista_bloqueados, p_proc_actual);//ponemos el proceso en la lista de
                                                      //bloqueados
    p_proc_anterior=p_proc_actual;//lo ponemos como proceso anterior
    p_proc_actual=planificador();//conseguimos el siguiente proceso que le toca

    peticion_de_bloqueo=0;
    fijar_nivel_int(interrupcion);
    cambio_contexto(&(p_proc_anterior->contexto_regs),&(p_proc_actual->contexto_regs));
       //cambiamos de contexto al siguiente proceso
    //aqui no deberia llegar
    return; 
}

static void cambiar_proceso()
{
	printk("cambiar_proceso()");
    BCP *p_proc_anterior;
    int interrupcion=fijar_nivel_int(3);
    
    p_proc_actual->estado=BLOQUEADO; //cambiamos el estado a BLOQUEADO
    eliminar_primero(&lista_listos);//lo quitamos de la lista de listos
    insertar_ultimo(&lista_listos, p_proc_actual);//ponemos el proceso en la lista de
                                                      //bloqueados
    p_proc_anterior=p_proc_actual;//lo ponemos como proceso anterior
    p_proc_actual=planificador();//conseguimos el siguiente proceso que le toca

    peticion_de_cambio=0;
    fijar_nivel_int(interrupcion);
    cambio_contexto(&(p_proc_anterior->contexto_regs),&(p_proc_actual->contexto_regs));
}
static void pedir_cambiar_proceso()
{
    printk("pedir_cambiar_proceso()");
    peticion_de_cambio=1;
    activar_int_SW();
}

/*
 * Funci�n para desbloquear un proceso
 */
static void desbloquear_proceso(BCP *p_proc)
{
    printk("desbloquear_proceso()");
    int interrupcion=fijar_nivel_int(3);
    p_proc->estado=LISTO;
    eliminar_elem(&lista_bloqueados,p_proc);
    insertar_ultimo(&lista_listos,p_proc);
    fijar_nivel_int(interrupcion);
    return;
}

/*
 * Comprobamos si los procesos bloqueados pueden despertarse ya.

 */
static void comprobar_despertadores(){
    printk("comprobar_despertadores()");
    BCP *p_proc_comprobando,*temp;
    p_proc_comprobando=lista_bloqueados.primero;
    while (p_proc_comprobando!=NULL)
    {
        if(p_proc_comprobando->despertar)
            p_proc_comprobando->despertar-=1;
        printk("->RSI reloj- depertar del id %d es %d\n",p_proc_comprobando->id,p_proc_comprobando->despertar);
        if(!p_proc_comprobando->despertar)
        {
            temp=p_proc_comprobando->siguiente;
            desbloquear_proceso(p_proc_comprobando);
            p_proc_comprobando=temp;
        }
        else
            p_proc_comprobando=p_proc_comprobando->siguiente;
    }
    return ;
}


/*
 *
 * Comprobamos rodajas del round robin
 *
 */
static void comprobar_rodaja()
{
    printk("comprobar_rodaja()");
    BCP *p_proc_anterior;
    if (p_proc_actual->estado!=BLOQUEADO&&p_proc_actual->estado!=TERMINADO)
    {
        TICKS_restantes-=1;
        printk("A %d le quedan %d TICKS restantes\n",p_proc_actual->id,TICKS_restantes);

        if (TICKS_restantes<1)
        {
            printk("A %d se le han acabado los TICKS, cambiando al siguiente proceso"\
                " id ",p_proc_actual->id,TICKS_restantes);
            pedir_cambiar_proceso();
/*            p_proc_anterior=p_proc_actual;
            eliminar_primero(&lista_listos);
            insertar_ultimo(&lista_listos,p_proc_anterior);
            p_proc_actual=planificador();
            printk("%d\n",p_proc_actual->id);
            cambio_contexto(&(p_proc_anterior->contexto_regs),&(p_proc_actual->contexto_regs));
*/        }
    }
    return;
}


/*
 *
 * Funcion auxiliar que termina proceso actual liberando sus recursos.
 * Usada por llamada terminar_proceso y por rutinas que tratan excepciones
 *
 */
static void liberar_proceso(){
    printk("liberar_proceso()");
	BCP * p_proc_anterior;

	liberar_imagen(p_proc_actual->info_mem); /* liberar mapa */

	p_proc_actual->estado=TERMINADO;
	eliminar_primero(&lista_listos); /* proc. fuera de listos */

	/* Realizar cambio de contexto */
	p_proc_anterior=p_proc_actual;
	p_proc_actual=planificador();

	printk("-> C.CONTEXTO POR FIN: de %d a %d\n",
			p_proc_anterior->id, p_proc_actual->id);

	liberar_pila(p_proc_anterior->pila);
	cambio_contexto(NULL, &(p_proc_actual->contexto_regs));
        return; /* no deber�a llegar aqui */
}

/*
 *
 * Funciones relacionadas con el tratamiento de interrupciones
 *	excepciones: exc_arit exc_mem
 *	interrupciones de reloj: int_reloj
 *	interrupciones del terminal: int_terminal
 *	llamadas al sistemas: llam_sis
 *	interrupciones SW: int_sw
 *
 */

/*
 * Tratamiento de excepciones aritmeticas
 */
static void exc_arit(){
    printk("exc_arit()");
	if (!viene_de_modo_usuario())
		panico("excepcion aritmetica cuando estaba dentro del kernel\n");


	printk("-> EXCEPCION ARITMETICA EN PROC %d\n", p_proc_actual->id);
	liberar_proceso();

        return; /* no deber�a llegar aqui */
}

/*
 * Tratamiento de excepciones en el acceso a memoria
 */
static void exc_mem(){
    printk("exc_mem()");
	if (!viene_de_modo_usuario())
		panico("excepcion de memoria cuando estaba dentro del kernel\n");


	printk("-> EXCEPCION DE MEMORIA EN PROC %d\n", p_proc_actual->id);
	liberar_proceso();

        return; /* no deber�a llegar aqui */
}

/*
 * Tratamiento de interrupciones de terminal
 */
static void int_terminal(){
    printk("int_terminal()");
	printk("-> TRATANDO INT. DE TERMINAL %c\n", leer_puerto(DIR_TERMINAL));

        return;
}

/*
 * Tratamiento de interrupciones de reloj
 */
static void int_reloj(){
    printk("int_reloj()");
    int interrupcion=fijar_nivel_int(NIVEL_3);
	printk("-> TRATANDO INT. DE RELOJ\n");
    comprobar_rodaja();
    comprobar_despertadores();
    fijar_nivel_int(interrupcion);
    return;
}

/*
 * Tratamiento de llamadas al sistema
 */
static void tratar_llamsis(){
    printk("tratar_llamsis()");
	int nserv, res;

	nserv=leer_registro(0);
	if (nserv<NSERVICIOS)
		res=(tabla_servicios[nserv].fservicio)();
	else
		res=-1;		/* servicio no existente */
	escribir_registro(0,res);
	return;
}

/*
 * Tratamiento de interrupciuones software
 */
static void int_sw(){
    printk("int_sw()");
	printk("-> TRATANDO INT. SW\n");
    if (peticion_de_cambio)
        cambiar_proceso();
	return;
}

/*
 *
 * Funcion auxiliar que crea un proceso reservando sus recursos.
 * Usada por llamada crear_proceso.
 *
 */
static int crear_tarea(char *prog){
    printk("crear_tarea()");

	void * imagen, *pc_inicial;
	int error=0;
	int proc;
	BCP *p_proc;

	proc=buscar_BCP_libre();
	if (proc==-1)
		return -1;	/* no hay entrada libre */

	/* A rellenar el BCP ... */
	p_proc=&(tabla_procs[proc]);

	/* crea la imagen de memoria leyendo ejecutable */
	imagen=crear_imagen(prog, &pc_inicial);
	if (imagen)
	{
		p_proc->info_mem=imagen;
		p_proc->pila=crear_pila(TAM_PILA);
		fijar_contexto_ini(p_proc->info_mem, p_proc->pila, TAM_PILA,
			pc_inicial,
			&(p_proc->contexto_regs));
		p_proc->id=proc;
		p_proc->estado=LISTO;

		/* lo inserta al final de cola de listos */
		insertar_ultimo(&lista_listos, p_proc);
		error= 0;
	}
	else
		error= -1; /* fallo al crear imagen */

	return error;
}

/*
 *
 * Rutinas que llevan a cabo las llamadas al sistema
 *	sis_crear_proceso sis_escribir
 *
 */

/*
 * Tratamiento de llamada al sistema crear_proceso. Llama a la
 * funcion auxiliar crear_tarea sis_terminar_proceso
 */
int sis_crear_proceso(){
    printk("sis_crear_proceso()");
	char *prog;
	int res;

	printk("-> PROC %d: CREAR PROCESO\n", p_proc_actual->id);
	prog=(char *)leer_registro(1);
	res=crear_tarea(prog);
	return res;
}

/*
 * Tratamiento de llamada al sistema escribir. Llama simplemente a la
 * funcion de apoyo escribir_ker
 */
int sis_escribir()
{
    printk("sis_escribir()");
	char *texto;
	unsigned int longi;

	texto=(char *)leer_registro(1);
	longi=(unsigned int)leer_registro(2);

	escribir_ker(texto, longi);
	return 0;
}

/*
 * Tratamiento de llamada al sistema terminar_proceso. Llama a la
 * funcion auxiliar liberar_proceso
 */
int sis_terminar_proceso(){
    printk("sis_terminar_proceso()");

	printk("-> FIN PROCESO %d\n", p_proc_actual->id);

	liberar_proceso();

        return 0; /* no deber�a llegar aqui */
}

/*
 *
 * Rutina de inicializaci�n invocada en arranque
 *
 */
int main(){
    printk("main()");

	/* se llega con las interrupciones prohibidas */
	iniciar_tabla_proc();

	instal_man_int(EXC_ARITM, exc_arit); 
	instal_man_int(EXC_MEM, exc_mem); 
	instal_man_int(INT_RELOJ, int_reloj); 
	instal_man_int(INT_TERMINAL, int_terminal); 
	instal_man_int(LLAM_SIS, tratar_llamsis); 
	instal_man_int(INT_SW, int_sw); 
	

	iniciar_cont_int();		/* inicia cont. interr. */
	iniciar_cont_reloj(TICK);	/* fija frecuencia del reloj */
	iniciar_cont_teclado();		/* inici cont. teclado */

	/* crea proceso inicial */
	if (crear_tarea((void *)"init")<0)
		panico("no encontrado el proceso inicial\n");
	
	/* activa proceso inicial */
	p_proc_actual=planificador();
	cambio_contexto(NULL, &(p_proc_actual->contexto_regs));
	panico("S.O. reactivado inesperadamente\n");
	return 0;
}

/*
 * Nueva rutina de la pr�ctica 1
 *
 *
 */
int sis_obtener_pid(){
    printk("sis_obtener_pid()");
	return p_proc_actual->id;
}


int sis_dormir(){
    printk("sis_dormir()");
    
	unsigned int longi;

	longi=(unsigned int)leer_registro(1); //leemos el tiempo que hay que dormir
    p_proc_actual->despertar=longi*TICK; //ponemos el valor en despertar
    printk("despertar de %d es %d\n",p_proc_actual->id, p_proc_actual->despertar);
    bloquear_proceso();
    return 0;//Aqui no se llega
}
