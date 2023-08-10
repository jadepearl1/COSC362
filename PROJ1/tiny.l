/*
    I pledge my Honor that I have not cheated, and will not cheat, on this assignment. Jade Pearl
*/

%option yylineno
%option noyywrap

%{
  #define DEBUG 1
  typedef YYTOKENTYPE Token;
  Token scanned(Token t);
%}

wspace	[ \t\r\n]

%%

if		{return scanned(IF);} 
else	{return scanned(ELSE);}
then	{return scanned(THEN);}
end		{return scanned(END);}
repeat	{return scanned(REPEAT);}
until	{return scanned(UNTIL);}
read	{return scanned(READ);}
write	{return scanned(WRITE);}
:=		{return scanned(ASSIGN);}
"="		{return scanned(EQ);}
"<"     {return scanned(LT);}
"+"    	{return scanned(PLUS);}
"-"		{return scanned(MINUS);}
"*"     {return scanned(TIMES);}
"/"     {return scanned(OVER);}
"("     {return scanned(LPAREN);}
")"     {return scanned(RPAREN);}
";"     {return scanned(SEMI);}
[0-9]+	{return scanned(NUM);}
[a-zA-Z][a-zA-Z0-9]*     	{return scanned(ID);}
{wspace}   ;
<<EOF>>    {return scanned(ENDFILE);}
.          {return scanned(ERROR);}
%%

/* process and return scanned token t */
Token scanned(Token t) {
  if(DEBUG==0) return t;
  switch(t) {
    case IF: printf("IF "); return t;
    case THEN: printf("THEN\n"); return t;
    case ELSE: printf("ELSE "); return t;
    case END: printf("\nEND "); return t;
    case REPEAT: printf("REPEAT\n"); return t;
    case UNTIL: printf("\nUNTIL "); return t;
    case READ: printf("READ "); return t;
    case WRITE: printf("WRITE "); return t;
    case ID: printf("ID(%s) ", yytext); return t;
    case NUM: printf("NUM(%s) ", yytext); return t;
    case ASSIGN: printf("ASSIGN "); return t;
    case EQ: printf("EQ "); return t;
    case LT: printf("LT "); return t;
    case PLUS: printf("PLUS "); return t;
    case MINUS: printf("MINUS "); return t;
    case TIMES: printf("TIMES "); return t;
    case OVER: printf("OVER" ); return t;
    case LPAREN: printf("LPAREN "); return t;
    case RPAREN: printf("RPAREN "); return t;
    case SEMI: printf("SEMI\n"); return t;
    case ENDFILE: printf("ENDFILE\n"); return t;
    default: printf("ERROR: invalid token in scanned().\n"); exit(-1);
  }
}