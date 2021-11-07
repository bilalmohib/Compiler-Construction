%{
    #include <stdlib.h>
	#include <stdio.h>

%}

letter [a-zA-Z]
digit [0-9]
del [ \t]
punctuation [,{}()[];.]
singlelinecomment [//]
multi_start [/*]
multi_last [*/]

%%

{del}+

"int"|"float"|"double"|"char" {printf("<>DATATYPE, %s \n",yytext);}

"if"|"while"|"for"|"break"|"switch"|"case"|"main"|"cout" {printf("<KW, %s \n",yytext);}

"&"|"!"|"--"|"+"|"++"|"*"|"=="|"<="|"=>"|"<"|">"|"-" {printf("<OP, %s \n",yytext);}

{punctuation}+ {printf("<PUN, %s \n",yytext);}

{letter}({letter}|{digit})* {printf("Token ID: %s \n",yytext);}

{digit}+ {printf("Token IntLit: %s \n",yytext);}

{singlelinecomment}({multi_start}({letter}|{digit}){multi_last})  {printf("<Comment, %s \n",yytext);}

%%

int yywrap(void){}

int main(){
    printf("Enter the String \n");
    yylex();
    
    return 0;
}