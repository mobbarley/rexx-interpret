/*rexx*/
say "Enter a number"
parse pull number
expr = print(number)
interpret expr
exit

print:
parse arg arg1
expr = "say "arg1
return(expr)

