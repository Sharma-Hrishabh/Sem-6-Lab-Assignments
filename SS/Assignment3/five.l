%{
        int ob=0, cb=0;
        int flag=0;
%}

%%
"{" {
        ob++;
}

"}" {
        cb++;
        if(cb > ob){
                flag=1;
        }
}

. {}
%%

int yywrap(){}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("input5.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    printf("%d %d",cb, ob);
    fprintf(yyout, ((!flag && (ob==cb)) ? "YES" : "NO"));
    return 0;
}