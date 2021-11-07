%{
    #include <stdlib.h>
	#include <stdio.h>

%}

let [a-zA-Z]
digit [0-9]
del [ \t]
punctuation [,{}()[];.]
operator []

%%

{del}+

"int"|"float"|"double"|"char" {printf("<>DATATYPE, %s \n",yytext);}

"if"|"while"|"for"|"break"|"switch"|"case"|"main"|"cout" {printf("<KW, %s \n",yytext);}

"+"|"-" {printf("Operator: %s \n",yytext);}

{punctuation}+ {printf("<PUN, %s \n",yytext);}

{let}({let}|{digit})* {printf("Token ID: %s \n",yytext);}

{digit}+ {printf("Token IntLit: %s \n",yytext);}

.  {printf("Error \n"); return 0;}

%%

int yywrap(void){}

int main(){
    printf("Enter the String \n");
    yylex();
    
    return 0;
}