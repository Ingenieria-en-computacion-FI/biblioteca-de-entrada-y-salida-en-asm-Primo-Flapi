SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. calcular longitud
    ; 2. syscall write

    push esi
    push ebx
    push ecx
    push edx

    mov esi, eax
    xor ecx, ecx

loop_contador:
    mov al, [esi+ecx]
    cmp al, 0  ; ¿Estamos al final de la cadena?
    je imprimir
    add ecx, 1
    jmp loop_contador

imprimir:
    mov eax, 4
    mov ebx, 1
    mov edx, ecx
    mov ecx, esi
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop esi

    mov esp, ebp
    pop ebp
    ret
