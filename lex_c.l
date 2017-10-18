%{
    #include <stdio.h>
%}

/*
    Reconocedor LEXICOGRAFICO del lenguaje C.
    
    Objetivo: Realizar un programa que reconozca todos los 
    elementos léxicos de C, es decir, la gramática léxica de C.
    
    Realizado para la materia Sintaxis y Semántica de los Lenguajes - Universidad Tecnológica Nacional Facultad Regional Buenos Aires

    Autores:
        - Liloia Scott, Nicolás.
        - Masotta, Augusto.
        - Mendez Corridoni, Matías.
        
    Año 2017.
*/

DIGITO_DECIMAL                  [0-9]
DIGITO_DECIMAL_NO_NULO          [1-9]
DIGITO_HEXADECIMAL              [0-9a-fA-F]
DIGITO_OCTAL                    [0-7]
SUFIJO_UNSIGNED                 u|U
SUFIJO_LONG                     l|L
SUFIJO_ENTERO                   {SUFIJO_UNSIGNED}|{SUFIJO_LONG}|{SUFIJO_UNSIGNED}{SUFIJO_LONG}|{SUFIJO_LONG}{SUFIJO_UNSIGNED}
SUFIJO_REAL                     f|F|l|L
SIGNO                           \+|-
SECUENCIA_DE_ESCAPE_SIMPLE      \\\'|\\\"|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v
SECUENCIA_DE_ESCAPE_OCTAL       \\{DIGITO_OCTAL}|\\{DIGITO_OCTAL}{DIGITO_OCTAL}|\\{DIGITO_OCTAL}{DIGITO_OCTAL}{DIGITO_OCTAL}
SECUENCIA_DE_ESCAPE_HEXADECIMAL \\x{DIGITO_HEXADECIMAL}|\\x{DIGITO_HEXADECIMAL}{DIGITO_HEXADECIMAL}
SECUENCIA_DE_ESCAPE             {SECUENCIA_DE_ESCAPE_SIMPLE}|{SECUENCIA_DE_ESCAPE_OCTAL}|{SECUENCIA_DE_ESCAPE_HEXADECIMAL}
CARACTER_C                      [^\'\\]
CARACTER_S                      [^\"\\]|{SECUENCIA_DE_ESCAPE}
SECUENCIA_DE_CARACTERES_S       {CARACTER_S}+

%%
^(auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)$ printf("PALABRA RESERVADA\n");

^(\_|[a-zA-Z]){1}(\_|[a-zA-Z]|{DIGITO_DECIMAL})*$   printf("IDENTIFICADOR\n");

^(\_|[a-zA-Z]){1}$                                  printf("NO_DIGITO\n");

^[1-9]{1,5}$                                        printf("DIGITO NO CERO\n");

^[0-9]{1}$                                          printf("DIGITO\n");

^{DIGITO_DECIMAL_NO_NULO}{DIGITO_DECIMAL}*$         printf("CONSTANTE DECIMAL\n");

^0{DIGITO_OCTAL}+$                                  printf("CONSTANTE OCTAL\n");

^(0x|0X){DIGITO_HEXADECIMAL}+$                      printf("CONSTANTE HEX\n");

^({DIGITO_DECIMAL_NO_NULO}{DIGITO_DECIMAL}*|0{DIGITO_OCTAL}+|0x{DIGITO_HEXADECIMAL}+)$          printf("CONSTANTE INCOMPLETA\n");

^({DIGITO_DECIMAL_NO_NULO}{DIGITO_DECIMAL}*|0{DIGITO_OCTAL}+|0x{DIGITO_HEXADECIMAL}+){SUFIJO_ENTERO}$ printf("CONSTANTE COMPLETA\n");

^(({DIGITO_DECIMAL}*\.{DIGITO_DECIMAL}+|{DIGITO_DECIMAL}+\.)((e|E){SIGNO}?{DIGITO_DECIMAL}+)?|{DIGITO_DECIMAL}+(e|E){SIGNO}?{DIGITO_DECIMAL}+){SUFIJO_REAL}?$   printf("CONSTANTE REAL\n");

^{CARACTER_C}|{SECUENCIA_DE_ESCAPE}$                printf("CONSTANTE CARACTER\n");

^\"{SECUENCIA_DE_CARACTERES_S}\"$                   printf("CONSTANTE CADENA\n");

^(\[|\]|\(|\)|\{|\}|\.|"->"|"++"|"--"|\&|\*|\+|\-|\/|\%|"<<"|">>"|\<|\>|"<="|">="|"=="|"!="|\^|\||"&&"|"||"|\~|\!|\=|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|\\|\=|\?|\:|\;|"..."|\,|\#|"##")$   printf("OPERADOR\n");
%%