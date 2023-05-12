%option noyywrap
%{ 
#include <stdio.h> 
#define YYSTYPE double
#include "y.tab.h" 
extern double yylval;
%}
number	[0-9]+\.?|[0-9]*\.[0-9]+
%% 
[ ]		{ /* skip blanks */ }
{number}	{ yylval = atof(yytext);
		  return NUMBER;}
\n|.		{ return yytext[0]; }

