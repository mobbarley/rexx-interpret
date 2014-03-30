/*rexx*/
parse arg filename
if STREAM(filename,'C',"OPEN READ") == "READY:" then
  do while lines(filename) > 0
    line = linein(filename)
    if line == NULL then leave
    else say line
  end
call STREAM filename, 'C', "CLOSE"
 