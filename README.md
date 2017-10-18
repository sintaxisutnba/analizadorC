# Analizador Lexicográfico para C

Este es un Analizador Lexicográfico para el lenguaje [C](https://es.wikipedia.org/wiki/C_(lenguaje_de_programaci%C3%B3n)) relizado con [LEX](https://es.wikipedia.org/wiki/Lex_(inform%C3%A1tica)).

Los comandos a ejecutar para poder tener el analizador están en comandos.txt

## Modo de Uso
### Descripción de archivos incluidos

Archivo | Descripción
------------ | -------------
comandos.txt   |   Archivo de comandos para compilar el analizador.
analizadorC  | Ejecutable del analizador ya compilado. Se puede ejecutar de la siguiente forma: ./analizadorC
lex_c.l    |   Contiene las definiciones LEXICAS de C.
    
> Nota: El archivo lex.yy.c es el archivo que genera LEX al compilar.

### ¿Cómo usar el Analizador?

Para poder usar el analizador se debe ejecutar el archivo binario (en el caso de los archivos incluidos: _analizadorC_), luego comenzar a escribir declaraciones de C en la consola. En caso que lo escrito sea un elemento léxico de C, el analizador mostrará en pantalla el tipo de elemento, de lo contrario se mostrará lo escrito.

## Créditos
Realizado para la materia Sintaxis y Semántica de los Lenguajes - [Universidad Tecnológica Nacional Facultad Regional Buenos Aires](http://www.frba.utn.edu.ar)

**Autores:**
- Liloia Scott, Nicolás.
- Masotta, Augusto.
- [Mendez Corridoni, Matías](https://github.com/CorridoniMatias).
    
Año 2017.

## Licencia

**Este código está disponible a la comunidad bajo la licencia GNU General Public License V3**

>This program is free software: you can redistribute it and/or modify
>it under the terms of the GNU General Public License as published by
>the Free Software Foundation, either version 3 of the License, or
>(at your option) any later version.
>
>This program is distributed in the hope that it will be useful,
>but WITHOUT ANY WARRANTY; without even the implied warranty of
>MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>GNU General Public License for more details.
>
>You should have received a copy of the GNU General Public License
>along with this program.  If not, see <http://www.gnu.org/licenses/>.
