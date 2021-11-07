%{
    #include <stdlib.h>
	#include <stdio.h>

%}

let [a-zA-Z]
digit [0-9]
del [ \t]

%%

{del}+

{let}({let}|{digit})* {printf("Token ID \n");}

{digit}+ {printf("Token IntLit \n");}

.  {printf("Error \n"); return 0;}

%%

int yywrap(void){}

int main(){
    printf("Enter the String \n");
    yylex();
    
    return 0;
}