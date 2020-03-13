%{
        int isOpen=0;
%}

%%
"//" {isOpen=1; fprintf(yyout, "%s", yytext);}
[a-z] {
        char c=yytext[0];
        if(isOpen && 'a'<=c && c<='z')
                fprintf(yyout, "%c", c-=32);
        else
                fprintf(yyout, "%c", c);
}
\n {isOpen=0;fprintf(yyout, "%c", yytext[0]);}

. {fprintf(yyout, "%c", yytext[0]);}
%%

int yywrap(){}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("input1.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}