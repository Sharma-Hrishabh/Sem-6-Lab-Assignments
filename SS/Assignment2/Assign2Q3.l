%{
#include <stdio.h>
int cntneg=0,cntpos=0,cntzero=0;
%}

%%

[-]([0-9]+)[.]([0-9]+) {cntneg++;fprintf(yyout,"%s is a negative number\n",yytext);}
([0]+)[.]([0]+) {cntzero++;fprintf(yyout,"%s is zero\n",yytext);}
([0-9]+)[.]([0-9]+) {cntpos++;fprintf(yyout,"%s is a positive number\n",yytext);}

%%

int yywrap(){}

int main()
{
  extern FILE *yyin,*yyout;
  yyin = fopen("input3.txt","r");
  yyout = fopen("output.txt","w");
  yylex();
  printf("The number of positive numbers = %d\n",cntpos);
  printf("The number of negative numbers = %d\n",cntneg);
  printf("The number of zero numbers = %d\n",cntzero);
  return 0;
}
