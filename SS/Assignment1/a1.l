%{
#include<stdio.h>      
int vcount = 0;
int ccount=0; 
%} 
  
%% 
[AEIOU,aeiou] { vcount++;} 
.     {ccount++;} 
\n    {return 0;} 
%% 
  
int yywrap(){} 
int main(){ 
extern FILE *yyin, *yyout; 
yyin=fopen("input.txt","r"); 
yyout=fopen("output.txt","w");       
yylex();


printf("\nNumber of vowel letters " 
      "in the given input - %d\n", vcount); 


printf("\nNumber of consonant letters " 
      "in the given input - %d\n", ccount); 


return 0; 
} 