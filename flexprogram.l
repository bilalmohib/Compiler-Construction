%{
    #include <stdlib.h>
	#include <stdio.h>

%}

letter [a-zA-Z]
digit [0-9]
del [ \t]
singlelinecomment [//]
multi_start [/*]
multi_last [*/]

%%

{del}+

"int"|"float"|"double"|"char"|"string" {printf("<>DATATYPE, %s \n",yytext);}

"if"|"while"|"for"|"break"|"switch"|"case"|"main"|"cout" {printf("<KW, %s \n",yytext);}

"&"|"!"|"--"|"+"|"++"|"*"|"=="|"<="|"=>"|"<"|">"|"-" {printf("<OP, %s \n",yytext);}

","|"{"|"}"|"("|")"|"["|"]"|";"|"." {printf("<PUN, %s> \n",yytext);}

{letter}({letter}|{digit})* {printf("<ID, %s> \n",yytext);}

{digit}+ {printf("<IntegerLiteral, %s> \n",yytext);}

({multi_start}({letter}|{digit}){multi_last})  {printf("<Multi Comment, %s> \n",yytext);}

{singlelinecomment} {printf("<Single Comment, %s> \n",yytext);}

%%

int yywrap(void){}

int main(){
    printf("Enter the String \n");
    yylex();
    
    return 0;
}