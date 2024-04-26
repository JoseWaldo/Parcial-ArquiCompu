.data
alfabeto:
    .asciiz "abcdefghijklmnopqrstuvwxyz"

.text
main:
    # Cargar la direcci�n base del alfabeto en $t0
    la $t0, alfabeto
    
    # Sumar el desplazamiento para llegar a la s�ptima letra ('g')
    li $t1, 6      # La posici�n 7 es �ndice 6 (recordando que la indexaci�n empieza en 0)
    add $t0, $t0, $t1  # Suma la posici�n a la direcci�n base

    # Cargar la letra en $t2
    lb $t2, ($t0)

    # Imprimir la letra en pantalla
    li $v0, 11     # C�digo de la llamada al sistema para imprimir un caracter
    move $a0, $t2  # Mueve el valor de la letra a imprimir en el argumento de la llamada al sistema
    syscall        # Llama al sistema para imprimir el caracter

    # Salir del programa
    li $v0, 10     # C�digo de la llamada al sistema para salir del programa
    syscall        # Llama al sistema