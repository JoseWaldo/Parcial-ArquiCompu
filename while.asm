.data
	message: .asciiz "After while loop is done"	
	space: .asciiz ", "	

.text
    main:
        add $t0,$zero,0
        li $s0, 26
        
    while:
        bgt $t0,$s0,exit
        jal printNumber
        addi $t0,$t0,1    
        
        j while  #Volver a ir al procedimiento while 
    
    
    exit:   #Cuando se termine el while de 0 a 10, imprimira el mensaje
        li $v0,4
        la $a0,message
        syscall
    
    
        #Final del programa
        li $v0,10
        syscall
        
    printNumber:
        li $v0,1   #Preparar para leer entero
        add $a0,$t0,$zero
        syscall
        
        li $v0,4
        la $a0,space
        syscall
        
        jr $ra
     	