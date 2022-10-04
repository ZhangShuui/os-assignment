
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 c8 2b 00 00       	call   102bf4 <memset>

    cons_init();                // init the console
  10002c:	e8 01 16 00 00       	call   101632 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 20 34 10 00 	movl   $0x103420,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 3c 34 10 00 	movl   $0x10343c,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 49 28 00 00       	call   1028a3 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 28 17 00 00       	call   101787 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 a8 18 00 00       	call   10190c <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 4e 0d 00 00       	call   100db7 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 65 18 00 00       	call   1018d3 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 0b 0d 00 00       	call   100da1 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 41 34 10 00 	movl   $0x103441,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 4f 34 10 00 	movl   $0x10344f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 5d 34 10 00 	movl   $0x10345d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 6b 34 10 00 	movl   $0x10346b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 79 34 10 00 	movl   $0x103479,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 88 34 10 00 	movl   $0x103488,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 a8 34 10 00 	movl   $0x1034a8,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 26 14 00 00       	call   101663 <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 e1 2c 00 00       	call   102f60 <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 a0 13 00 00       	call   101663 <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 68 13 00 00       	call   101691 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 c7 34 10 00 	movl   $0x1034c7,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 ca 34 10 00 	movl   $0x1034ca,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 e6 34 10 00 	movl   $0x1034e6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 e8 34 10 00 	movl   $0x1034e8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 7b 14 00 00       	call   1018df <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 58 08 00 00       	call   100cc8 <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 fa 34 10 00 	movl   $0x1034fa,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 e6 34 10 00 	movl   $0x1034e6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 18 35 10 00    	movl   $0x103518,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 18 35 10 00 	movl   $0x103518,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 2c 3d 10 00 	movl   $0x103d2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 0c c9 10 00 	movl   $0x10c90c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec 0d c9 10 00 	movl   $0x10c90d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 09 ea 10 00 	movl   $0x10ea09,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 9a 22 00 00       	call   102a68 <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 22 35 10 00 	movl   $0x103522,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 3b 35 10 00 	movl   $0x10353b,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 18 34 10 	movl   $0x103418,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 53 35 10 00 	movl   $0x103553,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 6b 35 10 00 	movl   $0x10356b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 83 35 10 00 	movl   $0x103583,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 9c 35 10 00 	movl   $0x10359c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 c6 35 10 00 	movl   $0x1035c6,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 e2 35 10 00 	movl   $0x1035e2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
     uint32_t ebp = read_ebp(),eip = read_eip();
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
     for (size_t i = 0; i < STACKFRAME_DEPTH; i++)
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 84 00 00 00       	jmp    100b46 <print_stackframe+0xad>
     {
        cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
  100ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad0:	c7 04 24 f4 35 10 00 	movl   $0x1035f4,(%esp)
  100ad7:	e8 a8 f7 ff ff       	call   100284 <cprintf>
        uint32_t* args = (uint32_t*)ebp + 2;
  100adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adf:	83 c0 08             	add    $0x8,%eax
  100ae2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (size_t j = 0; j < 4; j++)
  100ae5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aec:	eb 24                	jmp    100b12 <print_stackframe+0x79>
        {
            cprintf("args:0x%08x ", args[j]);
  100aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100af1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100af8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100afb:	01 d0                	add    %edx,%eax
  100afd:	8b 00                	mov    (%eax),%eax
  100aff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b03:	c7 04 24 0b 36 10 00 	movl   $0x10360b,(%esp)
  100b0a:	e8 75 f7 ff ff       	call   100284 <cprintf>
        for (size_t j = 0; j < 4; j++)
  100b0f:	ff 45 e8             	incl   -0x18(%ebp)
  100b12:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b16:	76 d6                	jbe    100aee <print_stackframe+0x55>
        }
        cprintf("\n");
  100b18:	c7 04 24 18 36 10 00 	movl   $0x103618,(%esp)
  100b1f:	e8 60 f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip - 1);
  100b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b27:	48                   	dec    %eax
  100b28:	89 04 24             	mov    %eax,(%esp)
  100b2b:	e8 ad fe ff ff       	call   1009dd <print_debuginfo>
        eip = ((uint32_t*)ebp)[1];
  100b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b33:	83 c0 04             	add    $0x4,%eax
  100b36:	8b 00                	mov    (%eax),%eax
  100b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t*)ebp)[0];
  100b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3e:	8b 00                	mov    (%eax),%eax
  100b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
     for (size_t i = 0; i < STACKFRAME_DEPTH; i++)
  100b43:	ff 45 ec             	incl   -0x14(%ebp)
  100b46:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b4a:	0f 86 72 ff ff ff    	jbe    100ac2 <print_stackframe+0x29>
     }
     
}
  100b50:	90                   	nop
  100b51:	90                   	nop
  100b52:	c9                   	leave  
  100b53:	c3                   	ret    

00100b54 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b54:	f3 0f 1e fb          	endbr32 
  100b58:	55                   	push   %ebp
  100b59:	89 e5                	mov    %esp,%ebp
  100b5b:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b65:	eb 0c                	jmp    100b73 <parse+0x1f>
            *buf ++ = '\0';
  100b67:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6a:	8d 50 01             	lea    0x1(%eax),%edx
  100b6d:	89 55 08             	mov    %edx,0x8(%ebp)
  100b70:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b73:	8b 45 08             	mov    0x8(%ebp),%eax
  100b76:	0f b6 00             	movzbl (%eax),%eax
  100b79:	84 c0                	test   %al,%al
  100b7b:	74 1d                	je     100b9a <parse+0x46>
  100b7d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b80:	0f b6 00             	movzbl (%eax),%eax
  100b83:	0f be c0             	movsbl %al,%eax
  100b86:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8a:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  100b91:	e8 9c 1e 00 00       	call   102a32 <strchr>
  100b96:	85 c0                	test   %eax,%eax
  100b98:	75 cd                	jne    100b67 <parse+0x13>
        }
        if (*buf == '\0') {
  100b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9d:	0f b6 00             	movzbl (%eax),%eax
  100ba0:	84 c0                	test   %al,%al
  100ba2:	74 65                	je     100c09 <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ba4:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ba8:	75 14                	jne    100bbe <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100baa:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bb1:	00 
  100bb2:	c7 04 24 a1 36 10 00 	movl   $0x1036a1,(%esp)
  100bb9:	e8 c6 f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bc1:	8d 50 01             	lea    0x1(%eax),%edx
  100bc4:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bc7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bce:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bd1:	01 c2                	add    %eax,%edx
  100bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd6:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bd8:	eb 03                	jmp    100bdd <parse+0x89>
            buf ++;
  100bda:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  100be0:	0f b6 00             	movzbl (%eax),%eax
  100be3:	84 c0                	test   %al,%al
  100be5:	74 8c                	je     100b73 <parse+0x1f>
  100be7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bea:	0f b6 00             	movzbl (%eax),%eax
  100bed:	0f be c0             	movsbl %al,%eax
  100bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf4:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  100bfb:	e8 32 1e 00 00       	call   102a32 <strchr>
  100c00:	85 c0                	test   %eax,%eax
  100c02:	74 d6                	je     100bda <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c04:	e9 6a ff ff ff       	jmp    100b73 <parse+0x1f>
            break;
  100c09:	90                   	nop
        }
    }
    return argc;
  100c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c0d:	c9                   	leave  
  100c0e:	c3                   	ret    

00100c0f <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c0f:	f3 0f 1e fb          	endbr32 
  100c13:	55                   	push   %ebp
  100c14:	89 e5                	mov    %esp,%ebp
  100c16:	53                   	push   %ebx
  100c17:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c1a:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c21:	8b 45 08             	mov    0x8(%ebp),%eax
  100c24:	89 04 24             	mov    %eax,(%esp)
  100c27:	e8 28 ff ff ff       	call   100b54 <parse>
  100c2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c33:	75 0a                	jne    100c3f <runcmd+0x30>
        return 0;
  100c35:	b8 00 00 00 00       	mov    $0x0,%eax
  100c3a:	e9 83 00 00 00       	jmp    100cc2 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c46:	eb 5a                	jmp    100ca2 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c48:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c4e:	89 d0                	mov    %edx,%eax
  100c50:	01 c0                	add    %eax,%eax
  100c52:	01 d0                	add    %edx,%eax
  100c54:	c1 e0 02             	shl    $0x2,%eax
  100c57:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c5c:	8b 00                	mov    (%eax),%eax
  100c5e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c62:	89 04 24             	mov    %eax,(%esp)
  100c65:	e8 24 1d 00 00       	call   10298e <strcmp>
  100c6a:	85 c0                	test   %eax,%eax
  100c6c:	75 31                	jne    100c9f <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c71:	89 d0                	mov    %edx,%eax
  100c73:	01 c0                	add    %eax,%eax
  100c75:	01 d0                	add    %edx,%eax
  100c77:	c1 e0 02             	shl    $0x2,%eax
  100c7a:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c7f:	8b 10                	mov    (%eax),%edx
  100c81:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c84:	83 c0 04             	add    $0x4,%eax
  100c87:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c8a:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c8d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c90:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c94:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c98:	89 1c 24             	mov    %ebx,(%esp)
  100c9b:	ff d2                	call   *%edx
  100c9d:	eb 23                	jmp    100cc2 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c9f:	ff 45 f4             	incl   -0xc(%ebp)
  100ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ca5:	83 f8 02             	cmp    $0x2,%eax
  100ca8:	76 9e                	jbe    100c48 <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100caa:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cad:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb1:	c7 04 24 bf 36 10 00 	movl   $0x1036bf,(%esp)
  100cb8:	e8 c7 f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cbd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cc2:	83 c4 64             	add    $0x64,%esp
  100cc5:	5b                   	pop    %ebx
  100cc6:	5d                   	pop    %ebp
  100cc7:	c3                   	ret    

00100cc8 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cc8:	f3 0f 1e fb          	endbr32 
  100ccc:	55                   	push   %ebp
  100ccd:	89 e5                	mov    %esp,%ebp
  100ccf:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cd2:	c7 04 24 d8 36 10 00 	movl   $0x1036d8,(%esp)
  100cd9:	e8 a6 f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cde:	c7 04 24 00 37 10 00 	movl   $0x103700,(%esp)
  100ce5:	e8 9a f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100cea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cee:	74 0b                	je     100cfb <kmonitor+0x33>
        print_trapframe(tf);
  100cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf3:	89 04 24             	mov    %eax,(%esp)
  100cf6:	e8 69 0c 00 00       	call   101964 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cfb:	c7 04 24 25 37 10 00 	movl   $0x103725,(%esp)
  100d02:	e8 30 f6 ff ff       	call   100337 <readline>
  100d07:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d0e:	74 eb                	je     100cfb <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d10:	8b 45 08             	mov    0x8(%ebp),%eax
  100d13:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1a:	89 04 24             	mov    %eax,(%esp)
  100d1d:	e8 ed fe ff ff       	call   100c0f <runcmd>
  100d22:	85 c0                	test   %eax,%eax
  100d24:	78 02                	js     100d28 <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d26:	eb d3                	jmp    100cfb <kmonitor+0x33>
                break;
  100d28:	90                   	nop
            }
        }
    }
}
  100d29:	90                   	nop
  100d2a:	c9                   	leave  
  100d2b:	c3                   	ret    

00100d2c <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d2c:	f3 0f 1e fb          	endbr32 
  100d30:	55                   	push   %ebp
  100d31:	89 e5                	mov    %esp,%ebp
  100d33:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d3d:	eb 3d                	jmp    100d7c <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d42:	89 d0                	mov    %edx,%eax
  100d44:	01 c0                	add    %eax,%eax
  100d46:	01 d0                	add    %edx,%eax
  100d48:	c1 e0 02             	shl    $0x2,%eax
  100d4b:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d50:	8b 08                	mov    (%eax),%ecx
  100d52:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d55:	89 d0                	mov    %edx,%eax
  100d57:	01 c0                	add    %eax,%eax
  100d59:	01 d0                	add    %edx,%eax
  100d5b:	c1 e0 02             	shl    $0x2,%eax
  100d5e:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d63:	8b 00                	mov    (%eax),%eax
  100d65:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d69:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d6d:	c7 04 24 29 37 10 00 	movl   $0x103729,(%esp)
  100d74:	e8 0b f5 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d79:	ff 45 f4             	incl   -0xc(%ebp)
  100d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d7f:	83 f8 02             	cmp    $0x2,%eax
  100d82:	76 bb                	jbe    100d3f <mon_help+0x13>
    }
    return 0;
  100d84:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d89:	c9                   	leave  
  100d8a:	c3                   	ret    

00100d8b <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d8b:	f3 0f 1e fb          	endbr32 
  100d8f:	55                   	push   %ebp
  100d90:	89 e5                	mov    %esp,%ebp
  100d92:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d95:	e8 ad fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100d9a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d9f:	c9                   	leave  
  100da0:	c3                   	ret    

00100da1 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100da1:	f3 0f 1e fb          	endbr32 
  100da5:	55                   	push   %ebp
  100da6:	89 e5                	mov    %esp,%ebp
  100da8:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dab:	e8 e9 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100db0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db5:	c9                   	leave  
  100db6:	c3                   	ret    

00100db7 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100db7:	f3 0f 1e fb          	endbr32 
  100dbb:	55                   	push   %ebp
  100dbc:	89 e5                	mov    %esp,%ebp
  100dbe:	83 ec 28             	sub    $0x28,%esp
  100dc1:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dc7:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dcb:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dcf:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dd3:	ee                   	out    %al,(%dx)
}
  100dd4:	90                   	nop
  100dd5:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100ddb:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ddf:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100de3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100de7:	ee                   	out    %al,(%dx)
}
  100de8:	90                   	nop
  100de9:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100def:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100df7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dfb:	ee                   	out    %al,(%dx)
}
  100dfc:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dfd:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e04:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e07:	c7 04 24 32 37 10 00 	movl   $0x103732,(%esp)
  100e0e:	e8 71 f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e13:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e1a:	e8 31 09 00 00       	call   101750 <pic_enable>
}
  100e1f:	90                   	nop
  100e20:	c9                   	leave  
  100e21:	c3                   	ret    

00100e22 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e22:	f3 0f 1e fb          	endbr32 
  100e26:	55                   	push   %ebp
  100e27:	89 e5                	mov    %esp,%ebp
  100e29:	83 ec 10             	sub    $0x10,%esp
  100e2c:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e32:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e36:	89 c2                	mov    %eax,%edx
  100e38:	ec                   	in     (%dx),%al
  100e39:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e3c:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e42:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e46:	89 c2                	mov    %eax,%edx
  100e48:	ec                   	in     (%dx),%al
  100e49:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e4c:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e52:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e56:	89 c2                	mov    %eax,%edx
  100e58:	ec                   	in     (%dx),%al
  100e59:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e5c:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e62:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e66:	89 c2                	mov    %eax,%edx
  100e68:	ec                   	in     (%dx),%al
  100e69:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e6c:	90                   	nop
  100e6d:	c9                   	leave  
  100e6e:	c3                   	ret    

00100e6f <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e6f:	f3 0f 1e fb          	endbr32 
  100e73:	55                   	push   %ebp
  100e74:	89 e5                	mov    %esp,%ebp
  100e76:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e79:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e83:	0f b7 00             	movzwl (%eax),%eax
  100e86:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e8d:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e95:	0f b7 00             	movzwl (%eax),%eax
  100e98:	0f b7 c0             	movzwl %ax,%eax
  100e9b:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100ea0:	74 12                	je     100eb4 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100ea2:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100ea9:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100eb0:	b4 03 
  100eb2:	eb 13                	jmp    100ec7 <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100eb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eb7:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ebb:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ebe:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100ec5:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ec7:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ece:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ed2:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ed6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100eda:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ede:	ee                   	out    %al,(%dx)
}
  100edf:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ee0:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ee7:	40                   	inc    %eax
  100ee8:	0f b7 c0             	movzwl %ax,%eax
  100eeb:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eef:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ef3:	89 c2                	mov    %eax,%edx
  100ef5:	ec                   	in     (%dx),%al
  100ef6:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100ef9:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100efd:	0f b6 c0             	movzbl %al,%eax
  100f00:	c1 e0 08             	shl    $0x8,%eax
  100f03:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f06:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f0d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f11:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f15:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f19:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f1d:	ee                   	out    %al,(%dx)
}
  100f1e:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f1f:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f26:	40                   	inc    %eax
  100f27:	0f b7 c0             	movzwl %ax,%eax
  100f2a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f2e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f32:	89 c2                	mov    %eax,%edx
  100f34:	ec                   	in     (%dx),%al
  100f35:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f38:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f3c:	0f b6 c0             	movzbl %al,%eax
  100f3f:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f42:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f45:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f4d:	0f b7 c0             	movzwl %ax,%eax
  100f50:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f56:	90                   	nop
  100f57:	c9                   	leave  
  100f58:	c3                   	ret    

00100f59 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f59:	f3 0f 1e fb          	endbr32 
  100f5d:	55                   	push   %ebp
  100f5e:	89 e5                	mov    %esp,%ebp
  100f60:	83 ec 48             	sub    $0x48,%esp
  100f63:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f69:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f6d:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f71:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f75:	ee                   	out    %al,(%dx)
}
  100f76:	90                   	nop
  100f77:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f7d:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f81:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f85:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f89:	ee                   	out    %al,(%dx)
}
  100f8a:	90                   	nop
  100f8b:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f91:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f95:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f99:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f9d:	ee                   	out    %al,(%dx)
}
  100f9e:	90                   	nop
  100f9f:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fa5:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fa9:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fad:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fb1:	ee                   	out    %al,(%dx)
}
  100fb2:	90                   	nop
  100fb3:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fb9:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fbd:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fc1:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fc5:	ee                   	out    %al,(%dx)
}
  100fc6:	90                   	nop
  100fc7:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fcd:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd1:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fd5:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fd9:	ee                   	out    %al,(%dx)
}
  100fda:	90                   	nop
  100fdb:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fe1:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe5:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fe9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fed:	ee                   	out    %al,(%dx)
}
  100fee:	90                   	nop
  100fef:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ff5:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ff9:	89 c2                	mov    %eax,%edx
  100ffb:	ec                   	in     (%dx),%al
  100ffc:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100fff:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101003:	3c ff                	cmp    $0xff,%al
  101005:	0f 95 c0             	setne  %al
  101008:	0f b6 c0             	movzbl %al,%eax
  10100b:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101010:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101016:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10101a:	89 c2                	mov    %eax,%edx
  10101c:	ec                   	in     (%dx),%al
  10101d:	88 45 f1             	mov    %al,-0xf(%ebp)
  101020:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101026:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10102a:	89 c2                	mov    %eax,%edx
  10102c:	ec                   	in     (%dx),%al
  10102d:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101030:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101035:	85 c0                	test   %eax,%eax
  101037:	74 0c                	je     101045 <serial_init+0xec>
        pic_enable(IRQ_COM1);
  101039:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101040:	e8 0b 07 00 00       	call   101750 <pic_enable>
    }
}
  101045:	90                   	nop
  101046:	c9                   	leave  
  101047:	c3                   	ret    

00101048 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101048:	f3 0f 1e fb          	endbr32 
  10104c:	55                   	push   %ebp
  10104d:	89 e5                	mov    %esp,%ebp
  10104f:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101052:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101059:	eb 08                	jmp    101063 <lpt_putc_sub+0x1b>
        delay();
  10105b:	e8 c2 fd ff ff       	call   100e22 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101060:	ff 45 fc             	incl   -0x4(%ebp)
  101063:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101069:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10106d:	89 c2                	mov    %eax,%edx
  10106f:	ec                   	in     (%dx),%al
  101070:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101073:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101077:	84 c0                	test   %al,%al
  101079:	78 09                	js     101084 <lpt_putc_sub+0x3c>
  10107b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101082:	7e d7                	jle    10105b <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101084:	8b 45 08             	mov    0x8(%ebp),%eax
  101087:	0f b6 c0             	movzbl %al,%eax
  10108a:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101090:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101093:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101097:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10109b:	ee                   	out    %al,(%dx)
}
  10109c:	90                   	nop
  10109d:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010a3:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010ab:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010af:	ee                   	out    %al,(%dx)
}
  1010b0:	90                   	nop
  1010b1:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010b7:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010bb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010bf:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010c3:	ee                   	out    %al,(%dx)
}
  1010c4:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010c5:	90                   	nop
  1010c6:	c9                   	leave  
  1010c7:	c3                   	ret    

001010c8 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010c8:	f3 0f 1e fb          	endbr32 
  1010cc:	55                   	push   %ebp
  1010cd:	89 e5                	mov    %esp,%ebp
  1010cf:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010d2:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010d6:	74 0d                	je     1010e5 <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010db:	89 04 24             	mov    %eax,(%esp)
  1010de:	e8 65 ff ff ff       	call   101048 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010e3:	eb 24                	jmp    101109 <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010e5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010ec:	e8 57 ff ff ff       	call   101048 <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010f8:	e8 4b ff ff ff       	call   101048 <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101104:	e8 3f ff ff ff       	call   101048 <lpt_putc_sub>
}
  101109:	90                   	nop
  10110a:	c9                   	leave  
  10110b:	c3                   	ret    

0010110c <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10110c:	f3 0f 1e fb          	endbr32 
  101110:	55                   	push   %ebp
  101111:	89 e5                	mov    %esp,%ebp
  101113:	53                   	push   %ebx
  101114:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101117:	8b 45 08             	mov    0x8(%ebp),%eax
  10111a:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10111f:	85 c0                	test   %eax,%eax
  101121:	75 07                	jne    10112a <cga_putc+0x1e>
        c |= 0x0700;
  101123:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10112a:	8b 45 08             	mov    0x8(%ebp),%eax
  10112d:	0f b6 c0             	movzbl %al,%eax
  101130:	83 f8 0d             	cmp    $0xd,%eax
  101133:	74 72                	je     1011a7 <cga_putc+0x9b>
  101135:	83 f8 0d             	cmp    $0xd,%eax
  101138:	0f 8f a3 00 00 00    	jg     1011e1 <cga_putc+0xd5>
  10113e:	83 f8 08             	cmp    $0x8,%eax
  101141:	74 0a                	je     10114d <cga_putc+0x41>
  101143:	83 f8 0a             	cmp    $0xa,%eax
  101146:	74 4c                	je     101194 <cga_putc+0x88>
  101148:	e9 94 00 00 00       	jmp    1011e1 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  10114d:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101154:	85 c0                	test   %eax,%eax
  101156:	0f 84 af 00 00 00    	je     10120b <cga_putc+0xff>
            crt_pos --;
  10115c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101163:	48                   	dec    %eax
  101164:	0f b7 c0             	movzwl %ax,%eax
  101167:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10116d:	8b 45 08             	mov    0x8(%ebp),%eax
  101170:	98                   	cwtl   
  101171:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101176:	98                   	cwtl   
  101177:	83 c8 20             	or     $0x20,%eax
  10117a:	98                   	cwtl   
  10117b:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101181:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101188:	01 c9                	add    %ecx,%ecx
  10118a:	01 ca                	add    %ecx,%edx
  10118c:	0f b7 c0             	movzwl %ax,%eax
  10118f:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101192:	eb 77                	jmp    10120b <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101194:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10119b:	83 c0 50             	add    $0x50,%eax
  10119e:	0f b7 c0             	movzwl %ax,%eax
  1011a1:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011a7:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011ae:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011b5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011ba:	89 c8                	mov    %ecx,%eax
  1011bc:	f7 e2                	mul    %edx
  1011be:	c1 ea 06             	shr    $0x6,%edx
  1011c1:	89 d0                	mov    %edx,%eax
  1011c3:	c1 e0 02             	shl    $0x2,%eax
  1011c6:	01 d0                	add    %edx,%eax
  1011c8:	c1 e0 04             	shl    $0x4,%eax
  1011cb:	29 c1                	sub    %eax,%ecx
  1011cd:	89 c8                	mov    %ecx,%eax
  1011cf:	0f b7 c0             	movzwl %ax,%eax
  1011d2:	29 c3                	sub    %eax,%ebx
  1011d4:	89 d8                	mov    %ebx,%eax
  1011d6:	0f b7 c0             	movzwl %ax,%eax
  1011d9:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011df:	eb 2b                	jmp    10120c <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011e1:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011e7:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011ee:	8d 50 01             	lea    0x1(%eax),%edx
  1011f1:	0f b7 d2             	movzwl %dx,%edx
  1011f4:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011fb:	01 c0                	add    %eax,%eax
  1011fd:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101200:	8b 45 08             	mov    0x8(%ebp),%eax
  101203:	0f b7 c0             	movzwl %ax,%eax
  101206:	66 89 02             	mov    %ax,(%edx)
        break;
  101209:	eb 01                	jmp    10120c <cga_putc+0x100>
        break;
  10120b:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10120c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101213:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101218:	76 5d                	jbe    101277 <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10121a:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10121f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101225:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10122a:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101231:	00 
  101232:	89 54 24 04          	mov    %edx,0x4(%esp)
  101236:	89 04 24             	mov    %eax,(%esp)
  101239:	e8 f9 19 00 00       	call   102c37 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10123e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101245:	eb 14                	jmp    10125b <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  101247:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10124c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10124f:	01 d2                	add    %edx,%edx
  101251:	01 d0                	add    %edx,%eax
  101253:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101258:	ff 45 f4             	incl   -0xc(%ebp)
  10125b:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101262:	7e e3                	jle    101247 <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101264:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10126b:	83 e8 50             	sub    $0x50,%eax
  10126e:	0f b7 c0             	movzwl %ax,%eax
  101271:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101277:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10127e:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101282:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101286:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10128a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10128e:	ee                   	out    %al,(%dx)
}
  10128f:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101290:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101297:	c1 e8 08             	shr    $0x8,%eax
  10129a:	0f b7 c0             	movzwl %ax,%eax
  10129d:	0f b6 c0             	movzbl %al,%eax
  1012a0:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012a7:	42                   	inc    %edx
  1012a8:	0f b7 d2             	movzwl %dx,%edx
  1012ab:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012af:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012b6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012ba:	ee                   	out    %al,(%dx)
}
  1012bb:	90                   	nop
    outb(addr_6845, 15);
  1012bc:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012c3:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012c7:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012cb:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012cf:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012d3:	ee                   	out    %al,(%dx)
}
  1012d4:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012d5:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012dc:	0f b6 c0             	movzbl %al,%eax
  1012df:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012e6:	42                   	inc    %edx
  1012e7:	0f b7 d2             	movzwl %dx,%edx
  1012ea:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012ee:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012f1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012f5:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012f9:	ee                   	out    %al,(%dx)
}
  1012fa:	90                   	nop
}
  1012fb:	90                   	nop
  1012fc:	83 c4 34             	add    $0x34,%esp
  1012ff:	5b                   	pop    %ebx
  101300:	5d                   	pop    %ebp
  101301:	c3                   	ret    

00101302 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101302:	f3 0f 1e fb          	endbr32 
  101306:	55                   	push   %ebp
  101307:	89 e5                	mov    %esp,%ebp
  101309:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10130c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101313:	eb 08                	jmp    10131d <serial_putc_sub+0x1b>
        delay();
  101315:	e8 08 fb ff ff       	call   100e22 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10131a:	ff 45 fc             	incl   -0x4(%ebp)
  10131d:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101323:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101327:	89 c2                	mov    %eax,%edx
  101329:	ec                   	in     (%dx),%al
  10132a:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10132d:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101331:	0f b6 c0             	movzbl %al,%eax
  101334:	83 e0 20             	and    $0x20,%eax
  101337:	85 c0                	test   %eax,%eax
  101339:	75 09                	jne    101344 <serial_putc_sub+0x42>
  10133b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101342:	7e d1                	jle    101315 <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101344:	8b 45 08             	mov    0x8(%ebp),%eax
  101347:	0f b6 c0             	movzbl %al,%eax
  10134a:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101350:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101353:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101357:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10135b:	ee                   	out    %al,(%dx)
}
  10135c:	90                   	nop
}
  10135d:	90                   	nop
  10135e:	c9                   	leave  
  10135f:	c3                   	ret    

00101360 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101360:	f3 0f 1e fb          	endbr32 
  101364:	55                   	push   %ebp
  101365:	89 e5                	mov    %esp,%ebp
  101367:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10136a:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10136e:	74 0d                	je     10137d <serial_putc+0x1d>
        serial_putc_sub(c);
  101370:	8b 45 08             	mov    0x8(%ebp),%eax
  101373:	89 04 24             	mov    %eax,(%esp)
  101376:	e8 87 ff ff ff       	call   101302 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10137b:	eb 24                	jmp    1013a1 <serial_putc+0x41>
        serial_putc_sub('\b');
  10137d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101384:	e8 79 ff ff ff       	call   101302 <serial_putc_sub>
        serial_putc_sub(' ');
  101389:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101390:	e8 6d ff ff ff       	call   101302 <serial_putc_sub>
        serial_putc_sub('\b');
  101395:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10139c:	e8 61 ff ff ff       	call   101302 <serial_putc_sub>
}
  1013a1:	90                   	nop
  1013a2:	c9                   	leave  
  1013a3:	c3                   	ret    

001013a4 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013a4:	f3 0f 1e fb          	endbr32 
  1013a8:	55                   	push   %ebp
  1013a9:	89 e5                	mov    %esp,%ebp
  1013ab:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013ae:	eb 33                	jmp    1013e3 <cons_intr+0x3f>
        if (c != 0) {
  1013b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013b4:	74 2d                	je     1013e3 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013b6:	a1 84 00 11 00       	mov    0x110084,%eax
  1013bb:	8d 50 01             	lea    0x1(%eax),%edx
  1013be:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013c7:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013cd:	a1 84 00 11 00       	mov    0x110084,%eax
  1013d2:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013d7:	75 0a                	jne    1013e3 <cons_intr+0x3f>
                cons.wpos = 0;
  1013d9:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013e0:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1013e6:	ff d0                	call   *%eax
  1013e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013eb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013ef:	75 bf                	jne    1013b0 <cons_intr+0xc>
            }
        }
    }
}
  1013f1:	90                   	nop
  1013f2:	90                   	nop
  1013f3:	c9                   	leave  
  1013f4:	c3                   	ret    

001013f5 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013f5:	f3 0f 1e fb          	endbr32 
  1013f9:	55                   	push   %ebp
  1013fa:	89 e5                	mov    %esp,%ebp
  1013fc:	83 ec 10             	sub    $0x10,%esp
  1013ff:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101405:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101409:	89 c2                	mov    %eax,%edx
  10140b:	ec                   	in     (%dx),%al
  10140c:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10140f:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101413:	0f b6 c0             	movzbl %al,%eax
  101416:	83 e0 01             	and    $0x1,%eax
  101419:	85 c0                	test   %eax,%eax
  10141b:	75 07                	jne    101424 <serial_proc_data+0x2f>
        return -1;
  10141d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101422:	eb 2a                	jmp    10144e <serial_proc_data+0x59>
  101424:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10142a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10142e:	89 c2                	mov    %eax,%edx
  101430:	ec                   	in     (%dx),%al
  101431:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101434:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101438:	0f b6 c0             	movzbl %al,%eax
  10143b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10143e:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101442:	75 07                	jne    10144b <serial_proc_data+0x56>
        c = '\b';
  101444:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10144b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10144e:	c9                   	leave  
  10144f:	c3                   	ret    

00101450 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101450:	f3 0f 1e fb          	endbr32 
  101454:	55                   	push   %ebp
  101455:	89 e5                	mov    %esp,%ebp
  101457:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10145a:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10145f:	85 c0                	test   %eax,%eax
  101461:	74 0c                	je     10146f <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101463:	c7 04 24 f5 13 10 00 	movl   $0x1013f5,(%esp)
  10146a:	e8 35 ff ff ff       	call   1013a4 <cons_intr>
    }
}
  10146f:	90                   	nop
  101470:	c9                   	leave  
  101471:	c3                   	ret    

00101472 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101472:	f3 0f 1e fb          	endbr32 
  101476:	55                   	push   %ebp
  101477:	89 e5                	mov    %esp,%ebp
  101479:	83 ec 38             	sub    $0x38,%esp
  10147c:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101482:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101485:	89 c2                	mov    %eax,%edx
  101487:	ec                   	in     (%dx),%al
  101488:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10148b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10148f:	0f b6 c0             	movzbl %al,%eax
  101492:	83 e0 01             	and    $0x1,%eax
  101495:	85 c0                	test   %eax,%eax
  101497:	75 0a                	jne    1014a3 <kbd_proc_data+0x31>
        return -1;
  101499:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10149e:	e9 56 01 00 00       	jmp    1015f9 <kbd_proc_data+0x187>
  1014a3:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014ac:	89 c2                	mov    %eax,%edx
  1014ae:	ec                   	in     (%dx),%al
  1014af:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014b2:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014b6:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014b9:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014bd:	75 17                	jne    1014d6 <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014bf:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c4:	83 c8 40             	or     $0x40,%eax
  1014c7:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014cc:	b8 00 00 00 00       	mov    $0x0,%eax
  1014d1:	e9 23 01 00 00       	jmp    1015f9 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014d6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014da:	84 c0                	test   %al,%al
  1014dc:	79 45                	jns    101523 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014de:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e3:	83 e0 40             	and    $0x40,%eax
  1014e6:	85 c0                	test   %eax,%eax
  1014e8:	75 08                	jne    1014f2 <kbd_proc_data+0x80>
  1014ea:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ee:	24 7f                	and    $0x7f,%al
  1014f0:	eb 04                	jmp    1014f6 <kbd_proc_data+0x84>
  1014f2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f6:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014f9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fd:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101504:	0c 40                	or     $0x40,%al
  101506:	0f b6 c0             	movzbl %al,%eax
  101509:	f7 d0                	not    %eax
  10150b:	89 c2                	mov    %eax,%edx
  10150d:	a1 88 00 11 00       	mov    0x110088,%eax
  101512:	21 d0                	and    %edx,%eax
  101514:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101519:	b8 00 00 00 00       	mov    $0x0,%eax
  10151e:	e9 d6 00 00 00       	jmp    1015f9 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101523:	a1 88 00 11 00       	mov    0x110088,%eax
  101528:	83 e0 40             	and    $0x40,%eax
  10152b:	85 c0                	test   %eax,%eax
  10152d:	74 11                	je     101540 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10152f:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101533:	a1 88 00 11 00       	mov    0x110088,%eax
  101538:	83 e0 bf             	and    $0xffffffbf,%eax
  10153b:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101540:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101544:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10154b:	0f b6 d0             	movzbl %al,%edx
  10154e:	a1 88 00 11 00       	mov    0x110088,%eax
  101553:	09 d0                	or     %edx,%eax
  101555:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10155a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10155e:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101565:	0f b6 d0             	movzbl %al,%edx
  101568:	a1 88 00 11 00       	mov    0x110088,%eax
  10156d:	31 d0                	xor    %edx,%eax
  10156f:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101574:	a1 88 00 11 00       	mov    0x110088,%eax
  101579:	83 e0 03             	and    $0x3,%eax
  10157c:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101583:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101587:	01 d0                	add    %edx,%eax
  101589:	0f b6 00             	movzbl (%eax),%eax
  10158c:	0f b6 c0             	movzbl %al,%eax
  10158f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101592:	a1 88 00 11 00       	mov    0x110088,%eax
  101597:	83 e0 08             	and    $0x8,%eax
  10159a:	85 c0                	test   %eax,%eax
  10159c:	74 22                	je     1015c0 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  10159e:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015a2:	7e 0c                	jle    1015b0 <kbd_proc_data+0x13e>
  1015a4:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015a8:	7f 06                	jg     1015b0 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015aa:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015ae:	eb 10                	jmp    1015c0 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015b0:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015b4:	7e 0a                	jle    1015c0 <kbd_proc_data+0x14e>
  1015b6:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015ba:	7f 04                	jg     1015c0 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015bc:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015c0:	a1 88 00 11 00       	mov    0x110088,%eax
  1015c5:	f7 d0                	not    %eax
  1015c7:	83 e0 06             	and    $0x6,%eax
  1015ca:	85 c0                	test   %eax,%eax
  1015cc:	75 28                	jne    1015f6 <kbd_proc_data+0x184>
  1015ce:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015d5:	75 1f                	jne    1015f6 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015d7:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  1015de:	e8 a1 ec ff ff       	call   100284 <cprintf>
  1015e3:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015e9:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ed:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015f4:	ee                   	out    %al,(%dx)
}
  1015f5:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015f9:	c9                   	leave  
  1015fa:	c3                   	ret    

001015fb <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015fb:	f3 0f 1e fb          	endbr32 
  1015ff:	55                   	push   %ebp
  101600:	89 e5                	mov    %esp,%ebp
  101602:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101605:	c7 04 24 72 14 10 00 	movl   $0x101472,(%esp)
  10160c:	e8 93 fd ff ff       	call   1013a4 <cons_intr>
}
  101611:	90                   	nop
  101612:	c9                   	leave  
  101613:	c3                   	ret    

00101614 <kbd_init>:

static void
kbd_init(void) {
  101614:	f3 0f 1e fb          	endbr32 
  101618:	55                   	push   %ebp
  101619:	89 e5                	mov    %esp,%ebp
  10161b:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10161e:	e8 d8 ff ff ff       	call   1015fb <kbd_intr>
    pic_enable(IRQ_KBD);
  101623:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10162a:	e8 21 01 00 00       	call   101750 <pic_enable>
}
  10162f:	90                   	nop
  101630:	c9                   	leave  
  101631:	c3                   	ret    

00101632 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101632:	f3 0f 1e fb          	endbr32 
  101636:	55                   	push   %ebp
  101637:	89 e5                	mov    %esp,%ebp
  101639:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10163c:	e8 2e f8 ff ff       	call   100e6f <cga_init>
    serial_init();
  101641:	e8 13 f9 ff ff       	call   100f59 <serial_init>
    kbd_init();
  101646:	e8 c9 ff ff ff       	call   101614 <kbd_init>
    if (!serial_exists) {
  10164b:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101650:	85 c0                	test   %eax,%eax
  101652:	75 0c                	jne    101660 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101654:	c7 04 24 59 37 10 00 	movl   $0x103759,(%esp)
  10165b:	e8 24 ec ff ff       	call   100284 <cprintf>
    }
}
  101660:	90                   	nop
  101661:	c9                   	leave  
  101662:	c3                   	ret    

00101663 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101663:	f3 0f 1e fb          	endbr32 
  101667:	55                   	push   %ebp
  101668:	89 e5                	mov    %esp,%ebp
  10166a:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10166d:	8b 45 08             	mov    0x8(%ebp),%eax
  101670:	89 04 24             	mov    %eax,(%esp)
  101673:	e8 50 fa ff ff       	call   1010c8 <lpt_putc>
    cga_putc(c);
  101678:	8b 45 08             	mov    0x8(%ebp),%eax
  10167b:	89 04 24             	mov    %eax,(%esp)
  10167e:	e8 89 fa ff ff       	call   10110c <cga_putc>
    serial_putc(c);
  101683:	8b 45 08             	mov    0x8(%ebp),%eax
  101686:	89 04 24             	mov    %eax,(%esp)
  101689:	e8 d2 fc ff ff       	call   101360 <serial_putc>
}
  10168e:	90                   	nop
  10168f:	c9                   	leave  
  101690:	c3                   	ret    

00101691 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101691:	f3 0f 1e fb          	endbr32 
  101695:	55                   	push   %ebp
  101696:	89 e5                	mov    %esp,%ebp
  101698:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10169b:	e8 b0 fd ff ff       	call   101450 <serial_intr>
    kbd_intr();
  1016a0:	e8 56 ff ff ff       	call   1015fb <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016a5:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016ab:	a1 84 00 11 00       	mov    0x110084,%eax
  1016b0:	39 c2                	cmp    %eax,%edx
  1016b2:	74 36                	je     1016ea <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016b4:	a1 80 00 11 00       	mov    0x110080,%eax
  1016b9:	8d 50 01             	lea    0x1(%eax),%edx
  1016bc:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016c2:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016c9:	0f b6 c0             	movzbl %al,%eax
  1016cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016cf:	a1 80 00 11 00       	mov    0x110080,%eax
  1016d4:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016d9:	75 0a                	jne    1016e5 <cons_getc+0x54>
            cons.rpos = 0;
  1016db:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016e2:	00 00 00 
        }
        return c;
  1016e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016e8:	eb 05                	jmp    1016ef <cons_getc+0x5e>
    }
    return 0;
  1016ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016ef:	c9                   	leave  
  1016f0:	c3                   	ret    

001016f1 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016f1:	f3 0f 1e fb          	endbr32 
  1016f5:	55                   	push   %ebp
  1016f6:	89 e5                	mov    %esp,%ebp
  1016f8:	83 ec 14             	sub    $0x14,%esp
  1016fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1016fe:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101702:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101705:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  10170b:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101710:	85 c0                	test   %eax,%eax
  101712:	74 39                	je     10174d <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101714:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101717:	0f b6 c0             	movzbl %al,%eax
  10171a:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101720:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101723:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101727:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10172b:	ee                   	out    %al,(%dx)
}
  10172c:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10172d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101731:	c1 e8 08             	shr    $0x8,%eax
  101734:	0f b7 c0             	movzwl %ax,%eax
  101737:	0f b6 c0             	movzbl %al,%eax
  10173a:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101740:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101743:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101747:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10174b:	ee                   	out    %al,(%dx)
}
  10174c:	90                   	nop
    }
}
  10174d:	90                   	nop
  10174e:	c9                   	leave  
  10174f:	c3                   	ret    

00101750 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101750:	f3 0f 1e fb          	endbr32 
  101754:	55                   	push   %ebp
  101755:	89 e5                	mov    %esp,%ebp
  101757:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10175a:	8b 45 08             	mov    0x8(%ebp),%eax
  10175d:	ba 01 00 00 00       	mov    $0x1,%edx
  101762:	88 c1                	mov    %al,%cl
  101764:	d3 e2                	shl    %cl,%edx
  101766:	89 d0                	mov    %edx,%eax
  101768:	98                   	cwtl   
  101769:	f7 d0                	not    %eax
  10176b:	0f bf d0             	movswl %ax,%edx
  10176e:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101775:	98                   	cwtl   
  101776:	21 d0                	and    %edx,%eax
  101778:	98                   	cwtl   
  101779:	0f b7 c0             	movzwl %ax,%eax
  10177c:	89 04 24             	mov    %eax,(%esp)
  10177f:	e8 6d ff ff ff       	call   1016f1 <pic_setmask>
}
  101784:	90                   	nop
  101785:	c9                   	leave  
  101786:	c3                   	ret    

00101787 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101787:	f3 0f 1e fb          	endbr32 
  10178b:	55                   	push   %ebp
  10178c:	89 e5                	mov    %esp,%ebp
  10178e:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101791:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101798:	00 00 00 
  10179b:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017a1:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017a5:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017a9:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017ad:	ee                   	out    %al,(%dx)
}
  1017ae:	90                   	nop
  1017af:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017b5:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b9:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017bd:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c1:	ee                   	out    %al,(%dx)
}
  1017c2:	90                   	nop
  1017c3:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017c9:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017cd:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017d1:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017d5:	ee                   	out    %al,(%dx)
}
  1017d6:	90                   	nop
  1017d7:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017dd:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e1:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017e5:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017e9:	ee                   	out    %al,(%dx)
}
  1017ea:	90                   	nop
  1017eb:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017f1:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f5:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017f9:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017fd:	ee                   	out    %al,(%dx)
}
  1017fe:	90                   	nop
  1017ff:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101805:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101809:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10180d:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101811:	ee                   	out    %al,(%dx)
}
  101812:	90                   	nop
  101813:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101819:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181d:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101821:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101825:	ee                   	out    %al,(%dx)
}
  101826:	90                   	nop
  101827:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  10182d:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101831:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101835:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101839:	ee                   	out    %al,(%dx)
}
  10183a:	90                   	nop
  10183b:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101841:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101845:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101849:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10184d:	ee                   	out    %al,(%dx)
}
  10184e:	90                   	nop
  10184f:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101855:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101859:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10185d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101861:	ee                   	out    %al,(%dx)
}
  101862:	90                   	nop
  101863:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101869:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10186d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101871:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101875:	ee                   	out    %al,(%dx)
}
  101876:	90                   	nop
  101877:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10187d:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101881:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101885:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101889:	ee                   	out    %al,(%dx)
}
  10188a:	90                   	nop
  10188b:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101891:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101895:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101899:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10189d:	ee                   	out    %al,(%dx)
}
  10189e:	90                   	nop
  10189f:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018a5:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018a9:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018ad:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018b1:	ee                   	out    %al,(%dx)
}
  1018b2:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018b3:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018ba:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018bf:	74 0f                	je     1018d0 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018c1:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018c8:	89 04 24             	mov    %eax,(%esp)
  1018cb:	e8 21 fe ff ff       	call   1016f1 <pic_setmask>
    }
}
  1018d0:	90                   	nop
  1018d1:	c9                   	leave  
  1018d2:	c3                   	ret    

001018d3 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018d3:	f3 0f 1e fb          	endbr32 
  1018d7:	55                   	push   %ebp
  1018d8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018da:	fb                   	sti    
}
  1018db:	90                   	nop
    sti();
}
  1018dc:	90                   	nop
  1018dd:	5d                   	pop    %ebp
  1018de:	c3                   	ret    

001018df <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018df:	f3 0f 1e fb          	endbr32 
  1018e3:	55                   	push   %ebp
  1018e4:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018e6:	fa                   	cli    
}
  1018e7:	90                   	nop
    cli();
}
  1018e8:	90                   	nop
  1018e9:	5d                   	pop    %ebp
  1018ea:	c3                   	ret    

001018eb <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018eb:	f3 0f 1e fb          	endbr32 
  1018ef:	55                   	push   %ebp
  1018f0:	89 e5                	mov    %esp,%ebp
  1018f2:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018f5:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1018fc:	00 
  1018fd:	c7 04 24 80 37 10 00 	movl   $0x103780,(%esp)
  101904:	e8 7b e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101909:	90                   	nop
  10190a:	c9                   	leave  
  10190b:	c3                   	ret    

0010190c <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10190c:	f3 0f 1e fb          	endbr32 
  101910:	55                   	push   %ebp
  101911:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101913:	90                   	nop
  101914:	5d                   	pop    %ebp
  101915:	c3                   	ret    

00101916 <trapname>:

static const char *
trapname(int trapno) {
  101916:	f3 0f 1e fb          	endbr32 
  10191a:	55                   	push   %ebp
  10191b:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10191d:	8b 45 08             	mov    0x8(%ebp),%eax
  101920:	83 f8 13             	cmp    $0x13,%eax
  101923:	77 0c                	ja     101931 <trapname+0x1b>
        return excnames[trapno];
  101925:	8b 45 08             	mov    0x8(%ebp),%eax
  101928:	8b 04 85 e0 3a 10 00 	mov    0x103ae0(,%eax,4),%eax
  10192f:	eb 18                	jmp    101949 <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101931:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101935:	7e 0d                	jle    101944 <trapname+0x2e>
  101937:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10193b:	7f 07                	jg     101944 <trapname+0x2e>
        return "Hardware Interrupt";
  10193d:	b8 8a 37 10 00       	mov    $0x10378a,%eax
  101942:	eb 05                	jmp    101949 <trapname+0x33>
    }
    return "(unknown trap)";
  101944:	b8 9d 37 10 00       	mov    $0x10379d,%eax
}
  101949:	5d                   	pop    %ebp
  10194a:	c3                   	ret    

0010194b <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10194b:	f3 0f 1e fb          	endbr32 
  10194f:	55                   	push   %ebp
  101950:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101952:	8b 45 08             	mov    0x8(%ebp),%eax
  101955:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101959:	83 f8 08             	cmp    $0x8,%eax
  10195c:	0f 94 c0             	sete   %al
  10195f:	0f b6 c0             	movzbl %al,%eax
}
  101962:	5d                   	pop    %ebp
  101963:	c3                   	ret    

00101964 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101964:	f3 0f 1e fb          	endbr32 
  101968:	55                   	push   %ebp
  101969:	89 e5                	mov    %esp,%ebp
  10196b:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10196e:	8b 45 08             	mov    0x8(%ebp),%eax
  101971:	89 44 24 04          	mov    %eax,0x4(%esp)
  101975:	c7 04 24 de 37 10 00 	movl   $0x1037de,(%esp)
  10197c:	e8 03 e9 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101981:	8b 45 08             	mov    0x8(%ebp),%eax
  101984:	89 04 24             	mov    %eax,(%esp)
  101987:	e8 8d 01 00 00       	call   101b19 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  10198c:	8b 45 08             	mov    0x8(%ebp),%eax
  10198f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101993:	89 44 24 04          	mov    %eax,0x4(%esp)
  101997:	c7 04 24 ef 37 10 00 	movl   $0x1037ef,(%esp)
  10199e:	e8 e1 e8 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a6:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ae:	c7 04 24 02 38 10 00 	movl   $0x103802,(%esp)
  1019b5:	e8 ca e8 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1019ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bd:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c5:	c7 04 24 15 38 10 00 	movl   $0x103815,(%esp)
  1019cc:	e8 b3 e8 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d4:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1019d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019dc:	c7 04 24 28 38 10 00 	movl   $0x103828,(%esp)
  1019e3:	e8 9c e8 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019eb:	8b 40 30             	mov    0x30(%eax),%eax
  1019ee:	89 04 24             	mov    %eax,(%esp)
  1019f1:	e8 20 ff ff ff       	call   101916 <trapname>
  1019f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1019f9:	8b 52 30             	mov    0x30(%edx),%edx
  1019fc:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a00:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a04:	c7 04 24 3b 38 10 00 	movl   $0x10383b,(%esp)
  101a0b:	e8 74 e8 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a10:	8b 45 08             	mov    0x8(%ebp),%eax
  101a13:	8b 40 34             	mov    0x34(%eax),%eax
  101a16:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1a:	c7 04 24 4d 38 10 00 	movl   $0x10384d,(%esp)
  101a21:	e8 5e e8 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a26:	8b 45 08             	mov    0x8(%ebp),%eax
  101a29:	8b 40 38             	mov    0x38(%eax),%eax
  101a2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a30:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  101a37:	e8 48 e8 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a47:	c7 04 24 6b 38 10 00 	movl   $0x10386b,(%esp)
  101a4e:	e8 31 e8 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a53:	8b 45 08             	mov    0x8(%ebp),%eax
  101a56:	8b 40 40             	mov    0x40(%eax),%eax
  101a59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a5d:	c7 04 24 7e 38 10 00 	movl   $0x10387e,(%esp)
  101a64:	e8 1b e8 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a69:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a70:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a77:	eb 3d                	jmp    101ab6 <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a79:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7c:	8b 50 40             	mov    0x40(%eax),%edx
  101a7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a82:	21 d0                	and    %edx,%eax
  101a84:	85 c0                	test   %eax,%eax
  101a86:	74 28                	je     101ab0 <print_trapframe+0x14c>
  101a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a8b:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101a92:	85 c0                	test   %eax,%eax
  101a94:	74 1a                	je     101ab0 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a99:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa4:	c7 04 24 8d 38 10 00 	movl   $0x10388d,(%esp)
  101aab:	e8 d4 e7 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ab0:	ff 45 f4             	incl   -0xc(%ebp)
  101ab3:	d1 65 f0             	shll   -0x10(%ebp)
  101ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ab9:	83 f8 17             	cmp    $0x17,%eax
  101abc:	76 bb                	jbe    101a79 <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101abe:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac1:	8b 40 40             	mov    0x40(%eax),%eax
  101ac4:	c1 e8 0c             	shr    $0xc,%eax
  101ac7:	83 e0 03             	and    $0x3,%eax
  101aca:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ace:	c7 04 24 91 38 10 00 	movl   $0x103891,(%esp)
  101ad5:	e8 aa e7 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101ada:	8b 45 08             	mov    0x8(%ebp),%eax
  101add:	89 04 24             	mov    %eax,(%esp)
  101ae0:	e8 66 fe ff ff       	call   10194b <trap_in_kernel>
  101ae5:	85 c0                	test   %eax,%eax
  101ae7:	75 2d                	jne    101b16 <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aec:	8b 40 44             	mov    0x44(%eax),%eax
  101aef:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af3:	c7 04 24 9a 38 10 00 	movl   $0x10389a,(%esp)
  101afa:	e8 85 e7 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101aff:	8b 45 08             	mov    0x8(%ebp),%eax
  101b02:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b06:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b0a:	c7 04 24 a9 38 10 00 	movl   $0x1038a9,(%esp)
  101b11:	e8 6e e7 ff ff       	call   100284 <cprintf>
    }
}
  101b16:	90                   	nop
  101b17:	c9                   	leave  
  101b18:	c3                   	ret    

00101b19 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b19:	f3 0f 1e fb          	endbr32 
  101b1d:	55                   	push   %ebp
  101b1e:	89 e5                	mov    %esp,%ebp
  101b20:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b23:	8b 45 08             	mov    0x8(%ebp),%eax
  101b26:	8b 00                	mov    (%eax),%eax
  101b28:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2c:	c7 04 24 bc 38 10 00 	movl   $0x1038bc,(%esp)
  101b33:	e8 4c e7 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b38:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3b:	8b 40 04             	mov    0x4(%eax),%eax
  101b3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b42:	c7 04 24 cb 38 10 00 	movl   $0x1038cb,(%esp)
  101b49:	e8 36 e7 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b51:	8b 40 08             	mov    0x8(%eax),%eax
  101b54:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b58:	c7 04 24 da 38 10 00 	movl   $0x1038da,(%esp)
  101b5f:	e8 20 e7 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b64:	8b 45 08             	mov    0x8(%ebp),%eax
  101b67:	8b 40 0c             	mov    0xc(%eax),%eax
  101b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6e:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  101b75:	e8 0a e7 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7d:	8b 40 10             	mov    0x10(%eax),%eax
  101b80:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b84:	c7 04 24 f8 38 10 00 	movl   $0x1038f8,(%esp)
  101b8b:	e8 f4 e6 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 40 14             	mov    0x14(%eax),%eax
  101b96:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9a:	c7 04 24 07 39 10 00 	movl   $0x103907,(%esp)
  101ba1:	e8 de e6 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba9:	8b 40 18             	mov    0x18(%eax),%eax
  101bac:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb0:	c7 04 24 16 39 10 00 	movl   $0x103916,(%esp)
  101bb7:	e8 c8 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101bbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbf:	8b 40 1c             	mov    0x1c(%eax),%eax
  101bc2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc6:	c7 04 24 25 39 10 00 	movl   $0x103925,(%esp)
  101bcd:	e8 b2 e6 ff ff       	call   100284 <cprintf>
}
  101bd2:	90                   	nop
  101bd3:	c9                   	leave  
  101bd4:	c3                   	ret    

00101bd5 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bd5:	f3 0f 1e fb          	endbr32 
  101bd9:	55                   	push   %ebp
  101bda:	89 e5                	mov    %esp,%ebp
  101bdc:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101be2:	8b 40 30             	mov    0x30(%eax),%eax
  101be5:	83 f8 79             	cmp    $0x79,%eax
  101be8:	0f 87 99 00 00 00    	ja     101c87 <trap_dispatch+0xb2>
  101bee:	83 f8 78             	cmp    $0x78,%eax
  101bf1:	73 78                	jae    101c6b <trap_dispatch+0x96>
  101bf3:	83 f8 2f             	cmp    $0x2f,%eax
  101bf6:	0f 87 8b 00 00 00    	ja     101c87 <trap_dispatch+0xb2>
  101bfc:	83 f8 2e             	cmp    $0x2e,%eax
  101bff:	0f 83 b7 00 00 00    	jae    101cbc <trap_dispatch+0xe7>
  101c05:	83 f8 24             	cmp    $0x24,%eax
  101c08:	74 15                	je     101c1f <trap_dispatch+0x4a>
  101c0a:	83 f8 24             	cmp    $0x24,%eax
  101c0d:	77 78                	ja     101c87 <trap_dispatch+0xb2>
  101c0f:	83 f8 20             	cmp    $0x20,%eax
  101c12:	0f 84 a7 00 00 00    	je     101cbf <trap_dispatch+0xea>
  101c18:	83 f8 21             	cmp    $0x21,%eax
  101c1b:	74 28                	je     101c45 <trap_dispatch+0x70>
  101c1d:	eb 68                	jmp    101c87 <trap_dispatch+0xb2>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c1f:	e8 6d fa ff ff       	call   101691 <cons_getc>
  101c24:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c27:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c2b:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c2f:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c33:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c37:	c7 04 24 34 39 10 00 	movl   $0x103934,(%esp)
  101c3e:	e8 41 e6 ff ff       	call   100284 <cprintf>
        break;
  101c43:	eb 7b                	jmp    101cc0 <trap_dispatch+0xeb>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c45:	e8 47 fa ff ff       	call   101691 <cons_getc>
  101c4a:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c4d:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c51:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c55:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c5d:	c7 04 24 46 39 10 00 	movl   $0x103946,(%esp)
  101c64:	e8 1b e6 ff ff       	call   100284 <cprintf>
        break;
  101c69:	eb 55                	jmp    101cc0 <trap_dispatch+0xeb>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c6b:	c7 44 24 08 55 39 10 	movl   $0x103955,0x8(%esp)
  101c72:	00 
  101c73:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101c7a:	00 
  101c7b:	c7 04 24 65 39 10 00 	movl   $0x103965,(%esp)
  101c82:	e8 69 e7 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101c87:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101c8e:	83 e0 03             	and    $0x3,%eax
  101c91:	85 c0                	test   %eax,%eax
  101c93:	75 2b                	jne    101cc0 <trap_dispatch+0xeb>
            print_trapframe(tf);
  101c95:	8b 45 08             	mov    0x8(%ebp),%eax
  101c98:	89 04 24             	mov    %eax,(%esp)
  101c9b:	e8 c4 fc ff ff       	call   101964 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ca0:	c7 44 24 08 76 39 10 	movl   $0x103976,0x8(%esp)
  101ca7:	00 
  101ca8:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101caf:	00 
  101cb0:	c7 04 24 65 39 10 00 	movl   $0x103965,(%esp)
  101cb7:	e8 34 e7 ff ff       	call   1003f0 <__panic>
        break;
  101cbc:	90                   	nop
  101cbd:	eb 01                	jmp    101cc0 <trap_dispatch+0xeb>
        break;
  101cbf:	90                   	nop
        }
    }
}
  101cc0:	90                   	nop
  101cc1:	c9                   	leave  
  101cc2:	c3                   	ret    

00101cc3 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cc3:	f3 0f 1e fb          	endbr32 
  101cc7:	55                   	push   %ebp
  101cc8:	89 e5                	mov    %esp,%ebp
  101cca:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd0:	89 04 24             	mov    %eax,(%esp)
  101cd3:	e8 fd fe ff ff       	call   101bd5 <trap_dispatch>
}
  101cd8:	90                   	nop
  101cd9:	c9                   	leave  
  101cda:	c3                   	ret    

00101cdb <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101cdb:	6a 00                	push   $0x0
  pushl $0
  101cdd:	6a 00                	push   $0x0
  jmp __alltraps
  101cdf:	e9 69 0a 00 00       	jmp    10274d <__alltraps>

00101ce4 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ce4:	6a 00                	push   $0x0
  pushl $1
  101ce6:	6a 01                	push   $0x1
  jmp __alltraps
  101ce8:	e9 60 0a 00 00       	jmp    10274d <__alltraps>

00101ced <vector2>:
.globl vector2
vector2:
  pushl $0
  101ced:	6a 00                	push   $0x0
  pushl $2
  101cef:	6a 02                	push   $0x2
  jmp __alltraps
  101cf1:	e9 57 0a 00 00       	jmp    10274d <__alltraps>

00101cf6 <vector3>:
.globl vector3
vector3:
  pushl $0
  101cf6:	6a 00                	push   $0x0
  pushl $3
  101cf8:	6a 03                	push   $0x3
  jmp __alltraps
  101cfa:	e9 4e 0a 00 00       	jmp    10274d <__alltraps>

00101cff <vector4>:
.globl vector4
vector4:
  pushl $0
  101cff:	6a 00                	push   $0x0
  pushl $4
  101d01:	6a 04                	push   $0x4
  jmp __alltraps
  101d03:	e9 45 0a 00 00       	jmp    10274d <__alltraps>

00101d08 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d08:	6a 00                	push   $0x0
  pushl $5
  101d0a:	6a 05                	push   $0x5
  jmp __alltraps
  101d0c:	e9 3c 0a 00 00       	jmp    10274d <__alltraps>

00101d11 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d11:	6a 00                	push   $0x0
  pushl $6
  101d13:	6a 06                	push   $0x6
  jmp __alltraps
  101d15:	e9 33 0a 00 00       	jmp    10274d <__alltraps>

00101d1a <vector7>:
.globl vector7
vector7:
  pushl $0
  101d1a:	6a 00                	push   $0x0
  pushl $7
  101d1c:	6a 07                	push   $0x7
  jmp __alltraps
  101d1e:	e9 2a 0a 00 00       	jmp    10274d <__alltraps>

00101d23 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d23:	6a 08                	push   $0x8
  jmp __alltraps
  101d25:	e9 23 0a 00 00       	jmp    10274d <__alltraps>

00101d2a <vector9>:
.globl vector9
vector9:
  pushl $0
  101d2a:	6a 00                	push   $0x0
  pushl $9
  101d2c:	6a 09                	push   $0x9
  jmp __alltraps
  101d2e:	e9 1a 0a 00 00       	jmp    10274d <__alltraps>

00101d33 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d33:	6a 0a                	push   $0xa
  jmp __alltraps
  101d35:	e9 13 0a 00 00       	jmp    10274d <__alltraps>

00101d3a <vector11>:
.globl vector11
vector11:
  pushl $11
  101d3a:	6a 0b                	push   $0xb
  jmp __alltraps
  101d3c:	e9 0c 0a 00 00       	jmp    10274d <__alltraps>

00101d41 <vector12>:
.globl vector12
vector12:
  pushl $12
  101d41:	6a 0c                	push   $0xc
  jmp __alltraps
  101d43:	e9 05 0a 00 00       	jmp    10274d <__alltraps>

00101d48 <vector13>:
.globl vector13
vector13:
  pushl $13
  101d48:	6a 0d                	push   $0xd
  jmp __alltraps
  101d4a:	e9 fe 09 00 00       	jmp    10274d <__alltraps>

00101d4f <vector14>:
.globl vector14
vector14:
  pushl $14
  101d4f:	6a 0e                	push   $0xe
  jmp __alltraps
  101d51:	e9 f7 09 00 00       	jmp    10274d <__alltraps>

00101d56 <vector15>:
.globl vector15
vector15:
  pushl $0
  101d56:	6a 00                	push   $0x0
  pushl $15
  101d58:	6a 0f                	push   $0xf
  jmp __alltraps
  101d5a:	e9 ee 09 00 00       	jmp    10274d <__alltraps>

00101d5f <vector16>:
.globl vector16
vector16:
  pushl $0
  101d5f:	6a 00                	push   $0x0
  pushl $16
  101d61:	6a 10                	push   $0x10
  jmp __alltraps
  101d63:	e9 e5 09 00 00       	jmp    10274d <__alltraps>

00101d68 <vector17>:
.globl vector17
vector17:
  pushl $17
  101d68:	6a 11                	push   $0x11
  jmp __alltraps
  101d6a:	e9 de 09 00 00       	jmp    10274d <__alltraps>

00101d6f <vector18>:
.globl vector18
vector18:
  pushl $0
  101d6f:	6a 00                	push   $0x0
  pushl $18
  101d71:	6a 12                	push   $0x12
  jmp __alltraps
  101d73:	e9 d5 09 00 00       	jmp    10274d <__alltraps>

00101d78 <vector19>:
.globl vector19
vector19:
  pushl $0
  101d78:	6a 00                	push   $0x0
  pushl $19
  101d7a:	6a 13                	push   $0x13
  jmp __alltraps
  101d7c:	e9 cc 09 00 00       	jmp    10274d <__alltraps>

00101d81 <vector20>:
.globl vector20
vector20:
  pushl $0
  101d81:	6a 00                	push   $0x0
  pushl $20
  101d83:	6a 14                	push   $0x14
  jmp __alltraps
  101d85:	e9 c3 09 00 00       	jmp    10274d <__alltraps>

00101d8a <vector21>:
.globl vector21
vector21:
  pushl $0
  101d8a:	6a 00                	push   $0x0
  pushl $21
  101d8c:	6a 15                	push   $0x15
  jmp __alltraps
  101d8e:	e9 ba 09 00 00       	jmp    10274d <__alltraps>

00101d93 <vector22>:
.globl vector22
vector22:
  pushl $0
  101d93:	6a 00                	push   $0x0
  pushl $22
  101d95:	6a 16                	push   $0x16
  jmp __alltraps
  101d97:	e9 b1 09 00 00       	jmp    10274d <__alltraps>

00101d9c <vector23>:
.globl vector23
vector23:
  pushl $0
  101d9c:	6a 00                	push   $0x0
  pushl $23
  101d9e:	6a 17                	push   $0x17
  jmp __alltraps
  101da0:	e9 a8 09 00 00       	jmp    10274d <__alltraps>

00101da5 <vector24>:
.globl vector24
vector24:
  pushl $0
  101da5:	6a 00                	push   $0x0
  pushl $24
  101da7:	6a 18                	push   $0x18
  jmp __alltraps
  101da9:	e9 9f 09 00 00       	jmp    10274d <__alltraps>

00101dae <vector25>:
.globl vector25
vector25:
  pushl $0
  101dae:	6a 00                	push   $0x0
  pushl $25
  101db0:	6a 19                	push   $0x19
  jmp __alltraps
  101db2:	e9 96 09 00 00       	jmp    10274d <__alltraps>

00101db7 <vector26>:
.globl vector26
vector26:
  pushl $0
  101db7:	6a 00                	push   $0x0
  pushl $26
  101db9:	6a 1a                	push   $0x1a
  jmp __alltraps
  101dbb:	e9 8d 09 00 00       	jmp    10274d <__alltraps>

00101dc0 <vector27>:
.globl vector27
vector27:
  pushl $0
  101dc0:	6a 00                	push   $0x0
  pushl $27
  101dc2:	6a 1b                	push   $0x1b
  jmp __alltraps
  101dc4:	e9 84 09 00 00       	jmp    10274d <__alltraps>

00101dc9 <vector28>:
.globl vector28
vector28:
  pushl $0
  101dc9:	6a 00                	push   $0x0
  pushl $28
  101dcb:	6a 1c                	push   $0x1c
  jmp __alltraps
  101dcd:	e9 7b 09 00 00       	jmp    10274d <__alltraps>

00101dd2 <vector29>:
.globl vector29
vector29:
  pushl $0
  101dd2:	6a 00                	push   $0x0
  pushl $29
  101dd4:	6a 1d                	push   $0x1d
  jmp __alltraps
  101dd6:	e9 72 09 00 00       	jmp    10274d <__alltraps>

00101ddb <vector30>:
.globl vector30
vector30:
  pushl $0
  101ddb:	6a 00                	push   $0x0
  pushl $30
  101ddd:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ddf:	e9 69 09 00 00       	jmp    10274d <__alltraps>

00101de4 <vector31>:
.globl vector31
vector31:
  pushl $0
  101de4:	6a 00                	push   $0x0
  pushl $31
  101de6:	6a 1f                	push   $0x1f
  jmp __alltraps
  101de8:	e9 60 09 00 00       	jmp    10274d <__alltraps>

00101ded <vector32>:
.globl vector32
vector32:
  pushl $0
  101ded:	6a 00                	push   $0x0
  pushl $32
  101def:	6a 20                	push   $0x20
  jmp __alltraps
  101df1:	e9 57 09 00 00       	jmp    10274d <__alltraps>

00101df6 <vector33>:
.globl vector33
vector33:
  pushl $0
  101df6:	6a 00                	push   $0x0
  pushl $33
  101df8:	6a 21                	push   $0x21
  jmp __alltraps
  101dfa:	e9 4e 09 00 00       	jmp    10274d <__alltraps>

00101dff <vector34>:
.globl vector34
vector34:
  pushl $0
  101dff:	6a 00                	push   $0x0
  pushl $34
  101e01:	6a 22                	push   $0x22
  jmp __alltraps
  101e03:	e9 45 09 00 00       	jmp    10274d <__alltraps>

00101e08 <vector35>:
.globl vector35
vector35:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $35
  101e0a:	6a 23                	push   $0x23
  jmp __alltraps
  101e0c:	e9 3c 09 00 00       	jmp    10274d <__alltraps>

00101e11 <vector36>:
.globl vector36
vector36:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $36
  101e13:	6a 24                	push   $0x24
  jmp __alltraps
  101e15:	e9 33 09 00 00       	jmp    10274d <__alltraps>

00101e1a <vector37>:
.globl vector37
vector37:
  pushl $0
  101e1a:	6a 00                	push   $0x0
  pushl $37
  101e1c:	6a 25                	push   $0x25
  jmp __alltraps
  101e1e:	e9 2a 09 00 00       	jmp    10274d <__alltraps>

00101e23 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e23:	6a 00                	push   $0x0
  pushl $38
  101e25:	6a 26                	push   $0x26
  jmp __alltraps
  101e27:	e9 21 09 00 00       	jmp    10274d <__alltraps>

00101e2c <vector39>:
.globl vector39
vector39:
  pushl $0
  101e2c:	6a 00                	push   $0x0
  pushl $39
  101e2e:	6a 27                	push   $0x27
  jmp __alltraps
  101e30:	e9 18 09 00 00       	jmp    10274d <__alltraps>

00101e35 <vector40>:
.globl vector40
vector40:
  pushl $0
  101e35:	6a 00                	push   $0x0
  pushl $40
  101e37:	6a 28                	push   $0x28
  jmp __alltraps
  101e39:	e9 0f 09 00 00       	jmp    10274d <__alltraps>

00101e3e <vector41>:
.globl vector41
vector41:
  pushl $0
  101e3e:	6a 00                	push   $0x0
  pushl $41
  101e40:	6a 29                	push   $0x29
  jmp __alltraps
  101e42:	e9 06 09 00 00       	jmp    10274d <__alltraps>

00101e47 <vector42>:
.globl vector42
vector42:
  pushl $0
  101e47:	6a 00                	push   $0x0
  pushl $42
  101e49:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e4b:	e9 fd 08 00 00       	jmp    10274d <__alltraps>

00101e50 <vector43>:
.globl vector43
vector43:
  pushl $0
  101e50:	6a 00                	push   $0x0
  pushl $43
  101e52:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e54:	e9 f4 08 00 00       	jmp    10274d <__alltraps>

00101e59 <vector44>:
.globl vector44
vector44:
  pushl $0
  101e59:	6a 00                	push   $0x0
  pushl $44
  101e5b:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e5d:	e9 eb 08 00 00       	jmp    10274d <__alltraps>

00101e62 <vector45>:
.globl vector45
vector45:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $45
  101e64:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e66:	e9 e2 08 00 00       	jmp    10274d <__alltraps>

00101e6b <vector46>:
.globl vector46
vector46:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $46
  101e6d:	6a 2e                	push   $0x2e
  jmp __alltraps
  101e6f:	e9 d9 08 00 00       	jmp    10274d <__alltraps>

00101e74 <vector47>:
.globl vector47
vector47:
  pushl $0
  101e74:	6a 00                	push   $0x0
  pushl $47
  101e76:	6a 2f                	push   $0x2f
  jmp __alltraps
  101e78:	e9 d0 08 00 00       	jmp    10274d <__alltraps>

00101e7d <vector48>:
.globl vector48
vector48:
  pushl $0
  101e7d:	6a 00                	push   $0x0
  pushl $48
  101e7f:	6a 30                	push   $0x30
  jmp __alltraps
  101e81:	e9 c7 08 00 00       	jmp    10274d <__alltraps>

00101e86 <vector49>:
.globl vector49
vector49:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $49
  101e88:	6a 31                	push   $0x31
  jmp __alltraps
  101e8a:	e9 be 08 00 00       	jmp    10274d <__alltraps>

00101e8f <vector50>:
.globl vector50
vector50:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $50
  101e91:	6a 32                	push   $0x32
  jmp __alltraps
  101e93:	e9 b5 08 00 00       	jmp    10274d <__alltraps>

00101e98 <vector51>:
.globl vector51
vector51:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $51
  101e9a:	6a 33                	push   $0x33
  jmp __alltraps
  101e9c:	e9 ac 08 00 00       	jmp    10274d <__alltraps>

00101ea1 <vector52>:
.globl vector52
vector52:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $52
  101ea3:	6a 34                	push   $0x34
  jmp __alltraps
  101ea5:	e9 a3 08 00 00       	jmp    10274d <__alltraps>

00101eaa <vector53>:
.globl vector53
vector53:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $53
  101eac:	6a 35                	push   $0x35
  jmp __alltraps
  101eae:	e9 9a 08 00 00       	jmp    10274d <__alltraps>

00101eb3 <vector54>:
.globl vector54
vector54:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $54
  101eb5:	6a 36                	push   $0x36
  jmp __alltraps
  101eb7:	e9 91 08 00 00       	jmp    10274d <__alltraps>

00101ebc <vector55>:
.globl vector55
vector55:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $55
  101ebe:	6a 37                	push   $0x37
  jmp __alltraps
  101ec0:	e9 88 08 00 00       	jmp    10274d <__alltraps>

00101ec5 <vector56>:
.globl vector56
vector56:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $56
  101ec7:	6a 38                	push   $0x38
  jmp __alltraps
  101ec9:	e9 7f 08 00 00       	jmp    10274d <__alltraps>

00101ece <vector57>:
.globl vector57
vector57:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $57
  101ed0:	6a 39                	push   $0x39
  jmp __alltraps
  101ed2:	e9 76 08 00 00       	jmp    10274d <__alltraps>

00101ed7 <vector58>:
.globl vector58
vector58:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $58
  101ed9:	6a 3a                	push   $0x3a
  jmp __alltraps
  101edb:	e9 6d 08 00 00       	jmp    10274d <__alltraps>

00101ee0 <vector59>:
.globl vector59
vector59:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $59
  101ee2:	6a 3b                	push   $0x3b
  jmp __alltraps
  101ee4:	e9 64 08 00 00       	jmp    10274d <__alltraps>

00101ee9 <vector60>:
.globl vector60
vector60:
  pushl $0
  101ee9:	6a 00                	push   $0x0
  pushl $60
  101eeb:	6a 3c                	push   $0x3c
  jmp __alltraps
  101eed:	e9 5b 08 00 00       	jmp    10274d <__alltraps>

00101ef2 <vector61>:
.globl vector61
vector61:
  pushl $0
  101ef2:	6a 00                	push   $0x0
  pushl $61
  101ef4:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ef6:	e9 52 08 00 00       	jmp    10274d <__alltraps>

00101efb <vector62>:
.globl vector62
vector62:
  pushl $0
  101efb:	6a 00                	push   $0x0
  pushl $62
  101efd:	6a 3e                	push   $0x3e
  jmp __alltraps
  101eff:	e9 49 08 00 00       	jmp    10274d <__alltraps>

00101f04 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f04:	6a 00                	push   $0x0
  pushl $63
  101f06:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f08:	e9 40 08 00 00       	jmp    10274d <__alltraps>

00101f0d <vector64>:
.globl vector64
vector64:
  pushl $0
  101f0d:	6a 00                	push   $0x0
  pushl $64
  101f0f:	6a 40                	push   $0x40
  jmp __alltraps
  101f11:	e9 37 08 00 00       	jmp    10274d <__alltraps>

00101f16 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f16:	6a 00                	push   $0x0
  pushl $65
  101f18:	6a 41                	push   $0x41
  jmp __alltraps
  101f1a:	e9 2e 08 00 00       	jmp    10274d <__alltraps>

00101f1f <vector66>:
.globl vector66
vector66:
  pushl $0
  101f1f:	6a 00                	push   $0x0
  pushl $66
  101f21:	6a 42                	push   $0x42
  jmp __alltraps
  101f23:	e9 25 08 00 00       	jmp    10274d <__alltraps>

00101f28 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $67
  101f2a:	6a 43                	push   $0x43
  jmp __alltraps
  101f2c:	e9 1c 08 00 00       	jmp    10274d <__alltraps>

00101f31 <vector68>:
.globl vector68
vector68:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $68
  101f33:	6a 44                	push   $0x44
  jmp __alltraps
  101f35:	e9 13 08 00 00       	jmp    10274d <__alltraps>

00101f3a <vector69>:
.globl vector69
vector69:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $69
  101f3c:	6a 45                	push   $0x45
  jmp __alltraps
  101f3e:	e9 0a 08 00 00       	jmp    10274d <__alltraps>

00101f43 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $70
  101f45:	6a 46                	push   $0x46
  jmp __alltraps
  101f47:	e9 01 08 00 00       	jmp    10274d <__alltraps>

00101f4c <vector71>:
.globl vector71
vector71:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $71
  101f4e:	6a 47                	push   $0x47
  jmp __alltraps
  101f50:	e9 f8 07 00 00       	jmp    10274d <__alltraps>

00101f55 <vector72>:
.globl vector72
vector72:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $72
  101f57:	6a 48                	push   $0x48
  jmp __alltraps
  101f59:	e9 ef 07 00 00       	jmp    10274d <__alltraps>

00101f5e <vector73>:
.globl vector73
vector73:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $73
  101f60:	6a 49                	push   $0x49
  jmp __alltraps
  101f62:	e9 e6 07 00 00       	jmp    10274d <__alltraps>

00101f67 <vector74>:
.globl vector74
vector74:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $74
  101f69:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f6b:	e9 dd 07 00 00       	jmp    10274d <__alltraps>

00101f70 <vector75>:
.globl vector75
vector75:
  pushl $0
  101f70:	6a 00                	push   $0x0
  pushl $75
  101f72:	6a 4b                	push   $0x4b
  jmp __alltraps
  101f74:	e9 d4 07 00 00       	jmp    10274d <__alltraps>

00101f79 <vector76>:
.globl vector76
vector76:
  pushl $0
  101f79:	6a 00                	push   $0x0
  pushl $76
  101f7b:	6a 4c                	push   $0x4c
  jmp __alltraps
  101f7d:	e9 cb 07 00 00       	jmp    10274d <__alltraps>

00101f82 <vector77>:
.globl vector77
vector77:
  pushl $0
  101f82:	6a 00                	push   $0x0
  pushl $77
  101f84:	6a 4d                	push   $0x4d
  jmp __alltraps
  101f86:	e9 c2 07 00 00       	jmp    10274d <__alltraps>

00101f8b <vector78>:
.globl vector78
vector78:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $78
  101f8d:	6a 4e                	push   $0x4e
  jmp __alltraps
  101f8f:	e9 b9 07 00 00       	jmp    10274d <__alltraps>

00101f94 <vector79>:
.globl vector79
vector79:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $79
  101f96:	6a 4f                	push   $0x4f
  jmp __alltraps
  101f98:	e9 b0 07 00 00       	jmp    10274d <__alltraps>

00101f9d <vector80>:
.globl vector80
vector80:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $80
  101f9f:	6a 50                	push   $0x50
  jmp __alltraps
  101fa1:	e9 a7 07 00 00       	jmp    10274d <__alltraps>

00101fa6 <vector81>:
.globl vector81
vector81:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $81
  101fa8:	6a 51                	push   $0x51
  jmp __alltraps
  101faa:	e9 9e 07 00 00       	jmp    10274d <__alltraps>

00101faf <vector82>:
.globl vector82
vector82:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $82
  101fb1:	6a 52                	push   $0x52
  jmp __alltraps
  101fb3:	e9 95 07 00 00       	jmp    10274d <__alltraps>

00101fb8 <vector83>:
.globl vector83
vector83:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $83
  101fba:	6a 53                	push   $0x53
  jmp __alltraps
  101fbc:	e9 8c 07 00 00       	jmp    10274d <__alltraps>

00101fc1 <vector84>:
.globl vector84
vector84:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $84
  101fc3:	6a 54                	push   $0x54
  jmp __alltraps
  101fc5:	e9 83 07 00 00       	jmp    10274d <__alltraps>

00101fca <vector85>:
.globl vector85
vector85:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $85
  101fcc:	6a 55                	push   $0x55
  jmp __alltraps
  101fce:	e9 7a 07 00 00       	jmp    10274d <__alltraps>

00101fd3 <vector86>:
.globl vector86
vector86:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $86
  101fd5:	6a 56                	push   $0x56
  jmp __alltraps
  101fd7:	e9 71 07 00 00       	jmp    10274d <__alltraps>

00101fdc <vector87>:
.globl vector87
vector87:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $87
  101fde:	6a 57                	push   $0x57
  jmp __alltraps
  101fe0:	e9 68 07 00 00       	jmp    10274d <__alltraps>

00101fe5 <vector88>:
.globl vector88
vector88:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $88
  101fe7:	6a 58                	push   $0x58
  jmp __alltraps
  101fe9:	e9 5f 07 00 00       	jmp    10274d <__alltraps>

00101fee <vector89>:
.globl vector89
vector89:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $89
  101ff0:	6a 59                	push   $0x59
  jmp __alltraps
  101ff2:	e9 56 07 00 00       	jmp    10274d <__alltraps>

00101ff7 <vector90>:
.globl vector90
vector90:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $90
  101ff9:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ffb:	e9 4d 07 00 00       	jmp    10274d <__alltraps>

00102000 <vector91>:
.globl vector91
vector91:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $91
  102002:	6a 5b                	push   $0x5b
  jmp __alltraps
  102004:	e9 44 07 00 00       	jmp    10274d <__alltraps>

00102009 <vector92>:
.globl vector92
vector92:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $92
  10200b:	6a 5c                	push   $0x5c
  jmp __alltraps
  10200d:	e9 3b 07 00 00       	jmp    10274d <__alltraps>

00102012 <vector93>:
.globl vector93
vector93:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $93
  102014:	6a 5d                	push   $0x5d
  jmp __alltraps
  102016:	e9 32 07 00 00       	jmp    10274d <__alltraps>

0010201b <vector94>:
.globl vector94
vector94:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $94
  10201d:	6a 5e                	push   $0x5e
  jmp __alltraps
  10201f:	e9 29 07 00 00       	jmp    10274d <__alltraps>

00102024 <vector95>:
.globl vector95
vector95:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $95
  102026:	6a 5f                	push   $0x5f
  jmp __alltraps
  102028:	e9 20 07 00 00       	jmp    10274d <__alltraps>

0010202d <vector96>:
.globl vector96
vector96:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $96
  10202f:	6a 60                	push   $0x60
  jmp __alltraps
  102031:	e9 17 07 00 00       	jmp    10274d <__alltraps>

00102036 <vector97>:
.globl vector97
vector97:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $97
  102038:	6a 61                	push   $0x61
  jmp __alltraps
  10203a:	e9 0e 07 00 00       	jmp    10274d <__alltraps>

0010203f <vector98>:
.globl vector98
vector98:
  pushl $0
  10203f:	6a 00                	push   $0x0
  pushl $98
  102041:	6a 62                	push   $0x62
  jmp __alltraps
  102043:	e9 05 07 00 00       	jmp    10274d <__alltraps>

00102048 <vector99>:
.globl vector99
vector99:
  pushl $0
  102048:	6a 00                	push   $0x0
  pushl $99
  10204a:	6a 63                	push   $0x63
  jmp __alltraps
  10204c:	e9 fc 06 00 00       	jmp    10274d <__alltraps>

00102051 <vector100>:
.globl vector100
vector100:
  pushl $0
  102051:	6a 00                	push   $0x0
  pushl $100
  102053:	6a 64                	push   $0x64
  jmp __alltraps
  102055:	e9 f3 06 00 00       	jmp    10274d <__alltraps>

0010205a <vector101>:
.globl vector101
vector101:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $101
  10205c:	6a 65                	push   $0x65
  jmp __alltraps
  10205e:	e9 ea 06 00 00       	jmp    10274d <__alltraps>

00102063 <vector102>:
.globl vector102
vector102:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $102
  102065:	6a 66                	push   $0x66
  jmp __alltraps
  102067:	e9 e1 06 00 00       	jmp    10274d <__alltraps>

0010206c <vector103>:
.globl vector103
vector103:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $103
  10206e:	6a 67                	push   $0x67
  jmp __alltraps
  102070:	e9 d8 06 00 00       	jmp    10274d <__alltraps>

00102075 <vector104>:
.globl vector104
vector104:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $104
  102077:	6a 68                	push   $0x68
  jmp __alltraps
  102079:	e9 cf 06 00 00       	jmp    10274d <__alltraps>

0010207e <vector105>:
.globl vector105
vector105:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $105
  102080:	6a 69                	push   $0x69
  jmp __alltraps
  102082:	e9 c6 06 00 00       	jmp    10274d <__alltraps>

00102087 <vector106>:
.globl vector106
vector106:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $106
  102089:	6a 6a                	push   $0x6a
  jmp __alltraps
  10208b:	e9 bd 06 00 00       	jmp    10274d <__alltraps>

00102090 <vector107>:
.globl vector107
vector107:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $107
  102092:	6a 6b                	push   $0x6b
  jmp __alltraps
  102094:	e9 b4 06 00 00       	jmp    10274d <__alltraps>

00102099 <vector108>:
.globl vector108
vector108:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $108
  10209b:	6a 6c                	push   $0x6c
  jmp __alltraps
  10209d:	e9 ab 06 00 00       	jmp    10274d <__alltraps>

001020a2 <vector109>:
.globl vector109
vector109:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $109
  1020a4:	6a 6d                	push   $0x6d
  jmp __alltraps
  1020a6:	e9 a2 06 00 00       	jmp    10274d <__alltraps>

001020ab <vector110>:
.globl vector110
vector110:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $110
  1020ad:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020af:	e9 99 06 00 00       	jmp    10274d <__alltraps>

001020b4 <vector111>:
.globl vector111
vector111:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $111
  1020b6:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020b8:	e9 90 06 00 00       	jmp    10274d <__alltraps>

001020bd <vector112>:
.globl vector112
vector112:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $112
  1020bf:	6a 70                	push   $0x70
  jmp __alltraps
  1020c1:	e9 87 06 00 00       	jmp    10274d <__alltraps>

001020c6 <vector113>:
.globl vector113
vector113:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $113
  1020c8:	6a 71                	push   $0x71
  jmp __alltraps
  1020ca:	e9 7e 06 00 00       	jmp    10274d <__alltraps>

001020cf <vector114>:
.globl vector114
vector114:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $114
  1020d1:	6a 72                	push   $0x72
  jmp __alltraps
  1020d3:	e9 75 06 00 00       	jmp    10274d <__alltraps>

001020d8 <vector115>:
.globl vector115
vector115:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $115
  1020da:	6a 73                	push   $0x73
  jmp __alltraps
  1020dc:	e9 6c 06 00 00       	jmp    10274d <__alltraps>

001020e1 <vector116>:
.globl vector116
vector116:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $116
  1020e3:	6a 74                	push   $0x74
  jmp __alltraps
  1020e5:	e9 63 06 00 00       	jmp    10274d <__alltraps>

001020ea <vector117>:
.globl vector117
vector117:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $117
  1020ec:	6a 75                	push   $0x75
  jmp __alltraps
  1020ee:	e9 5a 06 00 00       	jmp    10274d <__alltraps>

001020f3 <vector118>:
.globl vector118
vector118:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $118
  1020f5:	6a 76                	push   $0x76
  jmp __alltraps
  1020f7:	e9 51 06 00 00       	jmp    10274d <__alltraps>

001020fc <vector119>:
.globl vector119
vector119:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $119
  1020fe:	6a 77                	push   $0x77
  jmp __alltraps
  102100:	e9 48 06 00 00       	jmp    10274d <__alltraps>

00102105 <vector120>:
.globl vector120
vector120:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $120
  102107:	6a 78                	push   $0x78
  jmp __alltraps
  102109:	e9 3f 06 00 00       	jmp    10274d <__alltraps>

0010210e <vector121>:
.globl vector121
vector121:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $121
  102110:	6a 79                	push   $0x79
  jmp __alltraps
  102112:	e9 36 06 00 00       	jmp    10274d <__alltraps>

00102117 <vector122>:
.globl vector122
vector122:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $122
  102119:	6a 7a                	push   $0x7a
  jmp __alltraps
  10211b:	e9 2d 06 00 00       	jmp    10274d <__alltraps>

00102120 <vector123>:
.globl vector123
vector123:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $123
  102122:	6a 7b                	push   $0x7b
  jmp __alltraps
  102124:	e9 24 06 00 00       	jmp    10274d <__alltraps>

00102129 <vector124>:
.globl vector124
vector124:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $124
  10212b:	6a 7c                	push   $0x7c
  jmp __alltraps
  10212d:	e9 1b 06 00 00       	jmp    10274d <__alltraps>

00102132 <vector125>:
.globl vector125
vector125:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $125
  102134:	6a 7d                	push   $0x7d
  jmp __alltraps
  102136:	e9 12 06 00 00       	jmp    10274d <__alltraps>

0010213b <vector126>:
.globl vector126
vector126:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $126
  10213d:	6a 7e                	push   $0x7e
  jmp __alltraps
  10213f:	e9 09 06 00 00       	jmp    10274d <__alltraps>

00102144 <vector127>:
.globl vector127
vector127:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $127
  102146:	6a 7f                	push   $0x7f
  jmp __alltraps
  102148:	e9 00 06 00 00       	jmp    10274d <__alltraps>

0010214d <vector128>:
.globl vector128
vector128:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $128
  10214f:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102154:	e9 f4 05 00 00       	jmp    10274d <__alltraps>

00102159 <vector129>:
.globl vector129
vector129:
  pushl $0
  102159:	6a 00                	push   $0x0
  pushl $129
  10215b:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102160:	e9 e8 05 00 00       	jmp    10274d <__alltraps>

00102165 <vector130>:
.globl vector130
vector130:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $130
  102167:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10216c:	e9 dc 05 00 00       	jmp    10274d <__alltraps>

00102171 <vector131>:
.globl vector131
vector131:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $131
  102173:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102178:	e9 d0 05 00 00       	jmp    10274d <__alltraps>

0010217d <vector132>:
.globl vector132
vector132:
  pushl $0
  10217d:	6a 00                	push   $0x0
  pushl $132
  10217f:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102184:	e9 c4 05 00 00       	jmp    10274d <__alltraps>

00102189 <vector133>:
.globl vector133
vector133:
  pushl $0
  102189:	6a 00                	push   $0x0
  pushl $133
  10218b:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102190:	e9 b8 05 00 00       	jmp    10274d <__alltraps>

00102195 <vector134>:
.globl vector134
vector134:
  pushl $0
  102195:	6a 00                	push   $0x0
  pushl $134
  102197:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10219c:	e9 ac 05 00 00       	jmp    10274d <__alltraps>

001021a1 <vector135>:
.globl vector135
vector135:
  pushl $0
  1021a1:	6a 00                	push   $0x0
  pushl $135
  1021a3:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1021a8:	e9 a0 05 00 00       	jmp    10274d <__alltraps>

001021ad <vector136>:
.globl vector136
vector136:
  pushl $0
  1021ad:	6a 00                	push   $0x0
  pushl $136
  1021af:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021b4:	e9 94 05 00 00       	jmp    10274d <__alltraps>

001021b9 <vector137>:
.globl vector137
vector137:
  pushl $0
  1021b9:	6a 00                	push   $0x0
  pushl $137
  1021bb:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021c0:	e9 88 05 00 00       	jmp    10274d <__alltraps>

001021c5 <vector138>:
.globl vector138
vector138:
  pushl $0
  1021c5:	6a 00                	push   $0x0
  pushl $138
  1021c7:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021cc:	e9 7c 05 00 00       	jmp    10274d <__alltraps>

001021d1 <vector139>:
.globl vector139
vector139:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $139
  1021d3:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1021d8:	e9 70 05 00 00       	jmp    10274d <__alltraps>

001021dd <vector140>:
.globl vector140
vector140:
  pushl $0
  1021dd:	6a 00                	push   $0x0
  pushl $140
  1021df:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1021e4:	e9 64 05 00 00       	jmp    10274d <__alltraps>

001021e9 <vector141>:
.globl vector141
vector141:
  pushl $0
  1021e9:	6a 00                	push   $0x0
  pushl $141
  1021eb:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1021f0:	e9 58 05 00 00       	jmp    10274d <__alltraps>

001021f5 <vector142>:
.globl vector142
vector142:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $142
  1021f7:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1021fc:	e9 4c 05 00 00       	jmp    10274d <__alltraps>

00102201 <vector143>:
.globl vector143
vector143:
  pushl $0
  102201:	6a 00                	push   $0x0
  pushl $143
  102203:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102208:	e9 40 05 00 00       	jmp    10274d <__alltraps>

0010220d <vector144>:
.globl vector144
vector144:
  pushl $0
  10220d:	6a 00                	push   $0x0
  pushl $144
  10220f:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102214:	e9 34 05 00 00       	jmp    10274d <__alltraps>

00102219 <vector145>:
.globl vector145
vector145:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $145
  10221b:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102220:	e9 28 05 00 00       	jmp    10274d <__alltraps>

00102225 <vector146>:
.globl vector146
vector146:
  pushl $0
  102225:	6a 00                	push   $0x0
  pushl $146
  102227:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10222c:	e9 1c 05 00 00       	jmp    10274d <__alltraps>

00102231 <vector147>:
.globl vector147
vector147:
  pushl $0
  102231:	6a 00                	push   $0x0
  pushl $147
  102233:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102238:	e9 10 05 00 00       	jmp    10274d <__alltraps>

0010223d <vector148>:
.globl vector148
vector148:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $148
  10223f:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102244:	e9 04 05 00 00       	jmp    10274d <__alltraps>

00102249 <vector149>:
.globl vector149
vector149:
  pushl $0
  102249:	6a 00                	push   $0x0
  pushl $149
  10224b:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102250:	e9 f8 04 00 00       	jmp    10274d <__alltraps>

00102255 <vector150>:
.globl vector150
vector150:
  pushl $0
  102255:	6a 00                	push   $0x0
  pushl $150
  102257:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10225c:	e9 ec 04 00 00       	jmp    10274d <__alltraps>

00102261 <vector151>:
.globl vector151
vector151:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $151
  102263:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102268:	e9 e0 04 00 00       	jmp    10274d <__alltraps>

0010226d <vector152>:
.globl vector152
vector152:
  pushl $0
  10226d:	6a 00                	push   $0x0
  pushl $152
  10226f:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102274:	e9 d4 04 00 00       	jmp    10274d <__alltraps>

00102279 <vector153>:
.globl vector153
vector153:
  pushl $0
  102279:	6a 00                	push   $0x0
  pushl $153
  10227b:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102280:	e9 c8 04 00 00       	jmp    10274d <__alltraps>

00102285 <vector154>:
.globl vector154
vector154:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $154
  102287:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10228c:	e9 bc 04 00 00       	jmp    10274d <__alltraps>

00102291 <vector155>:
.globl vector155
vector155:
  pushl $0
  102291:	6a 00                	push   $0x0
  pushl $155
  102293:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102298:	e9 b0 04 00 00       	jmp    10274d <__alltraps>

0010229d <vector156>:
.globl vector156
vector156:
  pushl $0
  10229d:	6a 00                	push   $0x0
  pushl $156
  10229f:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1022a4:	e9 a4 04 00 00       	jmp    10274d <__alltraps>

001022a9 <vector157>:
.globl vector157
vector157:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $157
  1022ab:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022b0:	e9 98 04 00 00       	jmp    10274d <__alltraps>

001022b5 <vector158>:
.globl vector158
vector158:
  pushl $0
  1022b5:	6a 00                	push   $0x0
  pushl $158
  1022b7:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022bc:	e9 8c 04 00 00       	jmp    10274d <__alltraps>

001022c1 <vector159>:
.globl vector159
vector159:
  pushl $0
  1022c1:	6a 00                	push   $0x0
  pushl $159
  1022c3:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022c8:	e9 80 04 00 00       	jmp    10274d <__alltraps>

001022cd <vector160>:
.globl vector160
vector160:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $160
  1022cf:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1022d4:	e9 74 04 00 00       	jmp    10274d <__alltraps>

001022d9 <vector161>:
.globl vector161
vector161:
  pushl $0
  1022d9:	6a 00                	push   $0x0
  pushl $161
  1022db:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1022e0:	e9 68 04 00 00       	jmp    10274d <__alltraps>

001022e5 <vector162>:
.globl vector162
vector162:
  pushl $0
  1022e5:	6a 00                	push   $0x0
  pushl $162
  1022e7:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1022ec:	e9 5c 04 00 00       	jmp    10274d <__alltraps>

001022f1 <vector163>:
.globl vector163
vector163:
  pushl $0
  1022f1:	6a 00                	push   $0x0
  pushl $163
  1022f3:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1022f8:	e9 50 04 00 00       	jmp    10274d <__alltraps>

001022fd <vector164>:
.globl vector164
vector164:
  pushl $0
  1022fd:	6a 00                	push   $0x0
  pushl $164
  1022ff:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102304:	e9 44 04 00 00       	jmp    10274d <__alltraps>

00102309 <vector165>:
.globl vector165
vector165:
  pushl $0
  102309:	6a 00                	push   $0x0
  pushl $165
  10230b:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102310:	e9 38 04 00 00       	jmp    10274d <__alltraps>

00102315 <vector166>:
.globl vector166
vector166:
  pushl $0
  102315:	6a 00                	push   $0x0
  pushl $166
  102317:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10231c:	e9 2c 04 00 00       	jmp    10274d <__alltraps>

00102321 <vector167>:
.globl vector167
vector167:
  pushl $0
  102321:	6a 00                	push   $0x0
  pushl $167
  102323:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102328:	e9 20 04 00 00       	jmp    10274d <__alltraps>

0010232d <vector168>:
.globl vector168
vector168:
  pushl $0
  10232d:	6a 00                	push   $0x0
  pushl $168
  10232f:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102334:	e9 14 04 00 00       	jmp    10274d <__alltraps>

00102339 <vector169>:
.globl vector169
vector169:
  pushl $0
  102339:	6a 00                	push   $0x0
  pushl $169
  10233b:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102340:	e9 08 04 00 00       	jmp    10274d <__alltraps>

00102345 <vector170>:
.globl vector170
vector170:
  pushl $0
  102345:	6a 00                	push   $0x0
  pushl $170
  102347:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10234c:	e9 fc 03 00 00       	jmp    10274d <__alltraps>

00102351 <vector171>:
.globl vector171
vector171:
  pushl $0
  102351:	6a 00                	push   $0x0
  pushl $171
  102353:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102358:	e9 f0 03 00 00       	jmp    10274d <__alltraps>

0010235d <vector172>:
.globl vector172
vector172:
  pushl $0
  10235d:	6a 00                	push   $0x0
  pushl $172
  10235f:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102364:	e9 e4 03 00 00       	jmp    10274d <__alltraps>

00102369 <vector173>:
.globl vector173
vector173:
  pushl $0
  102369:	6a 00                	push   $0x0
  pushl $173
  10236b:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102370:	e9 d8 03 00 00       	jmp    10274d <__alltraps>

00102375 <vector174>:
.globl vector174
vector174:
  pushl $0
  102375:	6a 00                	push   $0x0
  pushl $174
  102377:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10237c:	e9 cc 03 00 00       	jmp    10274d <__alltraps>

00102381 <vector175>:
.globl vector175
vector175:
  pushl $0
  102381:	6a 00                	push   $0x0
  pushl $175
  102383:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102388:	e9 c0 03 00 00       	jmp    10274d <__alltraps>

0010238d <vector176>:
.globl vector176
vector176:
  pushl $0
  10238d:	6a 00                	push   $0x0
  pushl $176
  10238f:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102394:	e9 b4 03 00 00       	jmp    10274d <__alltraps>

00102399 <vector177>:
.globl vector177
vector177:
  pushl $0
  102399:	6a 00                	push   $0x0
  pushl $177
  10239b:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1023a0:	e9 a8 03 00 00       	jmp    10274d <__alltraps>

001023a5 <vector178>:
.globl vector178
vector178:
  pushl $0
  1023a5:	6a 00                	push   $0x0
  pushl $178
  1023a7:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023ac:	e9 9c 03 00 00       	jmp    10274d <__alltraps>

001023b1 <vector179>:
.globl vector179
vector179:
  pushl $0
  1023b1:	6a 00                	push   $0x0
  pushl $179
  1023b3:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023b8:	e9 90 03 00 00       	jmp    10274d <__alltraps>

001023bd <vector180>:
.globl vector180
vector180:
  pushl $0
  1023bd:	6a 00                	push   $0x0
  pushl $180
  1023bf:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023c4:	e9 84 03 00 00       	jmp    10274d <__alltraps>

001023c9 <vector181>:
.globl vector181
vector181:
  pushl $0
  1023c9:	6a 00                	push   $0x0
  pushl $181
  1023cb:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1023d0:	e9 78 03 00 00       	jmp    10274d <__alltraps>

001023d5 <vector182>:
.globl vector182
vector182:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $182
  1023d7:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1023dc:	e9 6c 03 00 00       	jmp    10274d <__alltraps>

001023e1 <vector183>:
.globl vector183
vector183:
  pushl $0
  1023e1:	6a 00                	push   $0x0
  pushl $183
  1023e3:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1023e8:	e9 60 03 00 00       	jmp    10274d <__alltraps>

001023ed <vector184>:
.globl vector184
vector184:
  pushl $0
  1023ed:	6a 00                	push   $0x0
  pushl $184
  1023ef:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1023f4:	e9 54 03 00 00       	jmp    10274d <__alltraps>

001023f9 <vector185>:
.globl vector185
vector185:
  pushl $0
  1023f9:	6a 00                	push   $0x0
  pushl $185
  1023fb:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102400:	e9 48 03 00 00       	jmp    10274d <__alltraps>

00102405 <vector186>:
.globl vector186
vector186:
  pushl $0
  102405:	6a 00                	push   $0x0
  pushl $186
  102407:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10240c:	e9 3c 03 00 00       	jmp    10274d <__alltraps>

00102411 <vector187>:
.globl vector187
vector187:
  pushl $0
  102411:	6a 00                	push   $0x0
  pushl $187
  102413:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102418:	e9 30 03 00 00       	jmp    10274d <__alltraps>

0010241d <vector188>:
.globl vector188
vector188:
  pushl $0
  10241d:	6a 00                	push   $0x0
  pushl $188
  10241f:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102424:	e9 24 03 00 00       	jmp    10274d <__alltraps>

00102429 <vector189>:
.globl vector189
vector189:
  pushl $0
  102429:	6a 00                	push   $0x0
  pushl $189
  10242b:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102430:	e9 18 03 00 00       	jmp    10274d <__alltraps>

00102435 <vector190>:
.globl vector190
vector190:
  pushl $0
  102435:	6a 00                	push   $0x0
  pushl $190
  102437:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10243c:	e9 0c 03 00 00       	jmp    10274d <__alltraps>

00102441 <vector191>:
.globl vector191
vector191:
  pushl $0
  102441:	6a 00                	push   $0x0
  pushl $191
  102443:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102448:	e9 00 03 00 00       	jmp    10274d <__alltraps>

0010244d <vector192>:
.globl vector192
vector192:
  pushl $0
  10244d:	6a 00                	push   $0x0
  pushl $192
  10244f:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102454:	e9 f4 02 00 00       	jmp    10274d <__alltraps>

00102459 <vector193>:
.globl vector193
vector193:
  pushl $0
  102459:	6a 00                	push   $0x0
  pushl $193
  10245b:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102460:	e9 e8 02 00 00       	jmp    10274d <__alltraps>

00102465 <vector194>:
.globl vector194
vector194:
  pushl $0
  102465:	6a 00                	push   $0x0
  pushl $194
  102467:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10246c:	e9 dc 02 00 00       	jmp    10274d <__alltraps>

00102471 <vector195>:
.globl vector195
vector195:
  pushl $0
  102471:	6a 00                	push   $0x0
  pushl $195
  102473:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102478:	e9 d0 02 00 00       	jmp    10274d <__alltraps>

0010247d <vector196>:
.globl vector196
vector196:
  pushl $0
  10247d:	6a 00                	push   $0x0
  pushl $196
  10247f:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102484:	e9 c4 02 00 00       	jmp    10274d <__alltraps>

00102489 <vector197>:
.globl vector197
vector197:
  pushl $0
  102489:	6a 00                	push   $0x0
  pushl $197
  10248b:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102490:	e9 b8 02 00 00       	jmp    10274d <__alltraps>

00102495 <vector198>:
.globl vector198
vector198:
  pushl $0
  102495:	6a 00                	push   $0x0
  pushl $198
  102497:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10249c:	e9 ac 02 00 00       	jmp    10274d <__alltraps>

001024a1 <vector199>:
.globl vector199
vector199:
  pushl $0
  1024a1:	6a 00                	push   $0x0
  pushl $199
  1024a3:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1024a8:	e9 a0 02 00 00       	jmp    10274d <__alltraps>

001024ad <vector200>:
.globl vector200
vector200:
  pushl $0
  1024ad:	6a 00                	push   $0x0
  pushl $200
  1024af:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024b4:	e9 94 02 00 00       	jmp    10274d <__alltraps>

001024b9 <vector201>:
.globl vector201
vector201:
  pushl $0
  1024b9:	6a 00                	push   $0x0
  pushl $201
  1024bb:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024c0:	e9 88 02 00 00       	jmp    10274d <__alltraps>

001024c5 <vector202>:
.globl vector202
vector202:
  pushl $0
  1024c5:	6a 00                	push   $0x0
  pushl $202
  1024c7:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024cc:	e9 7c 02 00 00       	jmp    10274d <__alltraps>

001024d1 <vector203>:
.globl vector203
vector203:
  pushl $0
  1024d1:	6a 00                	push   $0x0
  pushl $203
  1024d3:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1024d8:	e9 70 02 00 00       	jmp    10274d <__alltraps>

001024dd <vector204>:
.globl vector204
vector204:
  pushl $0
  1024dd:	6a 00                	push   $0x0
  pushl $204
  1024df:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1024e4:	e9 64 02 00 00       	jmp    10274d <__alltraps>

001024e9 <vector205>:
.globl vector205
vector205:
  pushl $0
  1024e9:	6a 00                	push   $0x0
  pushl $205
  1024eb:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1024f0:	e9 58 02 00 00       	jmp    10274d <__alltraps>

001024f5 <vector206>:
.globl vector206
vector206:
  pushl $0
  1024f5:	6a 00                	push   $0x0
  pushl $206
  1024f7:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1024fc:	e9 4c 02 00 00       	jmp    10274d <__alltraps>

00102501 <vector207>:
.globl vector207
vector207:
  pushl $0
  102501:	6a 00                	push   $0x0
  pushl $207
  102503:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102508:	e9 40 02 00 00       	jmp    10274d <__alltraps>

0010250d <vector208>:
.globl vector208
vector208:
  pushl $0
  10250d:	6a 00                	push   $0x0
  pushl $208
  10250f:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102514:	e9 34 02 00 00       	jmp    10274d <__alltraps>

00102519 <vector209>:
.globl vector209
vector209:
  pushl $0
  102519:	6a 00                	push   $0x0
  pushl $209
  10251b:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102520:	e9 28 02 00 00       	jmp    10274d <__alltraps>

00102525 <vector210>:
.globl vector210
vector210:
  pushl $0
  102525:	6a 00                	push   $0x0
  pushl $210
  102527:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10252c:	e9 1c 02 00 00       	jmp    10274d <__alltraps>

00102531 <vector211>:
.globl vector211
vector211:
  pushl $0
  102531:	6a 00                	push   $0x0
  pushl $211
  102533:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102538:	e9 10 02 00 00       	jmp    10274d <__alltraps>

0010253d <vector212>:
.globl vector212
vector212:
  pushl $0
  10253d:	6a 00                	push   $0x0
  pushl $212
  10253f:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102544:	e9 04 02 00 00       	jmp    10274d <__alltraps>

00102549 <vector213>:
.globl vector213
vector213:
  pushl $0
  102549:	6a 00                	push   $0x0
  pushl $213
  10254b:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102550:	e9 f8 01 00 00       	jmp    10274d <__alltraps>

00102555 <vector214>:
.globl vector214
vector214:
  pushl $0
  102555:	6a 00                	push   $0x0
  pushl $214
  102557:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10255c:	e9 ec 01 00 00       	jmp    10274d <__alltraps>

00102561 <vector215>:
.globl vector215
vector215:
  pushl $0
  102561:	6a 00                	push   $0x0
  pushl $215
  102563:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102568:	e9 e0 01 00 00       	jmp    10274d <__alltraps>

0010256d <vector216>:
.globl vector216
vector216:
  pushl $0
  10256d:	6a 00                	push   $0x0
  pushl $216
  10256f:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102574:	e9 d4 01 00 00       	jmp    10274d <__alltraps>

00102579 <vector217>:
.globl vector217
vector217:
  pushl $0
  102579:	6a 00                	push   $0x0
  pushl $217
  10257b:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102580:	e9 c8 01 00 00       	jmp    10274d <__alltraps>

00102585 <vector218>:
.globl vector218
vector218:
  pushl $0
  102585:	6a 00                	push   $0x0
  pushl $218
  102587:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10258c:	e9 bc 01 00 00       	jmp    10274d <__alltraps>

00102591 <vector219>:
.globl vector219
vector219:
  pushl $0
  102591:	6a 00                	push   $0x0
  pushl $219
  102593:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102598:	e9 b0 01 00 00       	jmp    10274d <__alltraps>

0010259d <vector220>:
.globl vector220
vector220:
  pushl $0
  10259d:	6a 00                	push   $0x0
  pushl $220
  10259f:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1025a4:	e9 a4 01 00 00       	jmp    10274d <__alltraps>

001025a9 <vector221>:
.globl vector221
vector221:
  pushl $0
  1025a9:	6a 00                	push   $0x0
  pushl $221
  1025ab:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025b0:	e9 98 01 00 00       	jmp    10274d <__alltraps>

001025b5 <vector222>:
.globl vector222
vector222:
  pushl $0
  1025b5:	6a 00                	push   $0x0
  pushl $222
  1025b7:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025bc:	e9 8c 01 00 00       	jmp    10274d <__alltraps>

001025c1 <vector223>:
.globl vector223
vector223:
  pushl $0
  1025c1:	6a 00                	push   $0x0
  pushl $223
  1025c3:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025c8:	e9 80 01 00 00       	jmp    10274d <__alltraps>

001025cd <vector224>:
.globl vector224
vector224:
  pushl $0
  1025cd:	6a 00                	push   $0x0
  pushl $224
  1025cf:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1025d4:	e9 74 01 00 00       	jmp    10274d <__alltraps>

001025d9 <vector225>:
.globl vector225
vector225:
  pushl $0
  1025d9:	6a 00                	push   $0x0
  pushl $225
  1025db:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1025e0:	e9 68 01 00 00       	jmp    10274d <__alltraps>

001025e5 <vector226>:
.globl vector226
vector226:
  pushl $0
  1025e5:	6a 00                	push   $0x0
  pushl $226
  1025e7:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1025ec:	e9 5c 01 00 00       	jmp    10274d <__alltraps>

001025f1 <vector227>:
.globl vector227
vector227:
  pushl $0
  1025f1:	6a 00                	push   $0x0
  pushl $227
  1025f3:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1025f8:	e9 50 01 00 00       	jmp    10274d <__alltraps>

001025fd <vector228>:
.globl vector228
vector228:
  pushl $0
  1025fd:	6a 00                	push   $0x0
  pushl $228
  1025ff:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102604:	e9 44 01 00 00       	jmp    10274d <__alltraps>

00102609 <vector229>:
.globl vector229
vector229:
  pushl $0
  102609:	6a 00                	push   $0x0
  pushl $229
  10260b:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102610:	e9 38 01 00 00       	jmp    10274d <__alltraps>

00102615 <vector230>:
.globl vector230
vector230:
  pushl $0
  102615:	6a 00                	push   $0x0
  pushl $230
  102617:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10261c:	e9 2c 01 00 00       	jmp    10274d <__alltraps>

00102621 <vector231>:
.globl vector231
vector231:
  pushl $0
  102621:	6a 00                	push   $0x0
  pushl $231
  102623:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102628:	e9 20 01 00 00       	jmp    10274d <__alltraps>

0010262d <vector232>:
.globl vector232
vector232:
  pushl $0
  10262d:	6a 00                	push   $0x0
  pushl $232
  10262f:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102634:	e9 14 01 00 00       	jmp    10274d <__alltraps>

00102639 <vector233>:
.globl vector233
vector233:
  pushl $0
  102639:	6a 00                	push   $0x0
  pushl $233
  10263b:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102640:	e9 08 01 00 00       	jmp    10274d <__alltraps>

00102645 <vector234>:
.globl vector234
vector234:
  pushl $0
  102645:	6a 00                	push   $0x0
  pushl $234
  102647:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10264c:	e9 fc 00 00 00       	jmp    10274d <__alltraps>

00102651 <vector235>:
.globl vector235
vector235:
  pushl $0
  102651:	6a 00                	push   $0x0
  pushl $235
  102653:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102658:	e9 f0 00 00 00       	jmp    10274d <__alltraps>

0010265d <vector236>:
.globl vector236
vector236:
  pushl $0
  10265d:	6a 00                	push   $0x0
  pushl $236
  10265f:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102664:	e9 e4 00 00 00       	jmp    10274d <__alltraps>

00102669 <vector237>:
.globl vector237
vector237:
  pushl $0
  102669:	6a 00                	push   $0x0
  pushl $237
  10266b:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102670:	e9 d8 00 00 00       	jmp    10274d <__alltraps>

00102675 <vector238>:
.globl vector238
vector238:
  pushl $0
  102675:	6a 00                	push   $0x0
  pushl $238
  102677:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10267c:	e9 cc 00 00 00       	jmp    10274d <__alltraps>

00102681 <vector239>:
.globl vector239
vector239:
  pushl $0
  102681:	6a 00                	push   $0x0
  pushl $239
  102683:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102688:	e9 c0 00 00 00       	jmp    10274d <__alltraps>

0010268d <vector240>:
.globl vector240
vector240:
  pushl $0
  10268d:	6a 00                	push   $0x0
  pushl $240
  10268f:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102694:	e9 b4 00 00 00       	jmp    10274d <__alltraps>

00102699 <vector241>:
.globl vector241
vector241:
  pushl $0
  102699:	6a 00                	push   $0x0
  pushl $241
  10269b:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1026a0:	e9 a8 00 00 00       	jmp    10274d <__alltraps>

001026a5 <vector242>:
.globl vector242
vector242:
  pushl $0
  1026a5:	6a 00                	push   $0x0
  pushl $242
  1026a7:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026ac:	e9 9c 00 00 00       	jmp    10274d <__alltraps>

001026b1 <vector243>:
.globl vector243
vector243:
  pushl $0
  1026b1:	6a 00                	push   $0x0
  pushl $243
  1026b3:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026b8:	e9 90 00 00 00       	jmp    10274d <__alltraps>

001026bd <vector244>:
.globl vector244
vector244:
  pushl $0
  1026bd:	6a 00                	push   $0x0
  pushl $244
  1026bf:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026c4:	e9 84 00 00 00       	jmp    10274d <__alltraps>

001026c9 <vector245>:
.globl vector245
vector245:
  pushl $0
  1026c9:	6a 00                	push   $0x0
  pushl $245
  1026cb:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1026d0:	e9 78 00 00 00       	jmp    10274d <__alltraps>

001026d5 <vector246>:
.globl vector246
vector246:
  pushl $0
  1026d5:	6a 00                	push   $0x0
  pushl $246
  1026d7:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1026dc:	e9 6c 00 00 00       	jmp    10274d <__alltraps>

001026e1 <vector247>:
.globl vector247
vector247:
  pushl $0
  1026e1:	6a 00                	push   $0x0
  pushl $247
  1026e3:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1026e8:	e9 60 00 00 00       	jmp    10274d <__alltraps>

001026ed <vector248>:
.globl vector248
vector248:
  pushl $0
  1026ed:	6a 00                	push   $0x0
  pushl $248
  1026ef:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1026f4:	e9 54 00 00 00       	jmp    10274d <__alltraps>

001026f9 <vector249>:
.globl vector249
vector249:
  pushl $0
  1026f9:	6a 00                	push   $0x0
  pushl $249
  1026fb:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102700:	e9 48 00 00 00       	jmp    10274d <__alltraps>

00102705 <vector250>:
.globl vector250
vector250:
  pushl $0
  102705:	6a 00                	push   $0x0
  pushl $250
  102707:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10270c:	e9 3c 00 00 00       	jmp    10274d <__alltraps>

00102711 <vector251>:
.globl vector251
vector251:
  pushl $0
  102711:	6a 00                	push   $0x0
  pushl $251
  102713:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102718:	e9 30 00 00 00       	jmp    10274d <__alltraps>

0010271d <vector252>:
.globl vector252
vector252:
  pushl $0
  10271d:	6a 00                	push   $0x0
  pushl $252
  10271f:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102724:	e9 24 00 00 00       	jmp    10274d <__alltraps>

00102729 <vector253>:
.globl vector253
vector253:
  pushl $0
  102729:	6a 00                	push   $0x0
  pushl $253
  10272b:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102730:	e9 18 00 00 00       	jmp    10274d <__alltraps>

00102735 <vector254>:
.globl vector254
vector254:
  pushl $0
  102735:	6a 00                	push   $0x0
  pushl $254
  102737:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10273c:	e9 0c 00 00 00       	jmp    10274d <__alltraps>

00102741 <vector255>:
.globl vector255
vector255:
  pushl $0
  102741:	6a 00                	push   $0x0
  pushl $255
  102743:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102748:	e9 00 00 00 00       	jmp    10274d <__alltraps>

0010274d <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10274d:	1e                   	push   %ds
    pushl %es
  10274e:	06                   	push   %es
    pushl %fs
  10274f:	0f a0                	push   %fs
    pushl %gs
  102751:	0f a8                	push   %gs
    pushal
  102753:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102754:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102759:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10275b:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10275d:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10275e:	e8 60 f5 ff ff       	call   101cc3 <trap>

    # pop the pushed stack pointer
    popl %esp
  102763:	5c                   	pop    %esp

00102764 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102764:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102765:	0f a9                	pop    %gs
    popl %fs
  102767:	0f a1                	pop    %fs
    popl %es
  102769:	07                   	pop    %es
    popl %ds
  10276a:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10276b:	83 c4 08             	add    $0x8,%esp
    iret
  10276e:	cf                   	iret   

0010276f <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10276f:	55                   	push   %ebp
  102770:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102772:	8b 45 08             	mov    0x8(%ebp),%eax
  102775:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102778:	b8 23 00 00 00       	mov    $0x23,%eax
  10277d:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10277f:	b8 23 00 00 00       	mov    $0x23,%eax
  102784:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102786:	b8 10 00 00 00       	mov    $0x10,%eax
  10278b:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10278d:	b8 10 00 00 00       	mov    $0x10,%eax
  102792:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102794:	b8 10 00 00 00       	mov    $0x10,%eax
  102799:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10279b:	ea a2 27 10 00 08 00 	ljmp   $0x8,$0x1027a2
}
  1027a2:	90                   	nop
  1027a3:	5d                   	pop    %ebp
  1027a4:	c3                   	ret    

001027a5 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027a5:	f3 0f 1e fb          	endbr32 
  1027a9:	55                   	push   %ebp
  1027aa:	89 e5                	mov    %esp,%ebp
  1027ac:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027af:	b8 20 09 11 00       	mov    $0x110920,%eax
  1027b4:	05 00 04 00 00       	add    $0x400,%eax
  1027b9:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  1027be:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  1027c5:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027c7:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1027ce:	68 00 
  1027d0:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1027d5:	0f b7 c0             	movzwl %ax,%eax
  1027d8:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1027de:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1027e3:	c1 e8 10             	shr    $0x10,%eax
  1027e6:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1027eb:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1027f2:	24 f0                	and    $0xf0,%al
  1027f4:	0c 09                	or     $0x9,%al
  1027f6:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1027fb:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102802:	0c 10                	or     $0x10,%al
  102804:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102809:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102810:	24 9f                	and    $0x9f,%al
  102812:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102817:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10281e:	0c 80                	or     $0x80,%al
  102820:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102825:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10282c:	24 f0                	and    $0xf0,%al
  10282e:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102833:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10283a:	24 ef                	and    $0xef,%al
  10283c:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102841:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102848:	24 df                	and    $0xdf,%al
  10284a:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10284f:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102856:	0c 40                	or     $0x40,%al
  102858:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10285d:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102864:	24 7f                	and    $0x7f,%al
  102866:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10286b:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102870:	c1 e8 18             	shr    $0x18,%eax
  102873:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102878:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10287f:	24 ef                	and    $0xef,%al
  102881:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102886:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  10288d:	e8 dd fe ff ff       	call   10276f <lgdt>
  102892:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102898:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10289c:	0f 00 d8             	ltr    %ax
}
  10289f:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  1028a0:	90                   	nop
  1028a1:	c9                   	leave  
  1028a2:	c3                   	ret    

001028a3 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028a3:	f3 0f 1e fb          	endbr32 
  1028a7:	55                   	push   %ebp
  1028a8:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028aa:	e8 f6 fe ff ff       	call   1027a5 <gdt_init>
}
  1028af:	90                   	nop
  1028b0:	5d                   	pop    %ebp
  1028b1:	c3                   	ret    

001028b2 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1028b2:	f3 0f 1e fb          	endbr32 
  1028b6:	55                   	push   %ebp
  1028b7:	89 e5                	mov    %esp,%ebp
  1028b9:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1028c3:	eb 03                	jmp    1028c8 <strlen+0x16>
        cnt ++;
  1028c5:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1028c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028cb:	8d 50 01             	lea    0x1(%eax),%edx
  1028ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1028d1:	0f b6 00             	movzbl (%eax),%eax
  1028d4:	84 c0                	test   %al,%al
  1028d6:	75 ed                	jne    1028c5 <strlen+0x13>
    }
    return cnt;
  1028d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028db:	c9                   	leave  
  1028dc:	c3                   	ret    

001028dd <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1028dd:	f3 0f 1e fb          	endbr32 
  1028e1:	55                   	push   %ebp
  1028e2:	89 e5                	mov    %esp,%ebp
  1028e4:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028e7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028ee:	eb 03                	jmp    1028f3 <strnlen+0x16>
        cnt ++;
  1028f0:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028f6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1028f9:	73 10                	jae    10290b <strnlen+0x2e>
  1028fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1028fe:	8d 50 01             	lea    0x1(%eax),%edx
  102901:	89 55 08             	mov    %edx,0x8(%ebp)
  102904:	0f b6 00             	movzbl (%eax),%eax
  102907:	84 c0                	test   %al,%al
  102909:	75 e5                	jne    1028f0 <strnlen+0x13>
    }
    return cnt;
  10290b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10290e:	c9                   	leave  
  10290f:	c3                   	ret    

00102910 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102910:	f3 0f 1e fb          	endbr32 
  102914:	55                   	push   %ebp
  102915:	89 e5                	mov    %esp,%ebp
  102917:	57                   	push   %edi
  102918:	56                   	push   %esi
  102919:	83 ec 20             	sub    $0x20,%esp
  10291c:	8b 45 08             	mov    0x8(%ebp),%eax
  10291f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102922:	8b 45 0c             	mov    0xc(%ebp),%eax
  102925:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102928:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10292b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10292e:	89 d1                	mov    %edx,%ecx
  102930:	89 c2                	mov    %eax,%edx
  102932:	89 ce                	mov    %ecx,%esi
  102934:	89 d7                	mov    %edx,%edi
  102936:	ac                   	lods   %ds:(%esi),%al
  102937:	aa                   	stos   %al,%es:(%edi)
  102938:	84 c0                	test   %al,%al
  10293a:	75 fa                	jne    102936 <strcpy+0x26>
  10293c:	89 fa                	mov    %edi,%edx
  10293e:	89 f1                	mov    %esi,%ecx
  102940:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102943:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102946:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102949:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10294c:	83 c4 20             	add    $0x20,%esp
  10294f:	5e                   	pop    %esi
  102950:	5f                   	pop    %edi
  102951:	5d                   	pop    %ebp
  102952:	c3                   	ret    

00102953 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102953:	f3 0f 1e fb          	endbr32 
  102957:	55                   	push   %ebp
  102958:	89 e5                	mov    %esp,%ebp
  10295a:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10295d:	8b 45 08             	mov    0x8(%ebp),%eax
  102960:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102963:	eb 1e                	jmp    102983 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102965:	8b 45 0c             	mov    0xc(%ebp),%eax
  102968:	0f b6 10             	movzbl (%eax),%edx
  10296b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10296e:	88 10                	mov    %dl,(%eax)
  102970:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102973:	0f b6 00             	movzbl (%eax),%eax
  102976:	84 c0                	test   %al,%al
  102978:	74 03                	je     10297d <strncpy+0x2a>
            src ++;
  10297a:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  10297d:	ff 45 fc             	incl   -0x4(%ebp)
  102980:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102983:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102987:	75 dc                	jne    102965 <strncpy+0x12>
    }
    return dst;
  102989:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10298c:	c9                   	leave  
  10298d:	c3                   	ret    

0010298e <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10298e:	f3 0f 1e fb          	endbr32 
  102992:	55                   	push   %ebp
  102993:	89 e5                	mov    %esp,%ebp
  102995:	57                   	push   %edi
  102996:	56                   	push   %esi
  102997:	83 ec 20             	sub    $0x20,%esp
  10299a:	8b 45 08             	mov    0x8(%ebp),%eax
  10299d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1029a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029ac:	89 d1                	mov    %edx,%ecx
  1029ae:	89 c2                	mov    %eax,%edx
  1029b0:	89 ce                	mov    %ecx,%esi
  1029b2:	89 d7                	mov    %edx,%edi
  1029b4:	ac                   	lods   %ds:(%esi),%al
  1029b5:	ae                   	scas   %es:(%edi),%al
  1029b6:	75 08                	jne    1029c0 <strcmp+0x32>
  1029b8:	84 c0                	test   %al,%al
  1029ba:	75 f8                	jne    1029b4 <strcmp+0x26>
  1029bc:	31 c0                	xor    %eax,%eax
  1029be:	eb 04                	jmp    1029c4 <strcmp+0x36>
  1029c0:	19 c0                	sbb    %eax,%eax
  1029c2:	0c 01                	or     $0x1,%al
  1029c4:	89 fa                	mov    %edi,%edx
  1029c6:	89 f1                	mov    %esi,%ecx
  1029c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1029cb:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1029ce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1029d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1029d4:	83 c4 20             	add    $0x20,%esp
  1029d7:	5e                   	pop    %esi
  1029d8:	5f                   	pop    %edi
  1029d9:	5d                   	pop    %ebp
  1029da:	c3                   	ret    

001029db <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1029db:	f3 0f 1e fb          	endbr32 
  1029df:	55                   	push   %ebp
  1029e0:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029e2:	eb 09                	jmp    1029ed <strncmp+0x12>
        n --, s1 ++, s2 ++;
  1029e4:	ff 4d 10             	decl   0x10(%ebp)
  1029e7:	ff 45 08             	incl   0x8(%ebp)
  1029ea:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029ed:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f1:	74 1a                	je     102a0d <strncmp+0x32>
  1029f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f6:	0f b6 00             	movzbl (%eax),%eax
  1029f9:	84 c0                	test   %al,%al
  1029fb:	74 10                	je     102a0d <strncmp+0x32>
  1029fd:	8b 45 08             	mov    0x8(%ebp),%eax
  102a00:	0f b6 10             	movzbl (%eax),%edx
  102a03:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a06:	0f b6 00             	movzbl (%eax),%eax
  102a09:	38 c2                	cmp    %al,%dl
  102a0b:	74 d7                	je     1029e4 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102a0d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a11:	74 18                	je     102a2b <strncmp+0x50>
  102a13:	8b 45 08             	mov    0x8(%ebp),%eax
  102a16:	0f b6 00             	movzbl (%eax),%eax
  102a19:	0f b6 d0             	movzbl %al,%edx
  102a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a1f:	0f b6 00             	movzbl (%eax),%eax
  102a22:	0f b6 c0             	movzbl %al,%eax
  102a25:	29 c2                	sub    %eax,%edx
  102a27:	89 d0                	mov    %edx,%eax
  102a29:	eb 05                	jmp    102a30 <strncmp+0x55>
  102a2b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a30:	5d                   	pop    %ebp
  102a31:	c3                   	ret    

00102a32 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102a32:	f3 0f 1e fb          	endbr32 
  102a36:	55                   	push   %ebp
  102a37:	89 e5                	mov    %esp,%ebp
  102a39:	83 ec 04             	sub    $0x4,%esp
  102a3c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a3f:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a42:	eb 13                	jmp    102a57 <strchr+0x25>
        if (*s == c) {
  102a44:	8b 45 08             	mov    0x8(%ebp),%eax
  102a47:	0f b6 00             	movzbl (%eax),%eax
  102a4a:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a4d:	75 05                	jne    102a54 <strchr+0x22>
            return (char *)s;
  102a4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a52:	eb 12                	jmp    102a66 <strchr+0x34>
        }
        s ++;
  102a54:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102a57:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5a:	0f b6 00             	movzbl (%eax),%eax
  102a5d:	84 c0                	test   %al,%al
  102a5f:	75 e3                	jne    102a44 <strchr+0x12>
    }
    return NULL;
  102a61:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a66:	c9                   	leave  
  102a67:	c3                   	ret    

00102a68 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102a68:	f3 0f 1e fb          	endbr32 
  102a6c:	55                   	push   %ebp
  102a6d:	89 e5                	mov    %esp,%ebp
  102a6f:	83 ec 04             	sub    $0x4,%esp
  102a72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a75:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a78:	eb 0e                	jmp    102a88 <strfind+0x20>
        if (*s == c) {
  102a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7d:	0f b6 00             	movzbl (%eax),%eax
  102a80:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a83:	74 0f                	je     102a94 <strfind+0x2c>
            break;
        }
        s ++;
  102a85:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102a88:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8b:	0f b6 00             	movzbl (%eax),%eax
  102a8e:	84 c0                	test   %al,%al
  102a90:	75 e8                	jne    102a7a <strfind+0x12>
  102a92:	eb 01                	jmp    102a95 <strfind+0x2d>
            break;
  102a94:	90                   	nop
    }
    return (char *)s;
  102a95:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a98:	c9                   	leave  
  102a99:	c3                   	ret    

00102a9a <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102a9a:	f3 0f 1e fb          	endbr32 
  102a9e:	55                   	push   %ebp
  102a9f:	89 e5                	mov    %esp,%ebp
  102aa1:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102aa4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102aab:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102ab2:	eb 03                	jmp    102ab7 <strtol+0x1d>
        s ++;
  102ab4:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aba:	0f b6 00             	movzbl (%eax),%eax
  102abd:	3c 20                	cmp    $0x20,%al
  102abf:	74 f3                	je     102ab4 <strtol+0x1a>
  102ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac4:	0f b6 00             	movzbl (%eax),%eax
  102ac7:	3c 09                	cmp    $0x9,%al
  102ac9:	74 e9                	je     102ab4 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102acb:	8b 45 08             	mov    0x8(%ebp),%eax
  102ace:	0f b6 00             	movzbl (%eax),%eax
  102ad1:	3c 2b                	cmp    $0x2b,%al
  102ad3:	75 05                	jne    102ada <strtol+0x40>
        s ++;
  102ad5:	ff 45 08             	incl   0x8(%ebp)
  102ad8:	eb 14                	jmp    102aee <strtol+0x54>
    }
    else if (*s == '-') {
  102ada:	8b 45 08             	mov    0x8(%ebp),%eax
  102add:	0f b6 00             	movzbl (%eax),%eax
  102ae0:	3c 2d                	cmp    $0x2d,%al
  102ae2:	75 0a                	jne    102aee <strtol+0x54>
        s ++, neg = 1;
  102ae4:	ff 45 08             	incl   0x8(%ebp)
  102ae7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102aee:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102af2:	74 06                	je     102afa <strtol+0x60>
  102af4:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102af8:	75 22                	jne    102b1c <strtol+0x82>
  102afa:	8b 45 08             	mov    0x8(%ebp),%eax
  102afd:	0f b6 00             	movzbl (%eax),%eax
  102b00:	3c 30                	cmp    $0x30,%al
  102b02:	75 18                	jne    102b1c <strtol+0x82>
  102b04:	8b 45 08             	mov    0x8(%ebp),%eax
  102b07:	40                   	inc    %eax
  102b08:	0f b6 00             	movzbl (%eax),%eax
  102b0b:	3c 78                	cmp    $0x78,%al
  102b0d:	75 0d                	jne    102b1c <strtol+0x82>
        s += 2, base = 16;
  102b0f:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102b13:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102b1a:	eb 29                	jmp    102b45 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102b1c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b20:	75 16                	jne    102b38 <strtol+0x9e>
  102b22:	8b 45 08             	mov    0x8(%ebp),%eax
  102b25:	0f b6 00             	movzbl (%eax),%eax
  102b28:	3c 30                	cmp    $0x30,%al
  102b2a:	75 0c                	jne    102b38 <strtol+0x9e>
        s ++, base = 8;
  102b2c:	ff 45 08             	incl   0x8(%ebp)
  102b2f:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102b36:	eb 0d                	jmp    102b45 <strtol+0xab>
    }
    else if (base == 0) {
  102b38:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b3c:	75 07                	jne    102b45 <strtol+0xab>
        base = 10;
  102b3e:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102b45:	8b 45 08             	mov    0x8(%ebp),%eax
  102b48:	0f b6 00             	movzbl (%eax),%eax
  102b4b:	3c 2f                	cmp    $0x2f,%al
  102b4d:	7e 1b                	jle    102b6a <strtol+0xd0>
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b52:	0f b6 00             	movzbl (%eax),%eax
  102b55:	3c 39                	cmp    $0x39,%al
  102b57:	7f 11                	jg     102b6a <strtol+0xd0>
            dig = *s - '0';
  102b59:	8b 45 08             	mov    0x8(%ebp),%eax
  102b5c:	0f b6 00             	movzbl (%eax),%eax
  102b5f:	0f be c0             	movsbl %al,%eax
  102b62:	83 e8 30             	sub    $0x30,%eax
  102b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b68:	eb 48                	jmp    102bb2 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102b6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6d:	0f b6 00             	movzbl (%eax),%eax
  102b70:	3c 60                	cmp    $0x60,%al
  102b72:	7e 1b                	jle    102b8f <strtol+0xf5>
  102b74:	8b 45 08             	mov    0x8(%ebp),%eax
  102b77:	0f b6 00             	movzbl (%eax),%eax
  102b7a:	3c 7a                	cmp    $0x7a,%al
  102b7c:	7f 11                	jg     102b8f <strtol+0xf5>
            dig = *s - 'a' + 10;
  102b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b81:	0f b6 00             	movzbl (%eax),%eax
  102b84:	0f be c0             	movsbl %al,%eax
  102b87:	83 e8 57             	sub    $0x57,%eax
  102b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b8d:	eb 23                	jmp    102bb2 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102b8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b92:	0f b6 00             	movzbl (%eax),%eax
  102b95:	3c 40                	cmp    $0x40,%al
  102b97:	7e 3b                	jle    102bd4 <strtol+0x13a>
  102b99:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9c:	0f b6 00             	movzbl (%eax),%eax
  102b9f:	3c 5a                	cmp    $0x5a,%al
  102ba1:	7f 31                	jg     102bd4 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba6:	0f b6 00             	movzbl (%eax),%eax
  102ba9:	0f be c0             	movsbl %al,%eax
  102bac:	83 e8 37             	sub    $0x37,%eax
  102baf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb5:	3b 45 10             	cmp    0x10(%ebp),%eax
  102bb8:	7d 19                	jge    102bd3 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102bba:	ff 45 08             	incl   0x8(%ebp)
  102bbd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bc0:	0f af 45 10          	imul   0x10(%ebp),%eax
  102bc4:	89 c2                	mov    %eax,%edx
  102bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bc9:	01 d0                	add    %edx,%eax
  102bcb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102bce:	e9 72 ff ff ff       	jmp    102b45 <strtol+0xab>
            break;
  102bd3:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102bd4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bd8:	74 08                	je     102be2 <strtol+0x148>
        *endptr = (char *) s;
  102bda:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bdd:	8b 55 08             	mov    0x8(%ebp),%edx
  102be0:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102be2:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102be6:	74 07                	je     102bef <strtol+0x155>
  102be8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102beb:	f7 d8                	neg    %eax
  102bed:	eb 03                	jmp    102bf2 <strtol+0x158>
  102bef:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102bf2:	c9                   	leave  
  102bf3:	c3                   	ret    

00102bf4 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102bf4:	f3 0f 1e fb          	endbr32 
  102bf8:	55                   	push   %ebp
  102bf9:	89 e5                	mov    %esp,%ebp
  102bfb:	57                   	push   %edi
  102bfc:	83 ec 24             	sub    $0x24,%esp
  102bff:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c02:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102c05:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102c09:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102c0f:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102c12:	8b 45 10             	mov    0x10(%ebp),%eax
  102c15:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102c18:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102c1b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102c1f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102c22:	89 d7                	mov    %edx,%edi
  102c24:	f3 aa                	rep stos %al,%es:(%edi)
  102c26:	89 fa                	mov    %edi,%edx
  102c28:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c2b:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102c2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102c31:	83 c4 24             	add    $0x24,%esp
  102c34:	5f                   	pop    %edi
  102c35:	5d                   	pop    %ebp
  102c36:	c3                   	ret    

00102c37 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102c37:	f3 0f 1e fb          	endbr32 
  102c3b:	55                   	push   %ebp
  102c3c:	89 e5                	mov    %esp,%ebp
  102c3e:	57                   	push   %edi
  102c3f:	56                   	push   %esi
  102c40:	53                   	push   %ebx
  102c41:	83 ec 30             	sub    $0x30,%esp
  102c44:	8b 45 08             	mov    0x8(%ebp),%eax
  102c47:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c50:	8b 45 10             	mov    0x10(%ebp),%eax
  102c53:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c59:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102c5c:	73 42                	jae    102ca0 <memmove+0x69>
  102c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c64:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c67:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102c70:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c73:	c1 e8 02             	shr    $0x2,%eax
  102c76:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102c78:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102c7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c7e:	89 d7                	mov    %edx,%edi
  102c80:	89 c6                	mov    %eax,%esi
  102c82:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102c84:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102c87:	83 e1 03             	and    $0x3,%ecx
  102c8a:	74 02                	je     102c8e <memmove+0x57>
  102c8c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c8e:	89 f0                	mov    %esi,%eax
  102c90:	89 fa                	mov    %edi,%edx
  102c92:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102c95:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102c98:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102c9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102c9e:	eb 36                	jmp    102cd6 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102ca0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ca3:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ca6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ca9:	01 c2                	add    %eax,%edx
  102cab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cae:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102cb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cb4:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102cb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cba:	89 c1                	mov    %eax,%ecx
  102cbc:	89 d8                	mov    %ebx,%eax
  102cbe:	89 d6                	mov    %edx,%esi
  102cc0:	89 c7                	mov    %eax,%edi
  102cc2:	fd                   	std    
  102cc3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102cc5:	fc                   	cld    
  102cc6:	89 f8                	mov    %edi,%eax
  102cc8:	89 f2                	mov    %esi,%edx
  102cca:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ccd:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102cd0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102cd6:	83 c4 30             	add    $0x30,%esp
  102cd9:	5b                   	pop    %ebx
  102cda:	5e                   	pop    %esi
  102cdb:	5f                   	pop    %edi
  102cdc:	5d                   	pop    %ebp
  102cdd:	c3                   	ret    

00102cde <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102cde:	f3 0f 1e fb          	endbr32 
  102ce2:	55                   	push   %ebp
  102ce3:	89 e5                	mov    %esp,%ebp
  102ce5:	57                   	push   %edi
  102ce6:	56                   	push   %esi
  102ce7:	83 ec 20             	sub    $0x20,%esp
  102cea:	8b 45 08             	mov    0x8(%ebp),%eax
  102ced:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cf6:	8b 45 10             	mov    0x10(%ebp),%eax
  102cf9:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102cfc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cff:	c1 e8 02             	shr    $0x2,%eax
  102d02:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102d04:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0a:	89 d7                	mov    %edx,%edi
  102d0c:	89 c6                	mov    %eax,%esi
  102d0e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102d10:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102d13:	83 e1 03             	and    $0x3,%ecx
  102d16:	74 02                	je     102d1a <memcpy+0x3c>
  102d18:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d1a:	89 f0                	mov    %esi,%eax
  102d1c:	89 fa                	mov    %edi,%edx
  102d1e:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d21:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102d24:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102d2a:	83 c4 20             	add    $0x20,%esp
  102d2d:	5e                   	pop    %esi
  102d2e:	5f                   	pop    %edi
  102d2f:	5d                   	pop    %ebp
  102d30:	c3                   	ret    

00102d31 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102d31:	f3 0f 1e fb          	endbr32 
  102d35:	55                   	push   %ebp
  102d36:	89 e5                	mov    %esp,%ebp
  102d38:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102d41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d44:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102d47:	eb 2e                	jmp    102d77 <memcmp+0x46>
        if (*s1 != *s2) {
  102d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d4c:	0f b6 10             	movzbl (%eax),%edx
  102d4f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d52:	0f b6 00             	movzbl (%eax),%eax
  102d55:	38 c2                	cmp    %al,%dl
  102d57:	74 18                	je     102d71 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d59:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d5c:	0f b6 00             	movzbl (%eax),%eax
  102d5f:	0f b6 d0             	movzbl %al,%edx
  102d62:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	0f b6 c0             	movzbl %al,%eax
  102d6b:	29 c2                	sub    %eax,%edx
  102d6d:	89 d0                	mov    %edx,%eax
  102d6f:	eb 18                	jmp    102d89 <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102d71:	ff 45 fc             	incl   -0x4(%ebp)
  102d74:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102d77:	8b 45 10             	mov    0x10(%ebp),%eax
  102d7a:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d7d:	89 55 10             	mov    %edx,0x10(%ebp)
  102d80:	85 c0                	test   %eax,%eax
  102d82:	75 c5                	jne    102d49 <memcmp+0x18>
    }
    return 0;
  102d84:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d89:	c9                   	leave  
  102d8a:	c3                   	ret    

00102d8b <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102d8b:	f3 0f 1e fb          	endbr32 
  102d8f:	55                   	push   %ebp
  102d90:	89 e5                	mov    %esp,%ebp
  102d92:	83 ec 58             	sub    $0x58,%esp
  102d95:	8b 45 10             	mov    0x10(%ebp),%eax
  102d98:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102d9b:	8b 45 14             	mov    0x14(%ebp),%eax
  102d9e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102da1:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102da4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102da7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102daa:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102dad:	8b 45 18             	mov    0x18(%ebp),%eax
  102db0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102db3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102db6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102db9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dbc:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102dbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dc5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102dc9:	74 1c                	je     102de7 <printnum+0x5c>
  102dcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dce:	ba 00 00 00 00       	mov    $0x0,%edx
  102dd3:	f7 75 e4             	divl   -0x1c(%ebp)
  102dd6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102dd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ddc:	ba 00 00 00 00       	mov    $0x0,%edx
  102de1:	f7 75 e4             	divl   -0x1c(%ebp)
  102de4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ded:	f7 75 e4             	divl   -0x1c(%ebp)
  102df0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102df3:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102df6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102df9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102dfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102dff:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102e02:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e05:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102e08:	8b 45 18             	mov    0x18(%ebp),%eax
  102e0b:	ba 00 00 00 00       	mov    $0x0,%edx
  102e10:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102e13:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102e16:	19 d1                	sbb    %edx,%ecx
  102e18:	72 4c                	jb     102e66 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102e1a:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102e1d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e20:	8b 45 20             	mov    0x20(%ebp),%eax
  102e23:	89 44 24 18          	mov    %eax,0x18(%esp)
  102e27:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e2b:	8b 45 18             	mov    0x18(%ebp),%eax
  102e2e:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e32:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e35:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102e38:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e3c:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e40:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e43:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e47:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4a:	89 04 24             	mov    %eax,(%esp)
  102e4d:	e8 39 ff ff ff       	call   102d8b <printnum>
  102e52:	eb 1b                	jmp    102e6f <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102e54:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e57:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e5b:	8b 45 20             	mov    0x20(%ebp),%eax
  102e5e:	89 04 24             	mov    %eax,(%esp)
  102e61:	8b 45 08             	mov    0x8(%ebp),%eax
  102e64:	ff d0                	call   *%eax
        while (-- width > 0)
  102e66:	ff 4d 1c             	decl   0x1c(%ebp)
  102e69:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e6d:	7f e5                	jg     102e54 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102e6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102e72:	05 b0 3b 10 00       	add    $0x103bb0,%eax
  102e77:	0f b6 00             	movzbl (%eax),%eax
  102e7a:	0f be c0             	movsbl %al,%eax
  102e7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e80:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e84:	89 04 24             	mov    %eax,(%esp)
  102e87:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8a:	ff d0                	call   *%eax
}
  102e8c:	90                   	nop
  102e8d:	c9                   	leave  
  102e8e:	c3                   	ret    

00102e8f <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102e8f:	f3 0f 1e fb          	endbr32 
  102e93:	55                   	push   %ebp
  102e94:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e96:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e9a:	7e 14                	jle    102eb0 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  102e9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9f:	8b 00                	mov    (%eax),%eax
  102ea1:	8d 48 08             	lea    0x8(%eax),%ecx
  102ea4:	8b 55 08             	mov    0x8(%ebp),%edx
  102ea7:	89 0a                	mov    %ecx,(%edx)
  102ea9:	8b 50 04             	mov    0x4(%eax),%edx
  102eac:	8b 00                	mov    (%eax),%eax
  102eae:	eb 30                	jmp    102ee0 <getuint+0x51>
    }
    else if (lflag) {
  102eb0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102eb4:	74 16                	je     102ecc <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  102eb6:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb9:	8b 00                	mov    (%eax),%eax
  102ebb:	8d 48 04             	lea    0x4(%eax),%ecx
  102ebe:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec1:	89 0a                	mov    %ecx,(%edx)
  102ec3:	8b 00                	mov    (%eax),%eax
  102ec5:	ba 00 00 00 00       	mov    $0x0,%edx
  102eca:	eb 14                	jmp    102ee0 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  102ecc:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecf:	8b 00                	mov    (%eax),%eax
  102ed1:	8d 48 04             	lea    0x4(%eax),%ecx
  102ed4:	8b 55 08             	mov    0x8(%ebp),%edx
  102ed7:	89 0a                	mov    %ecx,(%edx)
  102ed9:	8b 00                	mov    (%eax),%eax
  102edb:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102ee0:	5d                   	pop    %ebp
  102ee1:	c3                   	ret    

00102ee2 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102ee2:	f3 0f 1e fb          	endbr32 
  102ee6:	55                   	push   %ebp
  102ee7:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102ee9:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102eed:	7e 14                	jle    102f03 <getint+0x21>
        return va_arg(*ap, long long);
  102eef:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef2:	8b 00                	mov    (%eax),%eax
  102ef4:	8d 48 08             	lea    0x8(%eax),%ecx
  102ef7:	8b 55 08             	mov    0x8(%ebp),%edx
  102efa:	89 0a                	mov    %ecx,(%edx)
  102efc:	8b 50 04             	mov    0x4(%eax),%edx
  102eff:	8b 00                	mov    (%eax),%eax
  102f01:	eb 28                	jmp    102f2b <getint+0x49>
    }
    else if (lflag) {
  102f03:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f07:	74 12                	je     102f1b <getint+0x39>
        return va_arg(*ap, long);
  102f09:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0c:	8b 00                	mov    (%eax),%eax
  102f0e:	8d 48 04             	lea    0x4(%eax),%ecx
  102f11:	8b 55 08             	mov    0x8(%ebp),%edx
  102f14:	89 0a                	mov    %ecx,(%edx)
  102f16:	8b 00                	mov    (%eax),%eax
  102f18:	99                   	cltd   
  102f19:	eb 10                	jmp    102f2b <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  102f1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1e:	8b 00                	mov    (%eax),%eax
  102f20:	8d 48 04             	lea    0x4(%eax),%ecx
  102f23:	8b 55 08             	mov    0x8(%ebp),%edx
  102f26:	89 0a                	mov    %ecx,(%edx)
  102f28:	8b 00                	mov    (%eax),%eax
  102f2a:	99                   	cltd   
    }
}
  102f2b:	5d                   	pop    %ebp
  102f2c:	c3                   	ret    

00102f2d <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102f2d:	f3 0f 1e fb          	endbr32 
  102f31:	55                   	push   %ebp
  102f32:	89 e5                	mov    %esp,%ebp
  102f34:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102f37:	8d 45 14             	lea    0x14(%ebp),%eax
  102f3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102f3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f40:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f44:	8b 45 10             	mov    0x10(%ebp),%eax
  102f47:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f52:	8b 45 08             	mov    0x8(%ebp),%eax
  102f55:	89 04 24             	mov    %eax,(%esp)
  102f58:	e8 03 00 00 00       	call   102f60 <vprintfmt>
    va_end(ap);
}
  102f5d:	90                   	nop
  102f5e:	c9                   	leave  
  102f5f:	c3                   	ret    

00102f60 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102f60:	f3 0f 1e fb          	endbr32 
  102f64:	55                   	push   %ebp
  102f65:	89 e5                	mov    %esp,%ebp
  102f67:	56                   	push   %esi
  102f68:	53                   	push   %ebx
  102f69:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f6c:	eb 17                	jmp    102f85 <vprintfmt+0x25>
            if (ch == '\0') {
  102f6e:	85 db                	test   %ebx,%ebx
  102f70:	0f 84 c0 03 00 00    	je     103336 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  102f76:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f79:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f7d:	89 1c 24             	mov    %ebx,(%esp)
  102f80:	8b 45 08             	mov    0x8(%ebp),%eax
  102f83:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f85:	8b 45 10             	mov    0x10(%ebp),%eax
  102f88:	8d 50 01             	lea    0x1(%eax),%edx
  102f8b:	89 55 10             	mov    %edx,0x10(%ebp)
  102f8e:	0f b6 00             	movzbl (%eax),%eax
  102f91:	0f b6 d8             	movzbl %al,%ebx
  102f94:	83 fb 25             	cmp    $0x25,%ebx
  102f97:	75 d5                	jne    102f6e <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102f99:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102f9d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102fa4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102fa7:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102faa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102fb1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fb4:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102fb7:	8b 45 10             	mov    0x10(%ebp),%eax
  102fba:	8d 50 01             	lea    0x1(%eax),%edx
  102fbd:	89 55 10             	mov    %edx,0x10(%ebp)
  102fc0:	0f b6 00             	movzbl (%eax),%eax
  102fc3:	0f b6 d8             	movzbl %al,%ebx
  102fc6:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102fc9:	83 f8 55             	cmp    $0x55,%eax
  102fcc:	0f 87 38 03 00 00    	ja     10330a <vprintfmt+0x3aa>
  102fd2:	8b 04 85 d4 3b 10 00 	mov    0x103bd4(,%eax,4),%eax
  102fd9:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102fdc:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102fe0:	eb d5                	jmp    102fb7 <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102fe2:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102fe6:	eb cf                	jmp    102fb7 <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102fe8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102fef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102ff2:	89 d0                	mov    %edx,%eax
  102ff4:	c1 e0 02             	shl    $0x2,%eax
  102ff7:	01 d0                	add    %edx,%eax
  102ff9:	01 c0                	add    %eax,%eax
  102ffb:	01 d8                	add    %ebx,%eax
  102ffd:	83 e8 30             	sub    $0x30,%eax
  103000:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103003:	8b 45 10             	mov    0x10(%ebp),%eax
  103006:	0f b6 00             	movzbl (%eax),%eax
  103009:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10300c:	83 fb 2f             	cmp    $0x2f,%ebx
  10300f:	7e 38                	jle    103049 <vprintfmt+0xe9>
  103011:	83 fb 39             	cmp    $0x39,%ebx
  103014:	7f 33                	jg     103049 <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  103016:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  103019:	eb d4                	jmp    102fef <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10301b:	8b 45 14             	mov    0x14(%ebp),%eax
  10301e:	8d 50 04             	lea    0x4(%eax),%edx
  103021:	89 55 14             	mov    %edx,0x14(%ebp)
  103024:	8b 00                	mov    (%eax),%eax
  103026:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  103029:	eb 1f                	jmp    10304a <vprintfmt+0xea>

        case '.':
            if (width < 0)
  10302b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10302f:	79 86                	jns    102fb7 <vprintfmt+0x57>
                width = 0;
  103031:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103038:	e9 7a ff ff ff       	jmp    102fb7 <vprintfmt+0x57>

        case '#':
            altflag = 1;
  10303d:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103044:	e9 6e ff ff ff       	jmp    102fb7 <vprintfmt+0x57>
            goto process_precision;
  103049:	90                   	nop

        process_precision:
            if (width < 0)
  10304a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10304e:	0f 89 63 ff ff ff    	jns    102fb7 <vprintfmt+0x57>
                width = precision, precision = -1;
  103054:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103057:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10305a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103061:	e9 51 ff ff ff       	jmp    102fb7 <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103066:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103069:	e9 49 ff ff ff       	jmp    102fb7 <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10306e:	8b 45 14             	mov    0x14(%ebp),%eax
  103071:	8d 50 04             	lea    0x4(%eax),%edx
  103074:	89 55 14             	mov    %edx,0x14(%ebp)
  103077:	8b 00                	mov    (%eax),%eax
  103079:	8b 55 0c             	mov    0xc(%ebp),%edx
  10307c:	89 54 24 04          	mov    %edx,0x4(%esp)
  103080:	89 04 24             	mov    %eax,(%esp)
  103083:	8b 45 08             	mov    0x8(%ebp),%eax
  103086:	ff d0                	call   *%eax
            break;
  103088:	e9 a4 02 00 00       	jmp    103331 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  10308d:	8b 45 14             	mov    0x14(%ebp),%eax
  103090:	8d 50 04             	lea    0x4(%eax),%edx
  103093:	89 55 14             	mov    %edx,0x14(%ebp)
  103096:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103098:	85 db                	test   %ebx,%ebx
  10309a:	79 02                	jns    10309e <vprintfmt+0x13e>
                err = -err;
  10309c:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10309e:	83 fb 06             	cmp    $0x6,%ebx
  1030a1:	7f 0b                	jg     1030ae <vprintfmt+0x14e>
  1030a3:	8b 34 9d 94 3b 10 00 	mov    0x103b94(,%ebx,4),%esi
  1030aa:	85 f6                	test   %esi,%esi
  1030ac:	75 23                	jne    1030d1 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  1030ae:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1030b2:	c7 44 24 08 c1 3b 10 	movl   $0x103bc1,0x8(%esp)
  1030b9:	00 
  1030ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c4:	89 04 24             	mov    %eax,(%esp)
  1030c7:	e8 61 fe ff ff       	call   102f2d <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1030cc:	e9 60 02 00 00       	jmp    103331 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  1030d1:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1030d5:	c7 44 24 08 ca 3b 10 	movl   $0x103bca,0x8(%esp)
  1030dc:	00 
  1030dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e7:	89 04 24             	mov    %eax,(%esp)
  1030ea:	e8 3e fe ff ff       	call   102f2d <printfmt>
            break;
  1030ef:	e9 3d 02 00 00       	jmp    103331 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1030f4:	8b 45 14             	mov    0x14(%ebp),%eax
  1030f7:	8d 50 04             	lea    0x4(%eax),%edx
  1030fa:	89 55 14             	mov    %edx,0x14(%ebp)
  1030fd:	8b 30                	mov    (%eax),%esi
  1030ff:	85 f6                	test   %esi,%esi
  103101:	75 05                	jne    103108 <vprintfmt+0x1a8>
                p = "(null)";
  103103:	be cd 3b 10 00       	mov    $0x103bcd,%esi
            }
            if (width > 0 && padc != '-') {
  103108:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10310c:	7e 76                	jle    103184 <vprintfmt+0x224>
  10310e:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103112:	74 70                	je     103184 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103114:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103117:	89 44 24 04          	mov    %eax,0x4(%esp)
  10311b:	89 34 24             	mov    %esi,(%esp)
  10311e:	e8 ba f7 ff ff       	call   1028dd <strnlen>
  103123:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103126:	29 c2                	sub    %eax,%edx
  103128:	89 d0                	mov    %edx,%eax
  10312a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10312d:	eb 16                	jmp    103145 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  10312f:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103133:	8b 55 0c             	mov    0xc(%ebp),%edx
  103136:	89 54 24 04          	mov    %edx,0x4(%esp)
  10313a:	89 04 24             	mov    %eax,(%esp)
  10313d:	8b 45 08             	mov    0x8(%ebp),%eax
  103140:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103142:	ff 4d e8             	decl   -0x18(%ebp)
  103145:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103149:	7f e4                	jg     10312f <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10314b:	eb 37                	jmp    103184 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  10314d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103151:	74 1f                	je     103172 <vprintfmt+0x212>
  103153:	83 fb 1f             	cmp    $0x1f,%ebx
  103156:	7e 05                	jle    10315d <vprintfmt+0x1fd>
  103158:	83 fb 7e             	cmp    $0x7e,%ebx
  10315b:	7e 15                	jle    103172 <vprintfmt+0x212>
                    putch('?', putdat);
  10315d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103160:	89 44 24 04          	mov    %eax,0x4(%esp)
  103164:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10316b:	8b 45 08             	mov    0x8(%ebp),%eax
  10316e:	ff d0                	call   *%eax
  103170:	eb 0f                	jmp    103181 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  103172:	8b 45 0c             	mov    0xc(%ebp),%eax
  103175:	89 44 24 04          	mov    %eax,0x4(%esp)
  103179:	89 1c 24             	mov    %ebx,(%esp)
  10317c:	8b 45 08             	mov    0x8(%ebp),%eax
  10317f:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103181:	ff 4d e8             	decl   -0x18(%ebp)
  103184:	89 f0                	mov    %esi,%eax
  103186:	8d 70 01             	lea    0x1(%eax),%esi
  103189:	0f b6 00             	movzbl (%eax),%eax
  10318c:	0f be d8             	movsbl %al,%ebx
  10318f:	85 db                	test   %ebx,%ebx
  103191:	74 27                	je     1031ba <vprintfmt+0x25a>
  103193:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103197:	78 b4                	js     10314d <vprintfmt+0x1ed>
  103199:	ff 4d e4             	decl   -0x1c(%ebp)
  10319c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031a0:	79 ab                	jns    10314d <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  1031a2:	eb 16                	jmp    1031ba <vprintfmt+0x25a>
                putch(' ', putdat);
  1031a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031ab:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1031b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b5:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  1031b7:	ff 4d e8             	decl   -0x18(%ebp)
  1031ba:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031be:	7f e4                	jg     1031a4 <vprintfmt+0x244>
            }
            break;
  1031c0:	e9 6c 01 00 00       	jmp    103331 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1031c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031cc:	8d 45 14             	lea    0x14(%ebp),%eax
  1031cf:	89 04 24             	mov    %eax,(%esp)
  1031d2:	e8 0b fd ff ff       	call   102ee2 <getint>
  1031d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031da:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1031dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1031e3:	85 d2                	test   %edx,%edx
  1031e5:	79 26                	jns    10320d <vprintfmt+0x2ad>
                putch('-', putdat);
  1031e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031ee:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1031f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f8:	ff d0                	call   *%eax
                num = -(long long)num;
  1031fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031fd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103200:	f7 d8                	neg    %eax
  103202:	83 d2 00             	adc    $0x0,%edx
  103205:	f7 da                	neg    %edx
  103207:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10320a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10320d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103214:	e9 a8 00 00 00       	jmp    1032c1 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103219:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10321c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103220:	8d 45 14             	lea    0x14(%ebp),%eax
  103223:	89 04 24             	mov    %eax,(%esp)
  103226:	e8 64 fc ff ff       	call   102e8f <getuint>
  10322b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10322e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103231:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103238:	e9 84 00 00 00       	jmp    1032c1 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10323d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103240:	89 44 24 04          	mov    %eax,0x4(%esp)
  103244:	8d 45 14             	lea    0x14(%ebp),%eax
  103247:	89 04 24             	mov    %eax,(%esp)
  10324a:	e8 40 fc ff ff       	call   102e8f <getuint>
  10324f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103252:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103255:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10325c:	eb 63                	jmp    1032c1 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  10325e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103261:	89 44 24 04          	mov    %eax,0x4(%esp)
  103265:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10326c:	8b 45 08             	mov    0x8(%ebp),%eax
  10326f:	ff d0                	call   *%eax
            putch('x', putdat);
  103271:	8b 45 0c             	mov    0xc(%ebp),%eax
  103274:	89 44 24 04          	mov    %eax,0x4(%esp)
  103278:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10327f:	8b 45 08             	mov    0x8(%ebp),%eax
  103282:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103284:	8b 45 14             	mov    0x14(%ebp),%eax
  103287:	8d 50 04             	lea    0x4(%eax),%edx
  10328a:	89 55 14             	mov    %edx,0x14(%ebp)
  10328d:	8b 00                	mov    (%eax),%eax
  10328f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103292:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103299:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1032a0:	eb 1f                	jmp    1032c1 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1032a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a9:	8d 45 14             	lea    0x14(%ebp),%eax
  1032ac:	89 04 24             	mov    %eax,(%esp)
  1032af:	e8 db fb ff ff       	call   102e8f <getuint>
  1032b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1032ba:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1032c1:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1032c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032c8:	89 54 24 18          	mov    %edx,0x18(%esp)
  1032cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032cf:	89 54 24 14          	mov    %edx,0x14(%esp)
  1032d3:	89 44 24 10          	mov    %eax,0x10(%esp)
  1032d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032da:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1032dd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032e1:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1032e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ef:	89 04 24             	mov    %eax,(%esp)
  1032f2:	e8 94 fa ff ff       	call   102d8b <printnum>
            break;
  1032f7:	eb 38                	jmp    103331 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1032f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  103300:	89 1c 24             	mov    %ebx,(%esp)
  103303:	8b 45 08             	mov    0x8(%ebp),%eax
  103306:	ff d0                	call   *%eax
            break;
  103308:	eb 27                	jmp    103331 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10330a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103311:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103318:	8b 45 08             	mov    0x8(%ebp),%eax
  10331b:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  10331d:	ff 4d 10             	decl   0x10(%ebp)
  103320:	eb 03                	jmp    103325 <vprintfmt+0x3c5>
  103322:	ff 4d 10             	decl   0x10(%ebp)
  103325:	8b 45 10             	mov    0x10(%ebp),%eax
  103328:	48                   	dec    %eax
  103329:	0f b6 00             	movzbl (%eax),%eax
  10332c:	3c 25                	cmp    $0x25,%al
  10332e:	75 f2                	jne    103322 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  103330:	90                   	nop
    while (1) {
  103331:	e9 36 fc ff ff       	jmp    102f6c <vprintfmt+0xc>
                return;
  103336:	90                   	nop
        }
    }
}
  103337:	83 c4 40             	add    $0x40,%esp
  10333a:	5b                   	pop    %ebx
  10333b:	5e                   	pop    %esi
  10333c:	5d                   	pop    %ebp
  10333d:	c3                   	ret    

0010333e <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10333e:	f3 0f 1e fb          	endbr32 
  103342:	55                   	push   %ebp
  103343:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103345:	8b 45 0c             	mov    0xc(%ebp),%eax
  103348:	8b 40 08             	mov    0x8(%eax),%eax
  10334b:	8d 50 01             	lea    0x1(%eax),%edx
  10334e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103351:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103354:	8b 45 0c             	mov    0xc(%ebp),%eax
  103357:	8b 10                	mov    (%eax),%edx
  103359:	8b 45 0c             	mov    0xc(%ebp),%eax
  10335c:	8b 40 04             	mov    0x4(%eax),%eax
  10335f:	39 c2                	cmp    %eax,%edx
  103361:	73 12                	jae    103375 <sprintputch+0x37>
        *b->buf ++ = ch;
  103363:	8b 45 0c             	mov    0xc(%ebp),%eax
  103366:	8b 00                	mov    (%eax),%eax
  103368:	8d 48 01             	lea    0x1(%eax),%ecx
  10336b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10336e:	89 0a                	mov    %ecx,(%edx)
  103370:	8b 55 08             	mov    0x8(%ebp),%edx
  103373:	88 10                	mov    %dl,(%eax)
    }
}
  103375:	90                   	nop
  103376:	5d                   	pop    %ebp
  103377:	c3                   	ret    

00103378 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103378:	f3 0f 1e fb          	endbr32 
  10337c:	55                   	push   %ebp
  10337d:	89 e5                	mov    %esp,%ebp
  10337f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103382:	8d 45 14             	lea    0x14(%ebp),%eax
  103385:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103388:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10338b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10338f:	8b 45 10             	mov    0x10(%ebp),%eax
  103392:	89 44 24 08          	mov    %eax,0x8(%esp)
  103396:	8b 45 0c             	mov    0xc(%ebp),%eax
  103399:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339d:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a0:	89 04 24             	mov    %eax,(%esp)
  1033a3:	e8 08 00 00 00       	call   1033b0 <vsnprintf>
  1033a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1033ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1033ae:	c9                   	leave  
  1033af:	c3                   	ret    

001033b0 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1033b0:	f3 0f 1e fb          	endbr32 
  1033b4:	55                   	push   %ebp
  1033b5:	89 e5                	mov    %esp,%ebp
  1033b7:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1033ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033c3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c9:	01 d0                	add    %edx,%eax
  1033cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1033d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1033d9:	74 0a                	je     1033e5 <vsnprintf+0x35>
  1033db:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033de:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033e1:	39 c2                	cmp    %eax,%edx
  1033e3:	76 07                	jbe    1033ec <vsnprintf+0x3c>
        return -E_INVAL;
  1033e5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1033ea:	eb 2a                	jmp    103416 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1033ec:	8b 45 14             	mov    0x14(%ebp),%eax
  1033ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1033f3:	8b 45 10             	mov    0x10(%ebp),%eax
  1033f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1033fa:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1033fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  103401:	c7 04 24 3e 33 10 00 	movl   $0x10333e,(%esp)
  103408:	e8 53 fb ff ff       	call   102f60 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10340d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103410:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103413:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103416:	c9                   	leave  
  103417:	c3                   	ret    
