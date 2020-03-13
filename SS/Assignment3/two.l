%{
   #include<stdio.h>
%}

%%
[a-z] {char c=yytext[0];c=((c-'a'+3)%26)+'a';fprintf(yyout,"%c",c);}
[A-Z] {char c=yytext[0];c=((c-'A'+3)%26)+'A';fprintf(yyout,"%c",c);}
. {fprintf("%c",yytext[0]);}


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