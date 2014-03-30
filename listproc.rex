/*rexx*/
parse arg filePath
address SYSTEM "freadv01 --path="filePath with output STEM fileStem.
if index(fileStem.1,'ERROR') > 0 then do 
  do i = 1 to fileStem.0
    say fileStem.i
  end
end
else do
  count = 1
  do i = 1 to fileStem.0
    if index(fileStem.i,' PROC(') > 0,
    |  index(fileStem.i,' PROC;') > 0,
    |  index(fileStem.i,' PROC ') > 0,
    |  index(fileStem.i,':PROC(') > 0,
    |  index(fileStem.i,':PROC;') > 0,
    |  index(fileStem.i,':PROC ') > 0 then do
      colonPos = index(fileStem.i),':')
      if colonPos > 0 then do
	procName.count = strip(substr(fileStem.i,1,colonPos-1))
	procStart.count = i
	count = count + 1
      end
    end
  end
  procName.0 = count - 1
  procStart.0 = count - 1
  procEnd.0 = 0
  do i = 1 to fileStem.0
    do j = 1 to procName.0
      needle = "END " || procName.j
      if index(fileStem,needle) > 0 then do 
	 procEnd.j = i
	 procEnd.0 = procEnd.0 + 1
  end
  do i = 1 to procName.0
    say procName.i procStart.i procEnd.i
  end
end