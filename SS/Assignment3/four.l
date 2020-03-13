%{
#include<stdio.h>
%}

%%
([0-9]+).([0-9]+) {fprintf(yyout,"typefloat\n");}
[0-9]+ {fprintf(yyout,"typeint\n");}
[a-zA-Z]{1} {fprintf(yyout,"typechar\n");}
[a-zA-Z]+ {fprintf(yyout,"typestringdatatype\n");}
. {fprintf(yyout,"Invalid token\n");}

%%
int yywrap(){}
int main(){
    extern FILE *yyin,*yyout;
    yyin = fopen("input4.txt","r");
    yyout = fopen("output.txt","w");
    yylex();
    return 0;
}

