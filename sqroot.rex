/*rexx*/
say "Enter a number"
parse pull number
if number > 0 then
  say "Square root of "number" is "sqrroot(number)
else
  say "Invalid number "number
exit

sqrroot: procedure
  parse arg number
  return(sqrtiter(1,number))

sqrtiter: procedure
  parse arg guess,number
  if GoodEnough(guess,number) then 	
    return(guess)
  else
    return(sqrtiter(improve(guess,number),number))

GoodEnough: procedure
  parse arg guess,number
  if abs(square(guess)-number) > 0.001 then
    return(0)
  else
    return(1)

square: procedure
  parse arg elem
  return(elem * elem)

improve: procedure
  parse arg guess,number
  return(average(guess,number/guess))

average: procedure
  parse arg elem1,elem2
  return((elem1 + elem2)/2)
