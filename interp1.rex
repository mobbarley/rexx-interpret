/*rexx*/
say "Enter first number"
parse pull num1
say "Enter second number"
parse pull num2
say "Enter operator"
parse pull operator
expr = num1 || operator || num2
expr = "say " || expr
interpret expr
exit
