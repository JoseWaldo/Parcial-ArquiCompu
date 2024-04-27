.data
array: .word 1,2,1,2,4
#,3,5,6,3,1
length: .word 5
arrayClean: .space 25
space: .asciiz ", "

.text

main:
    # Cargo array
    la $a0, array
    
    # Nro elementos array
    lw $a1,length
    
    # Cargo arrayClean
    la $a3, arrayClean
    
    li $s0, 0 #Contador de posicioes array
    li $s1, 0 #Contador de posicioes arrayClean
    
    jal while
    
    li $s0, 0 #Contador de posicioes array
    jal whilePrint



while:
    bge $s0, $a1, return     # Si s0 >= a1 (nro elementos del array), termina el bucle
    mul $t6, $s0, 4        # Multiplicar el �ndice por 4 (tama�o de palabra)
    add $t6, $t6, $a0      # Sumar la direcci�n base del array
    lw $t3, 0($t6)         # Cargar el valor del elemento en $t3
    
    li $t7, 0              #Bandera para saber si existe o no  0 es que no existe el elemento
    li $s2, 0 		   #Contador de posicioes arrayClean auxiliar
    
    
    addi $sp,$sp, -4		#Guardar numero actual del array (ra)
    sw $ra, 0($sp)                  #Guardar en pila ra	
    jal validateDuplicate
    
   #Setear nuevamente el inicio de a1 que guardamos en la pila (ra)
    lw $ra, 0($sp)
    addi $sp,$sp, 4
    #jal printNumber
    
    addi $s0,$s0,1
    beq  $t7,1,while
    
    #mul $t6, $s1, 4        # Multiplicar el �ndice por 4 (tama�o de palabra)
    #add $t6, $t6, $a3      # Sumar la direcci�n base del array
    #sw $t3, 0($t6)
   
    mul $t6, $s1, 4        # Multiplicar el �ndice por 4 (tama�o de palabra)
    add $t6, $t6, $a3      # Sumar la direcci�n base del array
    sw $t3, 0($t6)
   
    #sw $t3, ($a3)
    # Avanzar al siguiente espacio en arrayClean
    #addi $a3, $a3, 4
   
    addi $s1,$s1,1
    j while





validateDuplicate:
    bge $s2, $a1, return     # Si s1 >= a1 (nro elementos del array), termina el bucle
    
    mul $t6, $s2, 4        # Multiplicar el �ndice por 4 (tama�o de palabra)
    add $t6, $t6, $a3      # Sumar la direcci�n base del array
    lw $t4, 0($t6)         # Cargar el valor del elemento en $t4
    
    beq	$t3,$t4, continue  #Si t3 es igual a t4, lo encontre y debo seguir iterando con el siguente de array, salto a continue
    addi $s2,$s2,1
    j validateDuplicate
    
continue:
    li $t7,1
    jr $ra
    
 
return: 
    jr $ra  

exit:
    li $v0, 10             # Finalizar el programa
    syscall
    
    
whilePrint:
    bge $s0, $s1, exit     # Si s0 >= a1, termina el bucle
    # Calcular la direcci�n del elemento en el array
    
    #la  
    mul $t6, $s0, 4        # Multiplicar el �ndice por 4 (tama�o de palabra)
    add $t6, $t6, $a3    # Sumar la direcci�n base del array
    lw $t3, 0($t6)         # Cargar el valor del elemento en $t3

    jal printNumber

    addi $s0,$s0,1
    
    j whilePrint
    
    
    
printNumber:
    li $v0, 1              # Imprimir un entero
    move $a0, $t3          # Cargar el n�mero a imprimir en $a0
    syscall

    li $v0, 4              # Imprimir una cadena
    la $a0, space          # Cargar la cadena a imprimir en $a0
    syscall

    jr $ra                 # Volver a la llamada