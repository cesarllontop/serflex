
PROCEDURE ImprFileText
   LPARAMETERS wFileText, wDestino, WNAMEPRINTER


 
   IF !FILE(wFileText)
      MESSAGEBOX("No existe el archivo de texto: " + wFileText, 16, "Atencion")
      RETURN .F.
   ENDIF

   IF PCOUNT() = 3
      WNAMEPRINTER = IIF(EMPTY(WNAMEPRINTER), "", ALLTRIM(WNAMEPRINTER))
   ELSE
      WNAMEPRINTER = ""
   ENDIF
   
  DO CASE
      CASE wDestino = 1                  && Vista Previa
         DO FORM frmwebbrow WITH wFileText
         *DO FORM frmverarchivotexto WITH wFileText

      CASE wDestino = 2                  && Imprimir

         IF EMPTY(WNAMEPRINTER)          && Pedir impresora

            *-- Aqui creamos un array con las impresoras instaladas
            nprinters = APRINTER(amiinstallprinters)
            *-- Solicitamos al usuario la impresora a imprimir
            cprintersel = GETPRINTER()
            *-- verificamos si selecciono una impresora
            IF EMPTY(cprintersel)
               RETURN .F.
            ENDIF
            *-- ahora buscamos dicho nombre de impresora dentro del array
            cnameprinter = ""
            cportprinter = ""
            FOR rgprinters = 1 TO nprinters
               IF UPPER(ALLTRIM(cprintersel)) == UPPER(ALLTRIM(amiinstallprinters(rgprinters,1)))
                  cnameprinter = amiinstallprinters(rgprinters,1) && el nombre
                  cportprinter = amiinstallprinters(rgprinters,2) && el puerto
                  EXIT
               ENDIF
            ENDFOR

			
            IF '\\' $ cnameprinter         && impresora de red
               RUN /7 TYPE &wFileText > &cnameprinter
            ELSE                           && impresora local
               RUN /7 TYPE &wFileText > &cportprinter
            ENDIF

         ELSE
            cportprinter = ALLTRIM(WNAMEPRINTER)
            RUN /7 TYPE &wFileText > &cportprinter
         ENDIF
   ENDCASE

   * por mientras erase (wFileText)

   RETURN




FUNCTION fPrintCodes
   LPARAMETERS vtipoletra, vnnropag, vlcondensado, vnmargenizq
   * FUNCION Q ENVIA CODIGOS DE CONTROL A LA IMPRESORA

   @ 0, 0 SAY CHR(27) + "@"                    && Initialize printer

   DO CASE
      CASE vtipoletra =1
         @ 0, 0 SAY CHR(27) + "k" + CHR(0)   && Select NLQ Roman font
      CASE vtipoletra =2
         @ 0, 0 SAY CHR(27) + "k" + CHR(1)   && Select NLQ Sans Serif font
      CASE vtipoletra =3
         @ 0, 0 SAY CHR(27) + "x" + CHR(1)   && Select NLQ mode
      OTHERWISE
         @ 0, 0 SAY CHR(27) + "x" + CHR(0)   && Select draft mode
   ENDCASE

   IF EMPTY(vnnropag)
      vnnropag = 66
   ENDIF

   @ 0, 0 SAY CHR(27) + "C" + CHR(vnnropag)    && Numero de lineas por pagina

   IF EMPTY(vlcondensado)
   
      @ 0,0 SAY CHR(18)
   ELSE
      @ 0,0 SAY CHR(15)
   ENDIF

   IF !EMPTY(vnmargenizq)
      @ 0, 0 SAY CHR(27) + "l" + CHR(vnmargenizq) && Margen Izquierdo
   ENDIF

   RETURN

PROCEDURE pEtiqueta_TSC_49_1
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT,W817PETI
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
loFile = loScript.CreateTextFile(_lsArchivo_nombre, .T.)
FOR x= 1 TO CEILING(W817ETIQ/WCOLUM)
	loFile.WriteLine('SIZE 49.1 mm, '+IIF(WCOLUM=2,'78.1 mm ','39 mm '))
	loFile.WriteLine('GAP 3 mm, 0 mm')
	loFile.WriteLine('DIRECTION 0')
	loFile.WriteLine('CLS')
	loFile.WriteLine('TEXT 196,32,"ROMAN.TTF",0,1,12,2,"'+W817CSKU+'"')
	loFile.WriteLine('BARCODE 45,67,"128M",60,0,0,3,6,"!105'+W817CUPC+'"')
	loFile.WriteLine('TEXT 196,134,"ROMAN.TTF",0,1,12,2,"'+W817CUPC+'"')
	loFile.WriteLine('TEXT 196,172,"0",0,8,10,2,"'+W817DEIN+'"')	
	loFile.WriteLine('TEXT 196,205,"ROMAN.TTF",0,1,9,2,"'+W817NBCO+'"')
	loFile.WriteLine('TEXT 196,233,"ROMAN.TTF",0,1,10,2,"Size:'+W817NMCT+'"')
	loFile.WriteLine('TEXT 196,265,"ROMAN.TTF",0,1,11,2,"$'+W817PETI+'"')
	**2da Columna
	IF WCOLUM=2
		loFile.WriteLine('TEXT 196,338,"ROMAN.TTF",0,1,12,2,"'+W817CSKU+'"')
		loFile.WriteLine('BARCODE 45,373,"128M",60,0,0,3,6,"!105'+W817CUPC+'"')
		loFile.WriteLine('TEXT 196,440,"ROMAN.TTF",0,1,12,2,"'+W817CUPC+'"')
		loFile.WriteLine('TEXT 196,478,"0",0,8,10,2,"'+W817DEIN+'"')	
		loFile.WriteLine('TEXT 196,511,"ROMAN.TTF",0,1,9,2,"'+W817NBCO+'"')
		loFile.WriteLine('TEXT 196,539,"ROMAN.TTF",0,1,10,2,"Size:'+W817NMCT+'"')
		loFile.WriteLine('TEXT 196,571,"ROMAN.TTF",0,1,11,2,"$'+W817PETI+'"')
	ENDIF
	loFile.WriteLine('PRINT 1, 1')
ENDFOR
RETURN


PROCEDURE pEtiqueta_TSC_49_2
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
loFile = loScript.CreateTextFile(_lsArchivo_nombre, .T.)
FOR x= 1 TO CEILING(W817ETIQ/WCOLUM)
	loFile.WriteLine('SIZE '+IIF(WCOLUM=2,'812','406')+' dot, 203 dot')
	loFile.WriteLine('GAP 3 mm, 0 mm')
	loFile.WriteLine('DIRECTION 0')
	loFile.WriteLine('CLS')
	loFile.WriteLine('TEXT 203,12,"ROMAN.TTF",0,1,12,2,"'+W817CSKU+'"')
	loFile.WriteLine('BARCODE 203,52,"128M",54,0,0,2,4,2,"!105'+W817CUPC+'"')
	loFile.WriteLine('TEXT 203,112,"ROMAN.TTF",0,1,7,2,"'+W817CUPC+'"')
	loFile.WriteLine('TEXT 31,136,"ROMAN.TTF",0,1,7,"'+W817DEIN+'"')	
	loFile.WriteLine('TEXT 31,158,"ROMAN.TTF",0,1,7,"'+W817NBCO+'"')
	loFile.WriteLine('TEXT 352,159,"ROMAN.TTF",0,1,7,"'+W817NMCT+'"')
	**2da Columna
	IF WCOLUM=2
		loFile.WriteLine('TEXT 609,12,"ROMAN.TTF",0,1,12,2,"'+W817CSKU+'"')
		loFile.WriteLine('BARCODE 609,52,"128M",54,0,0,2,4,2,"!105'+W817CUPC+'"')
		loFile.WriteLine('TEXT 609,112,"ROMAN.TTF",0,1,7,2,"'+W817CUPC+'"')
		loFile.WriteLine('TEXT 430,136,"ROMAN.TTF",0,1,7,"'+W817DEIN+'"')	
		loFile.WriteLine('TEXT 430,158,"ROMAN.TTF",0,1,7,"'+W817NBCO+'"')
		loFile.WriteLine('TEXT 752,159,"ROMAN.TTF",0,1,7,"'+W817NMCT+'"')
	ENDIF
	loFile.WriteLine('PRINT 1, 1')
ENDFOR
RETURN

PROCEDURE pEtiqueta_TSC_63_1
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
loFile = loScript.CreateTextFile(_lsArchivo_nombre, .T.)
FOR x= 1 TO CEILING(W817ETIQ/WCOLUM)
	loFile.WriteLine('SIZE ' +IIF(WCOLUM=2,'812','406')+' dot, 203 dot')
	loFile.WriteLine('GAP 3 mm, 0 mm')
	loFile.WriteLine('DIRECTION 0')
	loFile.WriteLine('CLS')
	loFile.WriteLine('TEXT 203, 16, "ROMAN.TTF", 0, 12, 12, 2, "'+W817DEIN+'"')
	loFile.WriteLine('TEXT 203, 48, "ROMAN.TTF", 0, 12, 12, 2, "'+W817NBCO+'"')
	loFile.WriteLine('TEXT 203, 76, "ROMAN.TTF", 0, 10, 10, 2, "'+W817ITCL+'-'+W817NMCT+'"')
	loFile.WriteLine('BARCODE 203, 102, "EAN13", 66, 0, 0, 3, 6, 2, "'+W817CUPC+'"')
	*2da Columna
	IF WCOLUM=2
		loFile.WriteLine('TEXT 609, 16, "ROMAN.TTF", 0, 12, 12, 2, "'+W817DEIN+'"')
		loFile.WriteLine('TEXT 609, 48, "ROMAN.TTF", 0, 12, 12, 2, "'+W817NBCO+'"')
		loFile.WriteLine('TEXT 609, 76, "ROMAN.TTF", 0, 10, 10, 2, "'+W817ITCL+'-'+W817NMCT+'"')
		loFile.WriteLine('BARCODE 609, 106, "EAN13", 66, 0, 0, 3, 6, 2, "'+W817CUPC+'"')
	ENDIF
	loFile.WriteLine('PRINT 1, 1')
ENDFOR
RETURN

PROCEDURE pEtiqueta_Zebra_49_1
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT,W817PETI
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
loFile = loScript.CreateTextFile(_lsArchivo_nombre, .T.)
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("~TA000")		&& ajuste tear off
	loFile.WriteLine("~JSN")		&& change backfeed sequence N
	loFile.WriteLine("^LT0")		&& label top
	loFile.WriteLine("^MNW")		&& media tracking
	loFile.WriteLine("^PON")		&& print orientation
	loFile.WriteLine("^PMN")		&& print mirror
	loFile.WriteLine("^LH0,0")		&& label home
	loFile.WriteLine("~JMA")		&& set print density
	loFile.WriteLine("^PR8,8")		&& print speed
	loFile.WriteLine("~SD15")		&& set darkness
	loFile.WriteLine("^JUS")		&& configuration update save
	loFile.WriteLine("^LRN")		&& label reverse print N
	loFile.WriteLine("^C127")		&& change encoding 27
	loFile.WriteLine("^PA0,1,1,0")	&& property advanced text
	loFile.WriteLine("^XZ")			&& fin formato
FOR x=1 TO CEIL(W817ETIQ/WCOLUM)
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("^MMT")		&& print mode thermal
	loFile.WriteLine("^PW"+IIF(WCOLUM=2,"624","312"))
	loFile.WriteLine("^LL406")  
	loFile.WriteLine("^LS0")
	loFile.WriteLine("^FWB")
	loFile.WriteLine("^CF0,30,30")
	loFile.WriteLine("^FO20,20")		
	loFile.WriteLine("^FB386,1,0,C,0^FD"+W817CSKU+"\&^FS")
	loFile.WriteLine("^BY3,2,70^FT120,370^BCB,,Y,N^FD>;"+W817CUPC+"^FS")
	loFile.WriteLine("^CF0,25,25")
	loFile.WriteLine("^FO170,20")		
	loFile.WriteLine("^FB386,1,0,C,0^FD"+W817DEIN+"\&^FS")
	loFile.WriteLine("^FO195,20")
	loFile.WriteLine("^FB386,1,0,C,0^FD"+W817NBCO+"\&^FS")
	loFile.WriteLine("^FO220,20")
	loFile.WriteLine("^FB386,1,0,C,0^FD"+W817NMCT+"\&^FS")
	loFile.WriteLine("^FO265,20")
	loFile.WriteLine("^FB386,1,0,C,0^FD$"+W817PETI+"\&^FS")
	*2da columna
	IF wcolum=2
		loFile.WriteLine("^CF0,30,30")
		loFile.WriteLine("^FO330,20")		
		loFile.WriteLine("^FB386,1,0,C,0^FD"+W817CSKU+"\&^FS")
		loFile.WriteLine("^BY3,2,70^FT430,370^BCB,,Y,N^FD>;"+W817CUPC+"^FS")
		loFile.WriteLine("^CF0,25,25")
		loFile.WriteLine("^FO480,20")		
		loFile.WriteLine("^FB386,1,0,C,0^FD"+W817DEIN+"\&^FS")
		loFile.WriteLine("^FO505,20")
		loFile.WriteLine("^FB386,1,0,C,0^FD"+W817NBCO+"\&^FS")
		loFile.WriteLine("^FO530,20")
		loFile.WriteLine("^FB386,1,0,C,0^FDSize:"+W817NMCT+"\&^FS")
		loFile.WriteLine("^FO575,20")
		loFile.WriteLine("^FB386,1,0,C,0^FD$"+W817PETI+"\&^FS")
	ENDIF
	loFile.WriteLine("^PQ1,0,1,Y")
	loFile.WriteLine("^XZ")
ENDFOR
RETURN

PROCEDURE pEtiqueta_Zebra_49_2
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
loFile = loScript.CreateTextFile(_lsArchivo_nombre, .T.)
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("~TA000")		&& ajuste tear off
	loFile.WriteLine("~JSN")		&& change backfeed sequence N
	loFile.WriteLine("^LT0")		&& label top
	loFile.WriteLine("^MNW")		&& media tracking
	loFile.WriteLine("^PON")		&& print orientation
	loFile.WriteLine("^PMN")		&& print mirror
	loFile.WriteLine("^LH0,0")		&& label home
	loFile.WriteLine("~JMA")		&& set print density
	loFile.WriteLine("^PR8,8")		&& print speed
	loFile.WriteLine("~SD15")		&& set darkness
	loFile.WriteLine("^JUS")		&& configuration update save
	loFile.WriteLine("^LRN")		&& label reverse print N
	loFile.WriteLine("^C127")		&& change encoding 27
	loFile.WriteLine("^PA0,1,1,0")	&& property advanced text
	loFile.WriteLine("^XZ")			&& fin formato
FOR x=1 TO CEIL(W817ETIQ/WCOLUM)
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("^MMT")		&& print mode thermal
	loFile.WriteLine("^PW"+IIF(WCOLUM=2,"812","406"))		&& printer width dots  
	loFile.WriteLine("^LL203")		&& lenght label dots
	loFile.WriteLine("^LS0")		&& label shift
	loFile.WriteLine("^CF0,25,25")	&& change font 0, alto y ancho de letras
	loFile.WriteLine("^FO20,20")		&& coordenadas x,y 
	loFile.WriteLine("^FB366,1,0,C,0^FD"+W817CSKU+"\&^FS") && imprime block ancho max, lineas, espacio entre lineas, C centrado
	loFile.WriteLine("^BY2,2,60^FT100,110^BCN,,Y,N^FD>;"+W817CUPC+"^FS") &&cod bar 128 grosor de linea, ratio, altura, pos x pos y
	loFile.WriteLine("^CF0,20,20")	&& change font 0, alto y ancho de letras					
	loFile.WriteLine("^FO20,140")
	loFile.WriteLine("^FB366,1,0,L,0^FD"+W817DEIN+"\&^FS")
	loFile.WriteLine("^FO20,170")
	loFile.WriteLine("^FB366,1,0,L,0^FD"+W817NBCO+"\&^FS")
	loFile.WriteLine("^FO300,170")
	loFile.WriteLine("^FB66,1,0,R,0^FD"+W817NMCT+"\&^FS")
	IF wcolum=2
		loFile.WriteLine("^CF0,25,25")
		loFile.WriteLine("^FO426,20")		&& coordenadas x,y 
		loFile.WriteLine("^FB366,1,0,C,0^FD"+W817CSKU+"\&^FS") && imprime block ancho max, lineas, espacio entre lineas, C centrado
		loFile.WriteLine("^BY2,2,60^FT506,110^BCN,,Y,N^FD>;"+W817CUPC+"^FS") &&cod bar 128 grosor de linea, ratio, altura, pos x pos y
		loFile.WriteLine("^CF0,20,20")
		loFile.WriteLine("^FO426,140")
		loFile.WriteLine("^FB366,1,0,L,0^FD"+W817DEIN+"\&^FS")
		loFile.WriteLine("^FO426,170")
		loFile.WriteLine("^FB366,1,0,L,0^FD"+W817NBCO+"\&^FS")
		loFile.WriteLine("^FO706,170")
		loFile.WriteLine("^FB66,1,0,R,0^FD"+W817NMCT+"\&^FS")
	ENDIF
	loFile.WriteLine("^XZ")
ENDFOR
RETURN

PROCEDURE pEtiqueta_Zebra_63_1
LPARAMETERS WCOLUM,W817ETIQ,W817CSKU,W817CUPC,W817DEIN,W817NBCO,W817NMCT
_lsArchivo_nombre="c:\reportessga\etiqueta.txt"
loScript = Createobject("Scripting.FileSystemObject")
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("~TA000")		&& ajuste tear off
	loFile.WriteLine("~JSN")		&& change backfeed sequence N
	loFile.WriteLine("^LT0")		&& label top
	loFile.WriteLine("^MNW")		&& media tracking
	loFile.WriteLine("^PON")		&& print orientation
	loFile.WriteLine("^PMN")		&& print mirror
	loFile.WriteLine("^LH0,0")		&& label home
	loFile.WriteLine("~JMA")		&& set print density
	loFile.WriteLine("^PR8,8")		&& print speed
	loFile.WriteLine("~SD15")		&& set darkness
	loFile.WriteLine("^JUS")		&& configuration update save
	loFile.WriteLine("^LRN")		&& label reverse print N
	loFile.WriteLine("^C127")		&& change encoding 27
	loFile.WriteLine("^PA0,1,1,0")	&& property advanced text
	loFile.WriteLine("^XZ")			&& fin formato
FOR x=1 TO CEIL(W817ETIQ/WCOLUM)
	loFile.WriteLine("^XA")			&& inicio formato
	loFile.WriteLine("^MMT")		&& print mode thermal
	loFile.WriteLine("^PW"+IIF(WCOLUM=2,"812","406"))		&& printer width dots  
	loFile.WriteLine("^LL203")		&& lenght label dots
	loFile.WriteLine("^LS0")		&& label shift
	loFile.WriteLine("^CF0,25,25")	&& change font 0, alto y ancho de letras
	loFile.WriteLine("^FO0,20")		&& coordenadas x,y 
	loFile.WriteLine("^FB406,1,0,C,0^FD"+W817DEIN+"\&^FS") && imprime block ancho max, lineas, espacio entre lineas, C centrado
	loFile.WriteLine("^FO0,50")
	loFile.WriteLine("^FB406,1,0,C,0^FD"+W817NBCO+"\&^FS")
	loFile.WriteLine("^FO0,80")
	loFile.WriteLine("^FB406,1,0,C,0^FD"+W817ITCL+"-"+W817NMCT+"\&^FS")
	loFile.WriteLine("^BY3,2,50^FT60,160^BEN,,Y,N^FD"+W817CUPC+"^FS") &&cod bar ean13 grosor de linea, ratio, altura, pos x pos y
	IF WCOLUM=2
		loFile.WriteLine("^FO406,20")
		loFile.WriteLine("^FB406,1,0,C,0^FD"+W817DEIN+"\&^FS")
		loFile.WriteLine("^FO406,50")
		loFile.WriteLine("^FB406,1,0,C,0^FD"+W817NBCO+"\&^FS")
		loFile.WriteLine("^FO406,80")
		loFile.WriteLine("^FB406,1,0,C,0^FD"+W817ITCL+"-"+W817NMCT+"\&^FS")
		loFile.WriteLine("^BY3,2,50^FT466,160^BEN,,Y,N^FD"+W817CUPC+"^FS")
	ENDIF
	loFile.WriteLine("^XZ")
ENDFOR
RETURN
