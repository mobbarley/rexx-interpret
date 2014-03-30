/*rexx*/
if address() = 'SYSTEM' then
  do
    x=outtrap(output.)
    "ls -l"
    x=outtrap(OFF)
  end
else
  say "Invalid adress to run ls command"
do i = 1 to output.0 by 1
  say output.i
end



