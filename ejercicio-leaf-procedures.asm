# Escriba un procedimiento en ensamblador MIPS que retorne el valor más pequeño contenido en un vector. 
# El procedimiento recibe dos argumentos: (1) un apuntador al primer elemento del vector, y (2) el número de elementos del mismo.

.data
	vector: .word 9, 3, 2, 8, 6, 7
	lengthVector: .word 6
.text
	main: 
		la $t0, vector
		lw $a0, 0($t0) # Primer elemento del array
		lw $a1, lengthVector # Cargo la longitud del array		
		li $t1, 0 # Posición de recorrido
		
		move $t3, $a0 # Guardo en t3 el valor más pequeño
		jal valueMostLittle
		
		# Salir del programa
		li $v0, 10
		syscall
		
		valueMostLittle:
			bge $t1, $a1, return #  Posición de recorrido >= Longitud -> Return
			mul $t2, $t1, 4
			add $t2, $t2, $t0
			lw $a0, 0($t2) # Valor actual de la lista
			addi $t1, $t1, 1 # Incremetal de la posición de recorrido
			ble $t3, $a0, valueMostLittle
			move $t3, $a0
			j valueMostLittle
			jr $ra
		
		return: 
			jr $ra
