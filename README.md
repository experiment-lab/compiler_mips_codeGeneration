# MANIT
# compiler lab CSE 315

# how to compile: 
> yacc -d lang.y <br />
> lex lang.l    <br />
> gcc -ll lang.tab.c -o base

#run parser
> /base  {input filename} {output filename}<br />
    or<br />
> /base  {input filename}
