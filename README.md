#links de interes
https://excalidraw.com/#room=d426b892ceecc5cde0cc,UYqGWidVqgWBy__wYdvTyQ
https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_help.html
https://docs.google.com/presentation/d/142tUc8qIrDUvmOmYqPm88QkELwfn1t7sYMGkNj3M3gk/edit#slide=id.g374b64747c_1_100
https://docs.google.com/presentation/d/10WsAuxCDNTBF_pesWkHyKiQEP-7A8m0SRjTFs1s6nCQ/edit#slide=id.g718855a349_1_60
https://masterplc.com/calculadora/hexadecimal-a-decimal/
sling.2
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