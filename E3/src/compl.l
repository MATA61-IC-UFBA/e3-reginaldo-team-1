%option noyywrap yylineno
%{

// noyywrap    - no need to deal with multiple input files
// yylineno    - variable to track line numbers 
//               that copies otherwise unmatched input to yyout.

#include "token.h"

%}

UNDERSCOR       "_"
COMENTARIO      "//".*
ESPACEJAMENTO   [ \n\t\r]
DIGITO          [0-9]
INTEIRO         ({DIGITO})+
LETRA           [a-zA-Z]
SIMBOLO         ("+"|"-"|"*"|"/"|"%"|"!"|"<"|">"|"="|":"|";"|","|"("|")"|"["|"]"|"{"|"}"|"\\")
CARACTERE       [']([^'\\\n]|\\(.|\n))[']
IDENTIFICADOR   {LETRA}+({LETRA}|{DIGITO}|{UNDERSCOR})*
STRING          ["]([^'\\\n]|\\(.|\n))*["]
        

%%

"array"                                            {return ARRAY;}
"boolean"                                          {return BOOLEAN;}
"char"                                             {return CARACTER;}
"else"                                             {return ELSE;}
"false"                                            {return FALSE;}
"for"                                              {return FOR;}
"function"                                         {return FUNCTION;}
"if"                                               {return IF;}
"integer"                                          {return INTEGER;}
"print"                                            {return PRINT;}
"return"                                           {return RETURN;}
"string"                                           {return STRING;}
"true"                                             {return TRUE;}
"void"                                             {return VOID;}
"while"                                            {return WHILE;} 
"<="                                               {return LTE;}
">="                                               {return GTE;}
"=="                                               {return EQU;}
"!="                                               {return NEQ;}
"&&"                                               {return AND;}
"||"                                               {return OR;}
{COMENTARIO}                                       {/* pula comentario */}
{ESPACEJAMENTO}                                    {/* pula espacejamento */}
{CARACTERE}                                        { return CHAR; }/*char: \t,\n, \0 ... etc */
{SIMBOLO}                                          { return yytext[0]; }
{STRING}                                           { return STR; }
{INTEIRO}                                          { return NUM; }
{IDENTIFICADOR}                                    { return ID; }
. 				                                   { return ERROR; }

%%