%%
%line
%column
%unicode
%standalone
%public
%class Lexer

letter = [A-Z|a-z]
alphanumeric = {letter}|{digit}
integer = [1-9]{digit}+|{digit}
digit = [0-9]
float = {integer}"."{digit}+
comment = "/*" [^*] ~"*/"
whitespace = [ \n\t]
identifier = ( _|{letter})( _|{alphanumeric})*


%%


";"|"."|"="|"("|")"|"{"|"}"|"["|"]" 
	{ System.out.println("Token " + yytext()); }
"||"| "&&"| "=="| "!="|"<"| "<="|">"| ">="|"+"|"-"|"*"|"/"|"%"| "!" 
	{ System.out.println("Token " + yytext()); }
"class"| "public"| "extends"| "static"| "void"| "int"| "boolean"| 
"while"| "if"| "else"| "return"| "false"| "true"| "this"| "new" 
	{ System.out.println("Token "+yytext().toString()); }
{identifier}    { System.out.println("Token "+yytext()); }
{integer}       { System.out.println("Token "+yytext()); }
{float}		{ System.out.println("Token "+ yytext()); }
{whitespace}    {  }
{comment}	{  }
"//"            { System.out.println("Illegal Token '" + yytext() +
                    "' line: " + yyline + ", column: " + yycolumn); }