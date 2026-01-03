
format PE64 GUI 
entry start

include 'C:\FLAT\INCLUDE\win64a.inc' 


section '.text' code readable executable
start:
    sub rsp, 28h
    

    lea rcx, [szKernel32]
    call [LoadLibraryA]
    mov [hKernel32], rax
    

    mov rcx, rax       
    mov rdx, 1530 + 6       
    call [GetProcAddress]
    mov [pVirtualAlloc], rax
    
    

    xor rcx, rcx       
    mov rdx, 4096       
    mov r8, 3000h     
    mov r9, 40h        
    call rax            
    

    mov [allocated_mem], rax
    
    test rax, rax
    jz error
    
    jmp VIRTUALL
    
    lea rcx, [szKernel32]
    call [LoadLibraryA]
    mov [hKernel32], rax
    
    mov rcx, rax
    mov rdx, 1530 + 9
    call [GetProcAddress]
    mov [pVirtualFree], rax
    
    mov rcx, [allocated_mem]
    mov rdx, 3000h
    xor r8, r8
    mov r9, 8000h
    call rax
    
VIRTUALL:
    xor rcx, rcx
    mov rdx, msg
    mov r8, titles
    xor r9, r9
    call [MessageBoxA]
    jmp exit
    
error:
    xor rcx, rcx
    mov rdx, msgg
    mov r8, titless
    xor r9, r9
    call [MessageBoxA]
    
exit:
    xor rcx, rcx
    call [ExitProcess]

section '.data' data readable writeable
    szKernel32      db 'KERNEL32.DLL',0
    hKernel32       dq 0
    pVirtualAlloc   dq 0
    allocated_mem   dq 0
    pVirtualFree    dq 0
    
    titles db 'virtual',0
    msg db 'yes',0
    
    titless db 'Error!',0
    msgg db 'Error!',0
    

section '.idata' import data readable
library kernel32, 'KERNEL32.DLL', \
        user32, 'USER32.DLL'
   
    import kernel32, \
           ExitProcess, 'ExitProcess', \
           LoadLibraryA, 997, \
           GetProcAddress, 718
           
    import user32,\
            MessageBoxA, 'MessageBoxA'





