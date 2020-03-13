%{
#include<stdio.h>
%}

%%
(aa).*(bcd) {fprintf(yyout,"%s is a valid string\n",yytext);}
.* {fprintf(yyout,"%s is a invalid string\n",yytext);}

%%
int yywrap(){}
int main(){
extern FILE *yyin,*yyout;
yyin = fopen("input3.txt","r");
yyout = fopen("output.txt","w");
yylex();
return 0;
}