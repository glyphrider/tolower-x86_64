.global _start

.bss
data: .space 256
buffer_len = . - data

.text

_start:
  mov $0,%rax
  mov $0,%rdi
  mov $data,%rsi
  mov $buffer_len,%rdx
  syscall

  cmpq $0,%rax
  je _exit

  mov %rax,%r10
  mov $0,%r11
  mov $data,%rsi

.L1:
  movb (%rsi,%r11,1),%bl
  cmpb $'A',%bl
  jl .L2
  cmpb $'Z',%bl
  jg .L2
  or $0x20,%bl
  movb %bl,(%rsi,%r11,1)
.L2:
  add $1,%r11
  cmpq %r10,%r11
  jl .L1

  mov $1,%rax
  mov $1,%rdi
  mov $data,%rsi
  mov %r10,%rdx
  syscall
  
  jmp _start

_exit:
  movq $60,%rax
  movq $0,%rdi
  syscall
