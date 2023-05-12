%{
#include<stdio.h>
int i;
float ca=0,cb=0;
%}
lang [a]*[b]*
%%
{lang} {
for(i=0;i<yyleng;i++)
  if(yytext[i]=='a')
    ca++;
  else if(yytext[i]=='b')
    cb++;
 
if(ca==cb)
  printf("\nCorrect Grammar");
else
  printf("\nIncorrect Grammar");
ca=cb=0;
}
.+ {printf("\nIncorrect Grammar");ca=cb=0;}
%%
void main()
{
yylex();
}
