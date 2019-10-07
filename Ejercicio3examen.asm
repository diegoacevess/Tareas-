#Diego Eduardo Aceves Barragán
#ITESO
#03/10/2019

.data
   Vector:	    .word 1 85 59 6 8 22 11 7 5 10 5 58 2
  
.text
main:
	la $a0, Vector #Cargar la dirección del vector en s0
	li $a1, 13 #Longitud del vector
	jal init #Inicializar los valores para I y J
	j fin #Saltar a fin de programa
	
init:	addi $sp, $sp, -4 #Decrementamso el stack en 4
	sw $ra, 0($sp) #Guardas Ra en el stack 
	addi $t2, $t2, 0 #Le damos valor a i
	addi $s3, $s3, 0 #Le damos valor a j
	
burbuja:addi $t2, $t2, 1 #Aumentamos en 1 a i
	beq $t2, $a1, final #Si i=n, nos movemos a final
	addi $s3, $t2, -1 #j tiene que ser igual a -1
	
comp:	bge $s3, $zero, comp2 #Si j es mayor o igual a zero, se mueve a comp2
	j burbuja #Salta a burbuja
	
comp2: mul $s7, $s3, 4 #Multiplicas j por 4 para movernos en el vector
	 lw $s4, Vector($s7) #Cargamos valor del Vector
	 addi $s5, $s7, 4 #Agregamos un 4 para tomar el siguiente valor
	 lw $s6, Vector($s5) #Agregamos el siguiente valor del vector
	 bgt $s4, $s6, swap2 #si el valor primero es mayor al valor segundo, te vas a swap2
	 j burbuja #Saltar a burbuja

swap2: la $a2, Vector($s7) #Apuntador para desplazar en vector
	   jal swap #Vas a función que hace swap
	   addi $s3, $s3, -1 #Decrementas j en 1
	   j comp #Saltar a comp
	
swap:   lw $t0, 0($a2) #Guardamos los primeros 4 bytes en t0
	lw $t1, 4($a2) #Guardamos los siguientes 4 bytes en t1
	
	sw $t0, 4($a2) #Cargamos en los segundos 4 bytes de s1 el valor de t0
	sw $t1, 0($a2) #Cargamos en los primeros 4 bytes de s1 el vlor de t0
	jr $ra
	
final: lw $ra, 0($sp) #Sacar Ra del stack
      addi $sp, $sp, 4 #Aumentar stack en 4
      jr $ra #Saltar a Re
     
fin: #Final del programa
