/*rexx*/
/* This program takes in two numbers and displays the sum of squares of the larger two*/
say "Enter number #1"
parse pull num1
say "Enter number #2"
parse pull num2
say "Enter number #3"
parse pull num3
Say "The sum of squares of the larger two numbers is "SumOfSquares(num1,num2,num3)
exit

minimum: procedure
  parse arg num1,num2
  if num1 < num2 then return(num1) 
  else return(num2)

Square: procedure
  parse arg elem
  return(elem * elem)

SumOfSquares: procedure
  parse arg num1,num2,num3
  min3 = minimum(minimum(num1,num2),minimum(num1,num3))
  select
    when min3 = num1 then return(Square(num2)+Square(num3))
    when min3 = num2 then return(Square(num1)+Square(num3))
    when min3 = num3 then return(Square(num1)+Square(num2))
    otherwise nop
  end