;**************************************************************************
;                                                                     
;    NOM:      Chronomètre                             
;    Date:     20/04/2009                                           
;    Auteur:   Lotmani Smail                                           
;                                                                    
;*************************************************************************
;                                                                     
;    Fichier requis: P16F84.inc                                     
;                                                                    
;*************************************************************************
                                                                     


	LIST      p=16F84           
	#include <p16F84.inc>        

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_OFF & _HS_OSC
;*********************Assignations****************************************
OPTIONVAL	EQU	H'00000111'			

INTERMASK	EQU	H'0090' 	

;*************************definitions**************************************
        #DEFINE bp1 PORTA,3
        #DEFINE bp2 PORTB,0
         
;*************************macros*******************************************
;******************procedure d'affichage des chiffres pour afficheur1******
	sp1 macro                  ;envoie un "1" sur l'entrée du 74ls164
                   bsf PORTB,1
	endm
	cp1 macro                  ;envoie un "0" sur l'entrée du 74ls164 
                   bcf PORTB,1
	endm
	clk1 macro                  ;envoie un front montant sur l'entrée Horloge du 74ls164 pour valider l'entrée 
                   bcf PORTA,4
                   bsf PORTA,4
	endm
                
        af0 macro       ;affiche "1"
                   sp1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1
         	   cp1
          	   clk1
                   clk1
                   nop
                   nop
                   nop   
       endm 
       af1 macro        ;affiche "2"
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   cp1
                   clk1
                   clk1 
                   clk1 
                   clk1
                   clk1
                   nop 
       endm
       af2 macro
                   sp1
                   clk1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
       endm
       af3 macro
                   sp1
                   clk1
                   clk1
                   clk1
                   clk1
                   cp1
                   clk1
                   clk1
                   sp1
                   clk1
                   clk1
                   nop
                   nop
      endm
      af4 macro
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   cp1 
                   clk1
                   clk1
                   sp1
                   clk1
                   clk1
                   clk1
                   nop
     endm
     af5 macro
                   sp1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   clk1
      endm
      af6 macro 
                   sp1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1
                   nop
                   nop 
      endm
      af7 macro
                   sp1
                   clk1
                   clk1
                   clk1
                   cp1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1
                   nop
                   nop
                   nop
      endm
      af8 macro
                   sp1
                   clk1
                   clk1
                   clk1
                   clk1
                   clk1 
                   clk1
                   clk1
                   clk1
                   nop
                   nop
                   nop
                   nop 
      endm
      af9 macro
                   sp1
                   clk1
                   clk1
                   clk1
                   clk1
                   cp1
                   clk1
                   sp1
                   clk1
                   clk1
                   clk1
                   nop
                   nop 
      endm 
  
;*************procedure d'affichage des chiffres pour afficheur2*************   
        sp2 macro
                   bsf PORTB,3
	endm
	cp2 macro
                   bcf PORTB,3
	endm
	clk2 macro  
                   bcf PORTB,2
                   bsf PORTB,2
	endm
                
        aff0 macro
                   sp2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2
         	       cp2
          	       clk2
                   clk2
                   nop
                   nop
                   nop  
       endm 
       aff1 macro 
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   cp2
                   clk2
                   clk2 
                   clk2 
                   clk2
                   clk2 
                   nop
       endm
       aff2 macro
                   sp2
                   clk2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
       endm
       aff3 macro
                   sp2
                   clk2
                   clk2
                   clk2
                   clk2
                   cp2
                   clk2
                   clk2
                   sp2
                   clk2
                   clk2
                   nop
                   nop
      endm
      aff4 macro
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   cp2 
                   clk2
                   clk2
                   sp2
                   clk2
                   clk2
                   clk2
                   nop
     endm
     aff5 macro
                   sp2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   clk2
      endm
      aff6 macro 
                   sp2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2
                   nop
                   nop
      endm
      aff7 macro
                   sp2
                   clk2
                   clk2
                   clk2
                   cp2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2
                   nop
                   nop
                   nop
      endm
      aff8 macro
                   sp2
                   clk2
                   clk2
                   clk2
                   clk2
                   clk2 
                   clk2
                   clk2
                   clk2
                   nop
                   nop
                   nop
                   nop
      endm
      aff9 macro
                   sp2
                   clk2
                   clk2
                   clk2
                   clk2
                   cp2
                   clk2
                   sp2
                   clk2
                   clk2
                   clk2
                   nop
                   nop 
      endm 
;***********procedure d'affichage des chiffres pour afficheur3*************
sp3 macro
                   bsf PORTB,5
	endm
	cp3 macro
                   bcf PORTB,5
	endm
	clk3 macro  
                   bcf PORTB,4
                   bsf PORTB,4
	endm
                
        afff0 macro
                   sp3
                   clk3
                   clk3
                   clk3
                   clk3
                   clk3
                   clk3
         	       cp3
          	       clk3
                   clk3
                   nop
                   nop
                   nop  
       endm 
       afff1 macro 
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
                   cp3
                   clk3
                   clk3
                   clk3 
                   clk3
                   clk3 
                   nop
       endm
       afff2 macro
                   sp3
                   clk3
                   clk3
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
       endm
       afff3 macro
                   sp3
                   clk3
                   clk3
                   clk3
                   clk3
                   cp3
                   clk3
                   clk3
                   sp3
                   clk3
                   clk3
                   nop
                   nop 
      endm
      afff4 macro
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
                   cp3
                   clk3
                   clk3
                   sp3
                   clk3
                   clk3
                   clk3
                   nop
     endm
     afff5 macro
                   sp3
                   clk3
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
                   cp3
                   clk3
                   sp3
                   clk3
                   clk3
                   clk3
      endm
     
;*************procedure d'affichage des chiffres pour afficheur4****************** 
        sp4 macro
                   bsf PORTB,7
	endm
	cp4 macro
                   bcf PORTB,7
	endm
	clk4 macro  
                   bcf PORTB,6
                   bsf PORTB,6
	endm
                
        affff0 macro
                   sp4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4
         	   cp4
          	   clk4
                   clk4
                   nop
                   nop
                   nop  
       endm 
       affff1 macro 
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   cp4
                   clk4
                   clk4
                   clk4 
                   clk4
                   clk4 
                   nop
       endm
       affff2 macro
                   sp4
                   clk4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
       endm
       affff3 macro
                   sp4
                   clk4
                   clk4
                   clk4
                   clk4
                   cp4
                   clk4
                   clk4
                   sp4
                   clk4
                   clk4
                   nop
                   nop
      endm
      affff4 macro
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   cp4
                   clk4
                   clk4
                   sp4
                   clk4
                   clk4
                   clk4
                   nop
     endm
     affff5 macro
                   sp4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   clk4
      endm
      affff6 macro 
                   sp4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4
                   nop
                   nop
      endm
      affff7 macro
                   sp4
                   clk4
                   clk4
                   clk4
                   cp4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4
                   nop
                   nop
                   nop
      endm
      affff8 macro
                   sp4
                   clk4
                   clk4
                   clk4
                   clk4
                   clk4 
                   clk4
                   clk4
                   clk4
                   nop
                   nop
                   nop
                   nop 
      endm
      affff9 macro
                   sp4
                   clk4
                   clk4
                   clk4
                   clk4
                   cp4
                   clk4
                   sp4
                   clk4
                   clk4
                   clk4
                   nop
                   nop 
      endm 
                                                                             
;*************************************declar********************************
         cblock 0x0c
         PDel0:1
         PDel1:1
         PDel2:1 
         w_temp :1					;
         status_temp : 1	
         endc 

;***********************debut sur reset***************************************       
         org 0x00  
         goto init             
         
                    
;************************config interruptions********************************

ORG 	0x004				
	movwf	w_temp  			
	swapf	STATUS,w			
	movwf	status_temp 
        call intrb0
        bcf	INTCON,INTF
  restorereg
	swapf	status_temp,w		
	movwf   STATUS				
	swapf   w_temp,f			
                       			
	swapf   w_temp,w  			
	retfie  	
       
;***************************interruption pour pause******************
 intrb0
         
  star1 
        call tempo  
        btfsc PORTA,3
        goto star1
     
	return 
	


init
		
;*************************config interuptions********************************    
    				
    	clrf	EEADR				
    	bsf	STATUS,RP0			
    	movlw	OPTIONVAL			
    	movwf	OPTION_REG		
 
;*****************************configuration des ports***********************         
        bsf  STATUS,RP0       
        movlw b'01101'        
        movwf TRISA 
        movlw b'0000001'            
        movwf TRISB         
        bcf  STATUS,RP0      		
        movlw INTERMASK		
        movwf INTCON
        clrf PORTB            
        clrf PORTA   	
        goto debut

;******************************programme principal**************************         

debut 
         affff0
         afff0
         aff0
         af0

start0  
         call tempo   
         btfsc PORTA,3
         goto start0 
start    affff0
         call incf3
         affff1  
         call incf3
         affff2
         call incf3
         affff3
         call incf3
         affff4
         call incf3
         affff5
         call incf3
         affff6
         call incf3
         affff7
         call incf3
         affff8
         call incf3
         affff9
         call incf3
         affff0
         goto start 
   
;**************************tempo générée avec PDEL 1.0****************************
tempo       
;-------------------------------------------------------------
; Code generated by PDEL  ver 1.0  on 22/04/2009 at 19:36:42
; Description: Waits 99975 cycles
;-------------------------------------------------------------
PDelay  movlw     .142      ; 1 set number of repetitions (B)
        movwf     PDel0     ; 1 |
PLoop1  movlw     .175      ; 1 set number of repetitions (A)
        movwf     PDel1     ; 1 |
PLoop2  clrwdt              ; 1 clear watchdog
        decfsz    PDel1, 1  ; 1 + (1) is the time over? (A)
        goto      PLoop2    ; 2 no, loop
        decfsz    PDel0,  1 ; 1 + (1) is the time over? (B)
        goto      PLoop1    ; 2 no, loop
PDelL1  goto PDelL2         ; 2 cycles delay
PDelL2  
        return              ; 2+2 Done
;*******************************************************************************      
   
incf1    ; incrementation du premier afficheur
     af0
     call tempo
     af1
     call tempo
     af2
     call tempo
     af3
     call tempo
     af4
     call tempo
     af5
     call tempo
     af6 
     call tempo
     af7
     call tempo 
     af8 
     call tempo 
     af9
     call tempo
     af0
     return
incf2     ;incrementation des 2 premmiers afficheurs
     aff0
     call incf1
     aff1
     call incf1
     aff2
     call incf1
     aff3
     call incf1
     aff4
     call incf1
     aff5
     call incf1
     aff6
     call incf1
     aff7
     call incf1
     aff8
     call incf1
     aff9
     call incf1
     aff0
     return
incf3    ;incrementation des 3 premiers afficheurs 
     
     afff0
     call incf2
     afff1
     call incf2  
     afff2
     call incf2
     afff3
     call incf2
     afff4
     call incf2
     afff5
     call incf2
     afff0
     return  

END                           
