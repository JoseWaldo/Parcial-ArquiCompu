.data
str:    .asciiz "Hello, world!"
.align 2

.text
main:
    la $a0, str    # Cargar la dirección base del string en $a0
    lb $t0, ($a0)  # Cargar el primer byte del string en $t0

loop:
    beqz $t0, end_loop  # Salir del loop si encontramos el terminador nulo
    # Hacer algo con el byte cargado en $t0 (por ejemplo, imprimirlo)
    # Incrementar la dirección para apuntar al próximo byte alineado
    addi $a0, $a0, 2
    lb $t0, ($a0)  # Cargar el próximo byte del string en $t0
    j loop

end_loop:
    # Fin del programa