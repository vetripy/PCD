%{
#include <stdio.h>
int digi_count,char_count,vowel_count;
%}
%%
[0-9] {digi_count++;}
[aeiouAEIOU] {vowel_count++;char_count++;}
[a-zA-Z] {char_count++;}
[\n] {printf("%d %d %d",digi_count,char_count,vowel_count);}
%%

int main(){
    yylex();

    return 0;

}

int yywrap()
{return 1;}
