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
CARACTERE       [']([^'\\\n]|\\(.|\n))[']/*Não foi preciso definir um retorno para isto no exercicio e3*/
IDENTIFICADOR   {LETRA}+({LETRA}|{DIGITO}|{UNDERSCOR})*
STRING          ["]([^'\\\n]|\\(.|\n))*["]
        

%%
{COMENTARIO}                                       {/* pula comentario */}
{ESPACEJAMENTO}                                    {/* pula espacejamento */}
{STRING}                                           { return STR; }
"array"                                            {return ARRAY;}
"boolean"                                          {return BOOLEAN;}
"char"                                             {return CHAR;}
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
{SIMBOLO}                                          { return yytext[0]; }/*substituir este*/
"<="                                               {return LTE;}
">="                                               {return GTE;}
"=="                                               {return EQU;}
"!="                                               {return NEQ;}
"&&"                                               {return AND;}
"||"                                               {return OR;}
{INTEIRO}                                          { return NUM; }
{IDENTIFICADOR}                                    { return ID; }
. 				                                   { return ERROR; }
%%