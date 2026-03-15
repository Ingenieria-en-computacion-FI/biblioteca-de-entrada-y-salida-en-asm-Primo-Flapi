SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. Guardar el caracter en memoria
    ; 2. Usar syscall write
    ; 3. Imprimir 1 byte

    ; write(fd=1, buffer, 1)

    push eax

    mov eax, 4 ; Llamamos a la syscall write
    mov ebx, 1 ; STOUD
    mov ecx, esp; Apuntamos a la base de la pila
    mov edx, 1 ; Le decimos el tamaño de caracterres que tenemos que imprimir
    int 0x80 ; Llamamos al KERNEL

    mov esp, ebp
    pop ebp
    ret
