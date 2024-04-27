.data
x: .word 50
y: .word 0

.text
main:

   lw $a0, x #Dividendo
   lw $a1, y #Divisor
   li $t1, 0
   
   jal divitionWhile
   
   
   
divitionWhile:
	beqz $a1,exit
	blt $a0,$a1,exit    #Si a0 es meonr a a1
	addi $t1,$t1,1	    #Sumamos uno al contador de division
	sub $a0,$a0,$a1     #Restamos a0 con a1
	move $v1,$a0  	    #Residuo en v1
	j divitionWhile
		
	
exit:
    #move $v0,$t1
    li $v0, 10             # Finalizar el programa
    syscall
    