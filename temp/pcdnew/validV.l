%{
  #include "y.tab.h"
%}
%%
[_a-zA-Z]+ return letter;c
[0-9]+ return digit;
\n return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}