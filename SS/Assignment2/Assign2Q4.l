%{
#include <stdio.h>
int cntcomm=0;
%}

%%

[/*][a-z A-Z 0-9 _ \n]+[*/] {cntcomm++;fprintf(yyout,"%s\n",yytext);}
[//][a-z A-Z 0-9 _]+ {cntcomm++;fprintf(yyout,"%s\n",yytext);}

%%

int yywrap(){}

int main()
{
  extern FILE *yyin,*yyout;
  yyin = fopen("input4.txt","r");
  yyout = fopen("output.txt","w");
  yylex();
  printf("No. of comments = %d\n",cntcomm);
  return 0;
}
