SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. syscall read
    ; 2. guardar en buffer
    ; 3. agregar terminador 0

    push eax
    push ebx

    mov ecx, eax ; Apuntamos al buffer destino
    mov edx, ebx ; le damos el tamaño maximo
    mov eax, 3 ; llamamos a la syscall scan
    mov ebx, 0 ; STDIN
    int 0x80

    mov ecx, [ebp-4]    ; vamos a la direccion original
    add ecx, eax        ; vamos al final
    mov al, 0           ; AL = 0
    mov [ecx], al       ; escribimos el caracter del final del arreglo

    mov esp, ebp
    pop ebp
    ret
