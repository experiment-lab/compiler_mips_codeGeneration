# MANIT
# compiler lab CSE 315

# how to compile: 
> yacc -d lang.y
> lex lang.l
> gcc -ll lang.tab.c -o base

#run parser
> /base  {input filename} {output filename}
    or
> /base  {input filename}
