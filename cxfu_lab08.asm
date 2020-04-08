.org 0x0000
entry:
	ldi r16,0xFF
	out DDRD,r16
	ldi r16,0x00
	out DDRB,r16
 
main: 
	in r16,PINB
	mov r17,r16

	andi r17,0x80
	cpi r17,0x80
	breq high_temp

	mov r17,r16

	clr r18
	andi r17,0x04
	or r18,r17
	
	mov r17, r16
	andi r17,0x80
	or r18,r17

	mov r17, r16
	andi r17,0x40
	or r18,r17

	ldi r19,0xff
	eor r16,r19
	andi r16,0x40
	lsr r16
	or r18,r16
	out PORTD,r18
	rjmp main

high_temp:
	out PORTD,r17
	rjmp main