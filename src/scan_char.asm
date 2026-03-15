SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. usar syscall read
    ; 2. leer 1 byte desde stdin
    ; 3. devolverlo en AL

    mov eax, 3 ; Llamamos a la syscall scan
    mov ebx, 0 ; STDIN
    mov ecx, char_buffer ; Apuntamos a la memoria que reserbamos
    mov edx, 1 ; El tamaño del caracter
    int 0x80 ; Llamamos al kernel

    mov al, [char_buffer] ; Metemos el byte que leimos a AL

    mov esp, ebp
    pop ebp
    ret
