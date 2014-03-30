/*rexx*/
/*------------------------------------------------------------------------------------------------------------------------------------*/
/* This is an example of usage of a recursive procedure call to determine the factorial of a number entered by the user.              */
/*------------------------------------------------------------------------------------------------------------------------------------*/

say "Enter a number"
parse pull number
if datatype(number,'W') then                           /* check for whole numbers */
  say "Factorial of "number" is "factorial(number)
else
  say "Invalid number"
exit

factorial: procedure
parse arg element
say element
if element = 1 | element = 0 then 
   return(1)
else 
   return(element * factorial(element -1))
