%{
#include <stdio.h>
int cntchar=0,cntwords=0,cntSpaces=0,cntEnds=0,temp=0;
%}

%%

\n {cntEnds++;cntwords = cntwords+temp+1;temp=0;}
[ ] {cntSpaces++;temp++;}
. {cntchar++;fprintf(yyout,"%s",yytext);}	

%%

int yywrap(){};

int main()
{
  extern FILE *yyin, *yyout; 
  yyin=fopen("input.txt","r"); 
  yyout=fopen("output.txt","w");
  yylex();
  printf("\nThe number of characters = %d",cntchar);
  printf("\nThe number of words = %d",cntwords);
  printf("\nThe number of end of lines = %d",cntEnds);
  printf("\nThe number of spaces = %d",cntSpaces);
  return 0;
}	
