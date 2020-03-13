%{
#include <stdio.h>
%}

%%

[0][0-7]+ {printf("%s is a octal number",yytext);}
[0x|0X][A-F 0-9][A-F 0-9]* {printf("%s is a hexadecimal number",yytext);}

%%

int yywrap(){}

int main()
{
  extern FILE *yyin,*yyout;
  yyin = fopen("input2.txt","r");
  yyout = fopen("output.txt","w");
  yylex();
  return 0;
}
