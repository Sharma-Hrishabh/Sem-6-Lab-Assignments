%{
#include <stdio.h>
%}

%%

int|float|auto|double|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|short {printf("%s is a keyword\n",yytext); fprintf(yyout,"%s is a keyword\n",yytext);}
^[a-z A-Z _][a-z A-Z 0-9 _]* {printf("Valid Identifier\n"); fprintf(yyout,"%s is a valid identifier\n",yytext);}
^[0-9][0-9]* {printf("Constant\n"); fprintf(yyout,"%s is a constant\n",yytext);}
[a-z A-Z]+ printf("Not a constant or a keyword\n");
^[^a-z A-Z _] printf("Invalid Identifier\n");


%%

int yywrap(){}

int main()
{
  extern FILE *yyin,*yyout;
  yyin = fopen("input1.txt","r");
  yyout = fopen("output.txt","w");
  yylex();
  return 0;
}
