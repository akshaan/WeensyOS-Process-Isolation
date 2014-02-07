
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 a0 02 00 00       	call   1002b9 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 54             	imul   $0x54,%edx,%eax
  1000a4:	83 b8 58 92 10 00 01 	cmpl   $0x1,0x109258(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 10 92 10 00       	add    $0x109210,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 19 04 00 00       	call   1004d4 <run>

001000bb <interrupt>:

static pid_t do_fork(process_t *parent);
static pid_t do_thread(void(*start_function)(void),process_t *parent);
void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

static pid_t do_fork(process_t *parent);
static pid_t do_thread(void(*start_function)(void),process_t *parent);
void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 2c             	sub    $0x2c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d b8 9f 10 00    	mov    0x109fb8,%ebx

static pid_t do_fork(process_t *parent);
static pid_t do_thread(void(*start_function)(void),process_t *parent);
void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 40          	mov    0x40(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 06             	cmp    $0x6,%eax
  1000e1:	0f 87 d0 01 00 00    	ja     1002b7 <interrupt+0x1fc>
  1000e7:	ff 24 85 8c 0a 10 00 	jmp    *0x100a8c(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
  1000f0:	89 43 20             	mov    %eax,0x20(%ebx)
  1000f3:	e9 b6 01 00 00       	jmp    1002ae <interrupt+0x1f3>
		run(current);
  1000f8:	b8 ac 92 10 00       	mov    $0x1092ac,%eax
  1000fd:	ba 01 00 00 00       	mov    $0x1,%edx
	int flag = 0;
	pid_t child_pid;     
 
	for(i = 1;i<NPROCS;i++)
	{
		if(proc_array[i].p_state == P_EMPTY) {	//Empty proc found,
  100102:	83 38 00             	cmpl   $0x0,(%eax)
  100105:	74 0e                	je     100115 <interrupt+0x5a>
	
	int i;
	int flag = 0;
	pid_t child_pid;     
 
	for(i = 1;i<NPROCS;i++)
  100107:	42                   	inc    %edx
  100108:	83 c0 54             	add    $0x54,%eax
  10010b:	83 fa 10             	cmp    $0x10,%edx
  10010e:	75 f2                	jne    100102 <interrupt+0x47>
  100110:	83 ca ff             	or     $0xffffffff,%edx
  100113:	eb 6a                	jmp    10017f <interrupt+0xc4>
	}

	if(flag == 0)
	return -1;
	
 	proc_array[child_pid].p_registers = parent->p_registers; // set child regs	
  100115:	6b ea 54             	imul   $0x54,%edx,%ebp
  100118:	b9 11 00 00 00       	mov    $0x11,%ecx
  10011d:	8d 73 04             	lea    0x4(%ebx),%esi
  100120:	8d 85 10 92 10 00    	lea    0x109210(%ebp),%eax
  100126:	89 c7                	mov    %eax,%edi
  100128:	83 c7 04             	add    $0x4,%edi
  10012b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
  10012d:	8b b5 10 92 10 00    	mov    0x109210(%ebp),%esi
	}

	if(flag == 0)
	return -1;
	
 	proc_array[child_pid].p_registers = parent->p_registers; // set child regs	
  100133:	89 44 24 0c          	mov    %eax,0xc(%esp)
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
  100137:	8b 03                	mov    (%ebx),%eax
	src_stack_bottom = src->p_registers.reg_esp;
  100139:	8b 4b 40             	mov    0x40(%ebx),%ecx
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
  10013c:	c1 e6 12             	shl    $0x12,%esi
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
  10013f:	83 c0 0a             	add    $0xa,%eax
  100142:	c1 e0 12             	shl    $0x12,%eax
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
  100145:	8d b4 0e 00 00 28 00 	lea    0x280000(%esi,%ecx,1),%esi

	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	size_t size = src_stack_top - src_stack_bottom;
	memcpy((void*)dest_stack_bottom,(void*)src_stack_bottom,size);
  10014c:	57                   	push   %edi
	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (src->p_pid * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (dest->p_pid * PROC_STACK_SIZE);
	dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
  10014d:	29 c6                	sub    %eax,%esi

	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	size_t size = src_stack_top - src_stack_bottom;
	memcpy((void*)dest_stack_bottom,(void*)src_stack_bottom,size);
  10014f:	29 c8                	sub    %ecx,%eax
  100151:	50                   	push   %eax
  100152:	51                   	push   %ecx
  100153:	56                   	push   %esi
  100154:	89 54 24 18          	mov    %edx,0x18(%esp)
  100158:	e8 4f 04 00 00       	call   1005ac <memcpy>
	dest->p_registers.reg_esp = dest_stack_bottom;
  10015d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
	return -1;
	
 	proc_array[child_pid].p_registers = parent->p_registers; // set child regs	
        copy_stack(&proc_array[child_pid],parent);      // set child stack
        proc_array[child_pid].p_registers.reg_eax = 0;  // set exit code
	proc_array[child_pid].p_state = P_RUNNABLE;
  100161:	83 c4 10             	add    $0x10,%esp
  100164:	8b 54 24 08          	mov    0x8(%esp),%edx
	if(flag == 0)
	return -1;
	
 	proc_array[child_pid].p_registers = parent->p_registers; // set child regs	
        copy_stack(&proc_array[child_pid],parent);      // set child stack
        proc_array[child_pid].p_registers.reg_eax = 0;  // set exit code
  100168:	c7 85 30 92 10 00 00 	movl   $0x0,0x109230(%ebp)
  10016f:	00 00 00 
	proc_array[child_pid].p_state = P_RUNNABLE;
  100172:	c7 85 58 92 10 00 01 	movl   $0x1,0x109258(%ebp)
  100179:	00 00 00 
	dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);

	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	size_t size = src_stack_top - src_stack_bottom;
	memcpy((void*)dest_stack_bottom,(void*)src_stack_bottom,size);
	dest->p_registers.reg_esp = dest_stack_bottom;
  10017c:	89 70 40             	mov    %esi,0x40(%eax)
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  10017f:	89 53 20             	mov    %edx,0x20(%ebx)
		run(current);
  100182:	83 ec 0c             	sub    $0xc,%esp
  100185:	ff 35 b8 9f 10 00    	pushl  0x109fb8
  10018b:	e8 44 03 00 00       	call   1004d4 <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  100190:	e8 f7 fe ff ff       	call   10008c <schedule>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  100195:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  10019a:	8b 50 20             	mov    0x20(%eax),%edx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  10019d:	c7 40 48 03 00 00 00 	movl   $0x3,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  1001a4:	89 50 4c             	mov    %edx,0x4c(%eax)
  1001a7:	31 c0                	xor    %eax,%eax
		int i =0;
		for(i = 1; i <NPROCS; i++)
		{
			if(proc_array[i].p_state == P_BLOCKED){
  1001a9:	83 b8 ac 92 10 00 02 	cmpl   $0x2,0x1092ac(%eax)
  1001b0:	75 0a                	jne    1001bc <interrupt+0x101>
				proc_array[i].p_state = P_RUNNABLE;
  1001b2:	c7 80 ac 92 10 00 01 	movl   $0x1,0x1092ac(%eax)
  1001b9:	00 00 00 
  1001bc:	83 c0 54             	add    $0x54,%eax
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
		int i =0;
		for(i = 1; i <NPROCS; i++)
  1001bf:	3d ec 04 00 00       	cmp    $0x4ec,%eax
  1001c4:	75 e3                	jne    1001a9 <interrupt+0xee>
		{
			if(proc_array[i].p_state == P_BLOCKED){
				proc_array[i].p_state = P_RUNNABLE;
			}	
		}
		schedule();
  1001c6:	e8 c1 fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001cb:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
  1001d0:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001d3:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001d6:	83 f9 0e             	cmp    $0xe,%ecx
  1001d9:	77 14                	ja     1001ef <interrupt+0x134>
  1001db:	3b 10                	cmp    (%eax),%edx
  1001dd:	74 10                	je     1001ef <interrupt+0x134>
		    || proc_array[p].p_state == P_EMPTY)
  1001df:	6b d2 54             	imul   $0x54,%edx,%edx
  1001e2:	8d 8a 18 92 10 00    	lea    0x109218(%edx),%ecx
  1001e8:	8b 59 40             	mov    0x40(%ecx),%ebx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001eb:	85 db                	test   %ebx,%ebx
  1001ed:	75 09                	jne    1001f8 <interrupt+0x13d>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001ef:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001f6:	eb 1e                	jmp    100216 <interrupt+0x15b>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE){
  1001f8:	83 fb 03             	cmp    $0x3,%ebx
  1001fb:	75 12                	jne    10020f <interrupt+0x154>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;			proc_array[p].p_state = P_EMPTY;
  1001fd:	8b 92 5c 92 10 00    	mov    0x10925c(%edx),%edx
  100203:	c7 41 40 00 00 00 00 	movl   $0x0,0x40(%ecx)
  10020a:	89 50 20             	mov    %edx,0x20(%eax)
  10020d:	eb 07                	jmp    100216 <interrupt+0x15b>
}
		else
			//current->p_registers.reg_eax = WAIT_TRYAGAIN;
			current->p_state = P_BLOCKED;
  10020f:	c7 40 48 02 00 00 00 	movl   $0x2,0x48(%eax)
			
		schedule();
  100216:	e8 71 fe ff ff       	call   10008c <schedule>


	//Clause to handle the sys_newthread system call	
	case INT_SYS_NEWTHREAD: {
        
        	void (*start)(void) = (void(*)(void)) current->p_registers.reg_eax;
  10021b:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
  100220:	b9 ac 92 10 00       	mov    $0x1092ac,%ecx
  100225:	ba 01 00 00 00       	mov    $0x1,%edx
  10022a:	8b 68 20             	mov    0x20(%eax),%ebp
        int flag = 0;
        pid_t child_pid;     
                                                                                         
        for(i = 1;i<NPROCS;i++)
        {
        	if(proc_array[i].p_state == P_EMPTY) {	//Empty proc found,
  10022d:	83 39 00             	cmpl   $0x0,(%ecx)
  100230:	74 0e                	je     100240 <interrupt+0x185>
{
	int i;
        int flag = 0;
        pid_t child_pid;     
                                                                                         
        for(i = 1;i<NPROCS;i++)
  100232:	42                   	inc    %edx
  100233:	83 c1 54             	add    $0x54,%ecx
  100236:	83 fa 10             	cmp    $0x10,%edx
  100239:	75 f2                	jne    10022d <interrupt+0x172>
  10023b:	83 ca ff             	or     $0xffffffff,%edx
  10023e:	eb 50                	jmp    100290 <interrupt+0x1d5>
        }
                                                                                         
        if(flag == 0)
        return -1;
        
        proc_array[child_pid].p_registers = parent->p_registers; // set child regs
  100240:	6b da 54             	imul   $0x54,%edx,%ebx
  100243:	b9 11 00 00 00       	mov    $0x11,%ecx
  100248:	8d 70 04             	lea    0x4(%eax),%esi
  10024b:	8d bb 14 92 10 00    	lea    0x109214(%ebx),%edi
  100251:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	proc_array[child_pid].p_registers.reg_eip = (int) &start_function;
  100253:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
		
        
        proc_array[child_pid].p_registers.reg_eax = 0;  // set exit code
  100257:	8d b3 20 92 10 00    	lea    0x109220(%ebx),%esi
                                                                                         
        if(flag == 0)
        return -1;
        
        proc_array[child_pid].p_registers = parent->p_registers; // set child regs
	proc_array[child_pid].p_registers.reg_eip = (int) &start_function;
  10025d:	89 8b 44 92 10 00    	mov    %ecx,0x109244(%ebx)
		
        
        proc_array[child_pid].p_registers.reg_eax = 0;  // set exit code
        proc_array[child_pid].p_state = P_RUNNABLE;
  100263:	c7 83 58 92 10 00 01 	movl   $0x1,0x109258(%ebx)
  10026a:	00 00 00 
	src_stack_top = PROC1_STACK_ADDR + (parent->p_pid * PROC_STACK_SIZE);
        src_stack_bottom = parent->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (child_pid * PROC_STACK_SIZE);    
        dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
                                                                               
        proc_array[child_pid].p_registers.reg_esp = dest_stack_bottom;
  10026d:	8b 18                	mov    (%eax),%ebx
  10026f:	8b 48 40             	mov    0x40(%eax),%ecx
        
        proc_array[child_pid].p_registers = parent->p_registers; // set child regs
	proc_array[child_pid].p_registers.reg_eip = (int) &start_function;
		
        
        proc_array[child_pid].p_registers.reg_eax = 0;  // set exit code
  100272:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
	src_stack_top = PROC1_STACK_ADDR + (parent->p_pid * PROC_STACK_SIZE);
        src_stack_bottom = parent->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (child_pid * PROC_STACK_SIZE);    
        dest_stack_bottom = dest_stack_top + (src_stack_bottom - src_stack_top);
                                                                               
        proc_array[child_pid].p_registers.reg_esp = dest_stack_bottom;
  100279:	83 c3 0a             	add    $0xa,%ebx
  10027c:	c1 e3 12             	shl    $0x12,%ebx
  10027f:	29 d9                	sub    %ebx,%ecx
  100281:	89 d3                	mov    %edx,%ebx
  100283:	c1 e3 12             	shl    $0x12,%ebx
  100286:	8d 8c 0b 00 00 28 00 	lea    0x280000(%ebx,%ecx,1),%ecx
  10028d:	89 4e 30             	mov    %ecx,0x30(%esi)

	//Clause to handle the sys_newthread system call	
	case INT_SYS_NEWTHREAD: {
        
        	void (*start)(void) = (void(*)(void)) current->p_registers.reg_eax;
        	current->p_registers.reg_eax = do_thread(start,current);
  100290:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
        	run(current);
  100294:	83 ec 0c             	sub    $0xc,%esp

	//Clause to handle the sys_newthread system call	
	case INT_SYS_NEWTHREAD: {
        
        	void (*start)(void) = (void(*)(void)) current->p_registers.reg_eax;
        	current->p_registers.reg_eax = do_thread(start,current);
  100297:	89 50 20             	mov    %edx,0x20(%eax)
        	run(current);
  10029a:	50                   	push   %eax
  10029b:	e9 eb fe ff ff       	jmp    10018b <interrupt+0xd0>
			}

	//Clause to handle the sys_kill system call
	case INT_SYS_KILL: {
		pid_t to_kill = current->p_registers.reg_eax;	
		proc_array[to_kill].p_state = P_EMPTY;	
  1002a0:	6b 43 20 54          	imul   $0x54,0x20(%ebx),%eax
  1002a4:	c7 80 58 92 10 00 00 	movl   $0x0,0x109258(%eax)
  1002ab:	00 00 00 
		run(current);
  1002ae:	83 ec 0c             	sub    $0xc,%esp
  1002b1:	53                   	push   %ebx
  1002b2:	e9 d4 fe ff ff       	jmp    10018b <interrupt+0xd0>
  1002b7:	eb fe                	jmp    1002b7 <interrupt+0x1fc>

001002b9 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  1002b9:	53                   	push   %ebx
  1002ba:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  1002bd:	68 40 05 00 00       	push   $0x540
  1002c2:	6a 00                	push   $0x0
  1002c4:	68 10 92 10 00       	push   $0x109210
  1002c9:	e8 42 03 00 00       	call   100610 <memset>
  1002ce:	ba 10 92 10 00       	mov    $0x109210,%edx
  1002d3:	31 c0                	xor    %eax,%eax
  1002d5:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  1002d8:	89 02                	mov    %eax,(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  1002da:	40                   	inc    %eax
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  1002db:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  1002e2:	83 c2 54             	add    $0x54,%edx
  1002e5:	83 f8 10             	cmp    $0x10,%eax
  1002e8:	75 ee                	jne    1002d8 <start+0x1f>
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  1002ea:	c7 05 b8 9f 10 00 64 	movl   $0x109264,0x109fb8
  1002f1:	92 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  1002f4:	e8 73 00 00 00       	call   10036c <segments_init>
	special_registers_init(current);
  1002f9:	83 ec 0c             	sub    $0xc,%esp
  1002fc:	ff 35 b8 9f 10 00    	pushl  0x109fb8
  100302:	e8 e4 01 00 00       	call   1004eb <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  100307:	e8 2f 01 00 00       	call   10043b <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  10030c:	83 c4 0c             	add    $0xc,%esp
  10030f:	68 a8 0a 10 00       	push   $0x100aa8
  100314:	68 00 07 00 00       	push   $0x700
  100319:	ff 35 00 00 06 00    	pushl  0x60000
  10031f:	e8 4e 07 00 00       	call   100a72 <console_printf>
  100324:	83 c4 10             	add    $0x10,%esp
  100327:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  10032c:	e8 4d 01 00 00       	call   10047e <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  100331:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100334:	83 fb 01             	cmp    $0x1,%ebx
  100337:	77 f3                	ja     10032c <start+0x73>
	console_clear();
  100339:	e8 fd 00 00 00       	call   10043b <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  10033e:	50                   	push   %eax
  10033f:	50                   	push   %eax
  100340:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
  100345:	83 c0 34             	add    $0x34,%eax
  100348:	50                   	push   %eax
  100349:	53                   	push   %ebx
  10034a:	e8 d1 01 00 00       	call   100520 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  10034f:	a1 b8 9f 10 00       	mov    0x109fb8,%eax
  100354:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  10035b:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  100362:	89 04 24             	mov    %eax,(%esp)
  100365:	e8 6a 01 00 00       	call   1004d4 <run>
  10036a:	90                   	nop
  10036b:	90                   	nop

0010036c <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10036c:	b8 50 97 10 00       	mov    $0x109750,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100371:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100376:	89 c2                	mov    %eax,%edx
  100378:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  10037b:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10037c:	bb 56 00 10 00       	mov    $0x100056,%ebx
  100381:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100384:	66 a3 46 1b 10 00    	mov    %ax,0x101b46
  10038a:	c1 e8 18             	shr    $0x18,%eax
  10038d:	88 15 48 1b 10 00    	mov    %dl,0x101b48
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100393:	ba b8 97 10 00       	mov    $0x1097b8,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100398:	a2 4b 1b 10 00       	mov    %al,0x101b4b
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10039d:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10039f:	66 c7 05 44 1b 10 00 	movw   $0x68,0x101b44
  1003a6:	68 00 
  1003a8:	c6 05 4a 1b 10 00 40 	movb   $0x40,0x101b4a
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  1003af:	c6 05 49 1b 10 00 89 	movb   $0x89,0x101b49

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  1003b6:	c7 05 54 97 10 00 00 	movl   $0x80000,0x109754
  1003bd:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  1003c0:	66 c7 05 58 97 10 00 	movw   $0x10,0x109758
  1003c7:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003c9:	66 89 0c c5 b8 97 10 	mov    %cx,0x1097b8(,%eax,8)
  1003d0:	00 
  1003d1:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  1003d8:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  1003dd:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  1003e2:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  1003e7:	40                   	inc    %eax
  1003e8:	3d 00 01 00 00       	cmp    $0x100,%eax
  1003ed:	75 da                	jne    1003c9 <segments_init+0x5d>
  1003ef:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003f3:	ba b8 97 10 00       	mov    $0x1097b8,%edx
  1003f8:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  1003ff:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100406:	66 89 0c c5 b8 97 10 	mov    %cx,0x1097b8(,%eax,8)
  10040d:	00 
  10040e:	c1 e9 10             	shr    $0x10,%ecx
  100411:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100416:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  10041b:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100420:	40                   	inc    %eax
  100421:	83 f8 3a             	cmp    $0x3a,%eax
  100424:	75 d2                	jne    1003f8 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  100426:	b0 28                	mov    $0x28,%al
  100428:	0f 01 15 0c 1b 10 00 	lgdtl  0x101b0c
  10042f:	0f 00 d8             	ltr    %ax
  100432:	0f 01 1d 14 1b 10 00 	lidtl  0x101b14
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  100439:	5b                   	pop    %ebx
  10043a:	c3                   	ret    

0010043b <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  10043b:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  10043c:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  10043e:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  10043f:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  100446:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  100449:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  100450:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  100453:	40                   	inc    %eax
  100454:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100459:	75 ee                	jne    100449 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  10045b:	be d4 03 00 00       	mov    $0x3d4,%esi
  100460:	b0 0e                	mov    $0xe,%al
  100462:	89 f2                	mov    %esi,%edx
  100464:	ee                   	out    %al,(%dx)
  100465:	31 c9                	xor    %ecx,%ecx
  100467:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  10046c:	88 c8                	mov    %cl,%al
  10046e:	89 da                	mov    %ebx,%edx
  100470:	ee                   	out    %al,(%dx)
  100471:	b0 0f                	mov    $0xf,%al
  100473:	89 f2                	mov    %esi,%edx
  100475:	ee                   	out    %al,(%dx)
  100476:	88 c8                	mov    %cl,%al
  100478:	89 da                	mov    %ebx,%edx
  10047a:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  10047b:	5b                   	pop    %ebx
  10047c:	5e                   	pop    %esi
  10047d:	c3                   	ret    

0010047e <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  10047e:	ba 64 00 00 00       	mov    $0x64,%edx
  100483:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  100484:	a8 01                	test   $0x1,%al
  100486:	74 45                	je     1004cd <console_read_digit+0x4f>
  100488:	b2 60                	mov    $0x60,%dl
  10048a:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  10048b:	8d 50 fe             	lea    -0x2(%eax),%edx
  10048e:	80 fa 08             	cmp    $0x8,%dl
  100491:	77 05                	ja     100498 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  100493:	0f b6 c0             	movzbl %al,%eax
  100496:	48                   	dec    %eax
  100497:	c3                   	ret    
	else if (data == 0x0B)
  100498:	3c 0b                	cmp    $0xb,%al
  10049a:	74 35                	je     1004d1 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  10049c:	8d 50 b9             	lea    -0x47(%eax),%edx
  10049f:	80 fa 02             	cmp    $0x2,%dl
  1004a2:	77 07                	ja     1004ab <console_read_digit+0x2d>
		return data - 0x47 + 7;
  1004a4:	0f b6 c0             	movzbl %al,%eax
  1004a7:	83 e8 40             	sub    $0x40,%eax
  1004aa:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  1004ab:	8d 50 b5             	lea    -0x4b(%eax),%edx
  1004ae:	80 fa 02             	cmp    $0x2,%dl
  1004b1:	77 07                	ja     1004ba <console_read_digit+0x3c>
		return data - 0x4B + 4;
  1004b3:	0f b6 c0             	movzbl %al,%eax
  1004b6:	83 e8 47             	sub    $0x47,%eax
  1004b9:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  1004ba:	8d 50 b1             	lea    -0x4f(%eax),%edx
  1004bd:	80 fa 02             	cmp    $0x2,%dl
  1004c0:	77 07                	ja     1004c9 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  1004c2:	0f b6 c0             	movzbl %al,%eax
  1004c5:	83 e8 4e             	sub    $0x4e,%eax
  1004c8:	c3                   	ret    
	else if (data == 0x53)
  1004c9:	3c 53                	cmp    $0x53,%al
  1004cb:	74 04                	je     1004d1 <console_read_digit+0x53>
  1004cd:	83 c8 ff             	or     $0xffffffff,%eax
  1004d0:	c3                   	ret    
  1004d1:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  1004d3:	c3                   	ret    

001004d4 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  1004d4:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  1004d8:	a3 b8 9f 10 00       	mov    %eax,0x109fb8

	asm volatile("movl %0,%%esp\n\t"
  1004dd:	83 c0 04             	add    $0x4,%eax
  1004e0:	89 c4                	mov    %eax,%esp
  1004e2:	61                   	popa   
  1004e3:	07                   	pop    %es
  1004e4:	1f                   	pop    %ds
  1004e5:	83 c4 08             	add    $0x8,%esp
  1004e8:	cf                   	iret   
  1004e9:	eb fe                	jmp    1004e9 <run+0x15>

001004eb <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  1004eb:	53                   	push   %ebx
  1004ec:	83 ec 0c             	sub    $0xc,%esp
  1004ef:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  1004f3:	6a 44                	push   $0x44
  1004f5:	6a 00                	push   $0x0
  1004f7:	8d 43 04             	lea    0x4(%ebx),%eax
  1004fa:	50                   	push   %eax
  1004fb:	e8 10 01 00 00       	call   100610 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100500:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  100506:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  10050c:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  100512:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  100518:	83 c4 18             	add    $0x18,%esp
  10051b:	5b                   	pop    %ebx
  10051c:	c3                   	ret    
  10051d:	90                   	nop
  10051e:	90                   	nop
  10051f:	90                   	nop

00100520 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100520:	55                   	push   %ebp
  100521:	57                   	push   %edi
  100522:	56                   	push   %esi
  100523:	53                   	push   %ebx
  100524:	83 ec 1c             	sub    $0x1c,%esp
  100527:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  10052b:	83 f8 01             	cmp    $0x1,%eax
  10052e:	7f 04                	jg     100534 <program_loader+0x14>
  100530:	85 c0                	test   %eax,%eax
  100532:	79 02                	jns    100536 <program_loader+0x16>
  100534:	eb fe                	jmp    100534 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  100536:	8b 34 c5 4c 1b 10 00 	mov    0x101b4c(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  10053d:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  100543:	74 02                	je     100547 <program_loader+0x27>
  100545:	eb fe                	jmp    100545 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  100547:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  10054a:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  10054e:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  100550:	c1 e5 05             	shl    $0x5,%ebp
  100553:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  100556:	eb 3f                	jmp    100597 <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  100558:	83 3b 01             	cmpl   $0x1,(%ebx)
  10055b:	75 37                	jne    100594 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  10055d:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100560:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  100563:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100566:	01 c7                	add    %eax,%edi
	memsz += va;
  100568:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  10056a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  10056f:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  100573:	52                   	push   %edx
  100574:	89 fa                	mov    %edi,%edx
  100576:	29 c2                	sub    %eax,%edx
  100578:	52                   	push   %edx
  100579:	8b 53 04             	mov    0x4(%ebx),%edx
  10057c:	01 f2                	add    %esi,%edx
  10057e:	52                   	push   %edx
  10057f:	50                   	push   %eax
  100580:	e8 27 00 00 00       	call   1005ac <memcpy>
  100585:	83 c4 10             	add    $0x10,%esp
  100588:	eb 04                	jmp    10058e <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  10058a:	c6 07 00             	movb   $0x0,(%edi)
  10058d:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  10058e:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  100592:	72 f6                	jb     10058a <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  100594:	83 c3 20             	add    $0x20,%ebx
  100597:	39 eb                	cmp    %ebp,%ebx
  100599:	72 bd                	jb     100558 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  10059b:	8b 56 18             	mov    0x18(%esi),%edx
  10059e:	8b 44 24 34          	mov    0x34(%esp),%eax
  1005a2:	89 10                	mov    %edx,(%eax)
}
  1005a4:	83 c4 1c             	add    $0x1c,%esp
  1005a7:	5b                   	pop    %ebx
  1005a8:	5e                   	pop    %esi
  1005a9:	5f                   	pop    %edi
  1005aa:	5d                   	pop    %ebp
  1005ab:	c3                   	ret    

001005ac <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  1005ac:	56                   	push   %esi
  1005ad:	31 d2                	xor    %edx,%edx
  1005af:	53                   	push   %ebx
  1005b0:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1005b4:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1005b8:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1005bc:	eb 08                	jmp    1005c6 <memcpy+0x1a>
		*d++ = *s++;
  1005be:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  1005c1:	4e                   	dec    %esi
  1005c2:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1005c5:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1005c6:	85 f6                	test   %esi,%esi
  1005c8:	75 f4                	jne    1005be <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  1005ca:	5b                   	pop    %ebx
  1005cb:	5e                   	pop    %esi
  1005cc:	c3                   	ret    

001005cd <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  1005cd:	57                   	push   %edi
  1005ce:	56                   	push   %esi
  1005cf:	53                   	push   %ebx
  1005d0:	8b 44 24 10          	mov    0x10(%esp),%eax
  1005d4:	8b 7c 24 14          	mov    0x14(%esp),%edi
  1005d8:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  1005dc:	39 c7                	cmp    %eax,%edi
  1005de:	73 26                	jae    100606 <memmove+0x39>
  1005e0:	8d 34 17             	lea    (%edi,%edx,1),%esi
  1005e3:	39 c6                	cmp    %eax,%esi
  1005e5:	76 1f                	jbe    100606 <memmove+0x39>
		s += n, d += n;
  1005e7:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  1005ea:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  1005ec:	eb 07                	jmp    1005f5 <memmove+0x28>
			*--d = *--s;
  1005ee:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  1005f1:	4a                   	dec    %edx
  1005f2:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  1005f5:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  1005f6:	85 d2                	test   %edx,%edx
  1005f8:	75 f4                	jne    1005ee <memmove+0x21>
  1005fa:	eb 10                	jmp    10060c <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  1005fc:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  1005ff:	4a                   	dec    %edx
  100600:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  100603:	41                   	inc    %ecx
  100604:	eb 02                	jmp    100608 <memmove+0x3b>
  100606:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  100608:	85 d2                	test   %edx,%edx
  10060a:	75 f0                	jne    1005fc <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  10060c:	5b                   	pop    %ebx
  10060d:	5e                   	pop    %esi
  10060e:	5f                   	pop    %edi
  10060f:	c3                   	ret    

00100610 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100610:	53                   	push   %ebx
  100611:	8b 44 24 08          	mov    0x8(%esp),%eax
  100615:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100619:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  10061d:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  10061f:	eb 04                	jmp    100625 <memset+0x15>
		*p++ = c;
  100621:	88 1a                	mov    %bl,(%edx)
  100623:	49                   	dec    %ecx
  100624:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100625:	85 c9                	test   %ecx,%ecx
  100627:	75 f8                	jne    100621 <memset+0x11>
		*p++ = c;
	return v;
}
  100629:	5b                   	pop    %ebx
  10062a:	c3                   	ret    

0010062b <strlen>:

size_t
strlen(const char *s)
{
  10062b:	8b 54 24 04          	mov    0x4(%esp),%edx
  10062f:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100631:	eb 01                	jmp    100634 <strlen+0x9>
		++n;
  100633:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100634:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100638:	75 f9                	jne    100633 <strlen+0x8>
		++n;
	return n;
}
  10063a:	c3                   	ret    

0010063b <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  10063b:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  10063f:	31 c0                	xor    %eax,%eax
  100641:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100645:	eb 01                	jmp    100648 <strnlen+0xd>
		++n;
  100647:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100648:	39 d0                	cmp    %edx,%eax
  10064a:	74 06                	je     100652 <strnlen+0x17>
  10064c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  100650:	75 f5                	jne    100647 <strnlen+0xc>
		++n;
	return n;
}
  100652:	c3                   	ret    

00100653 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100653:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  100654:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100659:	53                   	push   %ebx
  10065a:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  10065c:	76 05                	jbe    100663 <console_putc+0x10>
  10065e:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  100663:	80 fa 0a             	cmp    $0xa,%dl
  100666:	75 2c                	jne    100694 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100668:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  10066e:	be 50 00 00 00       	mov    $0x50,%esi
  100673:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  100675:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100678:	99                   	cltd   
  100679:	f7 fe                	idiv   %esi
  10067b:	89 de                	mov    %ebx,%esi
  10067d:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  10067f:	eb 07                	jmp    100688 <console_putc+0x35>
			*cursor++ = ' ' | color;
  100681:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100684:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  100685:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100688:	83 f8 50             	cmp    $0x50,%eax
  10068b:	75 f4                	jne    100681 <console_putc+0x2e>
  10068d:	29 d0                	sub    %edx,%eax
  10068f:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  100692:	eb 0b                	jmp    10069f <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  100694:	0f b6 d2             	movzbl %dl,%edx
  100697:	09 ca                	or     %ecx,%edx
  100699:	66 89 13             	mov    %dx,(%ebx)
  10069c:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  10069f:	5b                   	pop    %ebx
  1006a0:	5e                   	pop    %esi
  1006a1:	c3                   	ret    

001006a2 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  1006a2:	56                   	push   %esi
  1006a3:	53                   	push   %ebx
  1006a4:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  1006a8:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1006ab:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  1006af:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  1006b4:	75 04                	jne    1006ba <fill_numbuf+0x18>
  1006b6:	85 d2                	test   %edx,%edx
  1006b8:	74 10                	je     1006ca <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  1006ba:	89 d0                	mov    %edx,%eax
  1006bc:	31 d2                	xor    %edx,%edx
  1006be:	f7 f1                	div    %ecx
  1006c0:	4b                   	dec    %ebx
  1006c1:	8a 14 16             	mov    (%esi,%edx,1),%dl
  1006c4:	88 13                	mov    %dl,(%ebx)
			val /= base;
  1006c6:	89 c2                	mov    %eax,%edx
  1006c8:	eb ec                	jmp    1006b6 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  1006ca:	89 d8                	mov    %ebx,%eax
  1006cc:	5b                   	pop    %ebx
  1006cd:	5e                   	pop    %esi
  1006ce:	c3                   	ret    

001006cf <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  1006cf:	55                   	push   %ebp
  1006d0:	57                   	push   %edi
  1006d1:	56                   	push   %esi
  1006d2:	53                   	push   %ebx
  1006d3:	83 ec 38             	sub    $0x38,%esp
  1006d6:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  1006da:	8b 7c 24 54          	mov    0x54(%esp),%edi
  1006de:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  1006e2:	e9 60 03 00 00       	jmp    100a47 <console_vprintf+0x378>
		if (*format != '%') {
  1006e7:	80 fa 25             	cmp    $0x25,%dl
  1006ea:	74 13                	je     1006ff <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  1006ec:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1006f0:	0f b6 d2             	movzbl %dl,%edx
  1006f3:	89 f0                	mov    %esi,%eax
  1006f5:	e8 59 ff ff ff       	call   100653 <console_putc>
  1006fa:	e9 45 03 00 00       	jmp    100a44 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1006ff:	47                   	inc    %edi
  100700:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  100707:	00 
  100708:	eb 12                	jmp    10071c <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  10070a:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  10070b:	8a 11                	mov    (%ecx),%dl
  10070d:	84 d2                	test   %dl,%dl
  10070f:	74 1a                	je     10072b <console_vprintf+0x5c>
  100711:	89 e8                	mov    %ebp,%eax
  100713:	38 c2                	cmp    %al,%dl
  100715:	75 f3                	jne    10070a <console_vprintf+0x3b>
  100717:	e9 3f 03 00 00       	jmp    100a5b <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10071c:	8a 17                	mov    (%edi),%dl
  10071e:	84 d2                	test   %dl,%dl
  100720:	74 0b                	je     10072d <console_vprintf+0x5e>
  100722:	b9 dc 0a 10 00       	mov    $0x100adc,%ecx
  100727:	89 d5                	mov    %edx,%ebp
  100729:	eb e0                	jmp    10070b <console_vprintf+0x3c>
  10072b:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  10072d:	8d 42 cf             	lea    -0x31(%edx),%eax
  100730:	3c 08                	cmp    $0x8,%al
  100732:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  100739:	00 
  10073a:	76 13                	jbe    10074f <console_vprintf+0x80>
  10073c:	eb 1d                	jmp    10075b <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  10073e:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  100743:	0f be c0             	movsbl %al,%eax
  100746:	47                   	inc    %edi
  100747:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  10074b:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  10074f:	8a 07                	mov    (%edi),%al
  100751:	8d 50 d0             	lea    -0x30(%eax),%edx
  100754:	80 fa 09             	cmp    $0x9,%dl
  100757:	76 e5                	jbe    10073e <console_vprintf+0x6f>
  100759:	eb 18                	jmp    100773 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  10075b:	80 fa 2a             	cmp    $0x2a,%dl
  10075e:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  100765:	ff 
  100766:	75 0b                	jne    100773 <console_vprintf+0xa4>
			width = va_arg(val, int);
  100768:	83 c3 04             	add    $0x4,%ebx
			++format;
  10076b:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  10076c:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10076f:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  100773:	83 cd ff             	or     $0xffffffff,%ebp
  100776:	80 3f 2e             	cmpb   $0x2e,(%edi)
  100779:	75 37                	jne    1007b2 <console_vprintf+0xe3>
			++format;
  10077b:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  10077c:	31 ed                	xor    %ebp,%ebp
  10077e:	8a 07                	mov    (%edi),%al
  100780:	8d 50 d0             	lea    -0x30(%eax),%edx
  100783:	80 fa 09             	cmp    $0x9,%dl
  100786:	76 0d                	jbe    100795 <console_vprintf+0xc6>
  100788:	eb 17                	jmp    1007a1 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  10078a:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  10078d:	0f be c0             	movsbl %al,%eax
  100790:	47                   	inc    %edi
  100791:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  100795:	8a 07                	mov    (%edi),%al
  100797:	8d 50 d0             	lea    -0x30(%eax),%edx
  10079a:	80 fa 09             	cmp    $0x9,%dl
  10079d:	76 eb                	jbe    10078a <console_vprintf+0xbb>
  10079f:	eb 11                	jmp    1007b2 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  1007a1:	3c 2a                	cmp    $0x2a,%al
  1007a3:	75 0b                	jne    1007b0 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  1007a5:	83 c3 04             	add    $0x4,%ebx
				++format;
  1007a8:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  1007a9:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  1007ac:	85 ed                	test   %ebp,%ebp
  1007ae:	79 02                	jns    1007b2 <console_vprintf+0xe3>
  1007b0:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  1007b2:	8a 07                	mov    (%edi),%al
  1007b4:	3c 64                	cmp    $0x64,%al
  1007b6:	74 34                	je     1007ec <console_vprintf+0x11d>
  1007b8:	7f 1d                	jg     1007d7 <console_vprintf+0x108>
  1007ba:	3c 58                	cmp    $0x58,%al
  1007bc:	0f 84 a2 00 00 00    	je     100864 <console_vprintf+0x195>
  1007c2:	3c 63                	cmp    $0x63,%al
  1007c4:	0f 84 bf 00 00 00    	je     100889 <console_vprintf+0x1ba>
  1007ca:	3c 43                	cmp    $0x43,%al
  1007cc:	0f 85 d0 00 00 00    	jne    1008a2 <console_vprintf+0x1d3>
  1007d2:	e9 a3 00 00 00       	jmp    10087a <console_vprintf+0x1ab>
  1007d7:	3c 75                	cmp    $0x75,%al
  1007d9:	74 4d                	je     100828 <console_vprintf+0x159>
  1007db:	3c 78                	cmp    $0x78,%al
  1007dd:	74 5c                	je     10083b <console_vprintf+0x16c>
  1007df:	3c 73                	cmp    $0x73,%al
  1007e1:	0f 85 bb 00 00 00    	jne    1008a2 <console_vprintf+0x1d3>
  1007e7:	e9 86 00 00 00       	jmp    100872 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  1007ec:	83 c3 04             	add    $0x4,%ebx
  1007ef:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  1007f2:	89 d1                	mov    %edx,%ecx
  1007f4:	c1 f9 1f             	sar    $0x1f,%ecx
  1007f7:	89 0c 24             	mov    %ecx,(%esp)
  1007fa:	31 ca                	xor    %ecx,%edx
  1007fc:	55                   	push   %ebp
  1007fd:	29 ca                	sub    %ecx,%edx
  1007ff:	68 e4 0a 10 00       	push   $0x100ae4
  100804:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100809:	8d 44 24 40          	lea    0x40(%esp),%eax
  10080d:	e8 90 fe ff ff       	call   1006a2 <fill_numbuf>
  100812:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  100816:	58                   	pop    %eax
  100817:	5a                   	pop    %edx
  100818:	ba 01 00 00 00       	mov    $0x1,%edx
  10081d:	8b 04 24             	mov    (%esp),%eax
  100820:	83 e0 01             	and    $0x1,%eax
  100823:	e9 a5 00 00 00       	jmp    1008cd <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  100828:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  10082b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100830:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100833:	55                   	push   %ebp
  100834:	68 e4 0a 10 00       	push   $0x100ae4
  100839:	eb 11                	jmp    10084c <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  10083b:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  10083e:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100841:	55                   	push   %ebp
  100842:	68 f8 0a 10 00       	push   $0x100af8
  100847:	b9 10 00 00 00       	mov    $0x10,%ecx
  10084c:	8d 44 24 40          	lea    0x40(%esp),%eax
  100850:	e8 4d fe ff ff       	call   1006a2 <fill_numbuf>
  100855:	ba 01 00 00 00       	mov    $0x1,%edx
  10085a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10085e:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  100860:	59                   	pop    %ecx
  100861:	59                   	pop    %ecx
  100862:	eb 69                	jmp    1008cd <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  100864:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  100867:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10086a:	55                   	push   %ebp
  10086b:	68 e4 0a 10 00       	push   $0x100ae4
  100870:	eb d5                	jmp    100847 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  100872:	83 c3 04             	add    $0x4,%ebx
  100875:	8b 43 fc             	mov    -0x4(%ebx),%eax
  100878:	eb 40                	jmp    1008ba <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  10087a:	83 c3 04             	add    $0x4,%ebx
  10087d:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100880:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  100884:	e9 bd 01 00 00       	jmp    100a46 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  100889:	83 c3 04             	add    $0x4,%ebx
  10088c:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  10088f:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  100893:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  100898:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  10089c:	88 44 24 24          	mov    %al,0x24(%esp)
  1008a0:	eb 27                	jmp    1008c9 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  1008a2:	84 c0                	test   %al,%al
  1008a4:	75 02                	jne    1008a8 <console_vprintf+0x1d9>
  1008a6:	b0 25                	mov    $0x25,%al
  1008a8:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  1008ac:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  1008b1:	80 3f 00             	cmpb   $0x0,(%edi)
  1008b4:	74 0a                	je     1008c0 <console_vprintf+0x1f1>
  1008b6:	8d 44 24 24          	lea    0x24(%esp),%eax
  1008ba:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008be:	eb 09                	jmp    1008c9 <console_vprintf+0x1fa>
				format--;
  1008c0:	8d 54 24 24          	lea    0x24(%esp),%edx
  1008c4:	4f                   	dec    %edi
  1008c5:	89 54 24 04          	mov    %edx,0x4(%esp)
  1008c9:	31 d2                	xor    %edx,%edx
  1008cb:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  1008cd:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  1008cf:	83 fd ff             	cmp    $0xffffffff,%ebp
  1008d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1008d9:	74 1f                	je     1008fa <console_vprintf+0x22b>
  1008db:	89 04 24             	mov    %eax,(%esp)
  1008de:	eb 01                	jmp    1008e1 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  1008e0:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1008e1:	39 e9                	cmp    %ebp,%ecx
  1008e3:	74 0a                	je     1008ef <console_vprintf+0x220>
  1008e5:	8b 44 24 04          	mov    0x4(%esp),%eax
  1008e9:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  1008ed:	75 f1                	jne    1008e0 <console_vprintf+0x211>
  1008ef:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  1008f2:	89 0c 24             	mov    %ecx,(%esp)
  1008f5:	eb 1f                	jmp    100916 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  1008f7:	42                   	inc    %edx
  1008f8:	eb 09                	jmp    100903 <console_vprintf+0x234>
  1008fa:	89 d1                	mov    %edx,%ecx
  1008fc:	8b 14 24             	mov    (%esp),%edx
  1008ff:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100903:	8b 44 24 04          	mov    0x4(%esp),%eax
  100907:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  10090b:	75 ea                	jne    1008f7 <console_vprintf+0x228>
  10090d:	8b 44 24 08          	mov    0x8(%esp),%eax
  100911:	89 14 24             	mov    %edx,(%esp)
  100914:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  100916:	85 c0                	test   %eax,%eax
  100918:	74 0c                	je     100926 <console_vprintf+0x257>
  10091a:	84 d2                	test   %dl,%dl
  10091c:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  100923:	00 
  100924:	75 24                	jne    10094a <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  100926:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  10092b:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  100932:	00 
  100933:	75 15                	jne    10094a <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  100935:	8b 44 24 14          	mov    0x14(%esp),%eax
  100939:	83 e0 08             	and    $0x8,%eax
  10093c:	83 f8 01             	cmp    $0x1,%eax
  10093f:	19 c9                	sbb    %ecx,%ecx
  100941:	f7 d1                	not    %ecx
  100943:	83 e1 20             	and    $0x20,%ecx
  100946:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  10094a:	3b 2c 24             	cmp    (%esp),%ebp
  10094d:	7e 0d                	jle    10095c <console_vprintf+0x28d>
  10094f:	84 d2                	test   %dl,%dl
  100951:	74 40                	je     100993 <console_vprintf+0x2c4>
			zeros = precision - len;
  100953:	2b 2c 24             	sub    (%esp),%ebp
  100956:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  10095a:	eb 3f                	jmp    10099b <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  10095c:	84 d2                	test   %dl,%dl
  10095e:	74 33                	je     100993 <console_vprintf+0x2c4>
  100960:	8b 44 24 14          	mov    0x14(%esp),%eax
  100964:	83 e0 06             	and    $0x6,%eax
  100967:	83 f8 02             	cmp    $0x2,%eax
  10096a:	75 27                	jne    100993 <console_vprintf+0x2c4>
  10096c:	45                   	inc    %ebp
  10096d:	75 24                	jne    100993 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  10096f:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100971:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  100974:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100979:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  10097c:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  10097f:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  100983:	7d 0e                	jge    100993 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  100985:	8b 54 24 0c          	mov    0xc(%esp),%edx
  100989:	29 ca                	sub    %ecx,%edx
  10098b:	29 c2                	sub    %eax,%edx
  10098d:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100991:	eb 08                	jmp    10099b <console_vprintf+0x2cc>
  100993:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  10099a:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  10099b:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  10099f:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1009a1:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1009a5:	2b 2c 24             	sub    (%esp),%ebp
  1009a8:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1009ad:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1009b0:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1009b3:	29 c5                	sub    %eax,%ebp
  1009b5:	89 f0                	mov    %esi,%eax
  1009b7:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1009bb:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1009bf:	eb 0f                	jmp    1009d0 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  1009c1:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009c5:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1009ca:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  1009cb:	e8 83 fc ff ff       	call   100653 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1009d0:	85 ed                	test   %ebp,%ebp
  1009d2:	7e 07                	jle    1009db <console_vprintf+0x30c>
  1009d4:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  1009d9:	74 e6                	je     1009c1 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  1009db:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1009e0:	89 c6                	mov    %eax,%esi
  1009e2:	74 23                	je     100a07 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  1009e4:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  1009e9:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009ed:	e8 61 fc ff ff       	call   100653 <console_putc>
  1009f2:	89 c6                	mov    %eax,%esi
  1009f4:	eb 11                	jmp    100a07 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  1009f6:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009fa:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  1009ff:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100a00:	e8 4e fc ff ff       	call   100653 <console_putc>
  100a05:	eb 06                	jmp    100a0d <console_vprintf+0x33e>
  100a07:	89 f0                	mov    %esi,%eax
  100a09:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100a0d:	85 f6                	test   %esi,%esi
  100a0f:	7f e5                	jg     1009f6 <console_vprintf+0x327>
  100a11:	8b 34 24             	mov    (%esp),%esi
  100a14:	eb 15                	jmp    100a2b <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  100a16:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100a1a:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  100a1b:	0f b6 11             	movzbl (%ecx),%edx
  100a1e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a22:	e8 2c fc ff ff       	call   100653 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100a27:	ff 44 24 04          	incl   0x4(%esp)
  100a2b:	85 f6                	test   %esi,%esi
  100a2d:	7f e7                	jg     100a16 <console_vprintf+0x347>
  100a2f:	eb 0f                	jmp    100a40 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  100a31:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a35:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100a3a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100a3b:	e8 13 fc ff ff       	call   100653 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100a40:	85 ed                	test   %ebp,%ebp
  100a42:	7f ed                	jg     100a31 <console_vprintf+0x362>
  100a44:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100a46:	47                   	inc    %edi
  100a47:	8a 17                	mov    (%edi),%dl
  100a49:	84 d2                	test   %dl,%dl
  100a4b:	0f 85 96 fc ff ff    	jne    1006e7 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  100a51:	83 c4 38             	add    $0x38,%esp
  100a54:	89 f0                	mov    %esi,%eax
  100a56:	5b                   	pop    %ebx
  100a57:	5e                   	pop    %esi
  100a58:	5f                   	pop    %edi
  100a59:	5d                   	pop    %ebp
  100a5a:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100a5b:	81 e9 dc 0a 10 00    	sub    $0x100adc,%ecx
  100a61:	b8 01 00 00 00       	mov    $0x1,%eax
  100a66:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100a68:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100a69:	09 44 24 14          	or     %eax,0x14(%esp)
  100a6d:	e9 aa fc ff ff       	jmp    10071c <console_vprintf+0x4d>

00100a72 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  100a72:	8d 44 24 10          	lea    0x10(%esp),%eax
  100a76:	50                   	push   %eax
  100a77:	ff 74 24 10          	pushl  0x10(%esp)
  100a7b:	ff 74 24 10          	pushl  0x10(%esp)
  100a7f:	ff 74 24 10          	pushl  0x10(%esp)
  100a83:	e8 47 fc ff ff       	call   1006cf <console_vprintf>
  100a88:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  100a8b:	c3                   	ret    
