/*rexx*/
parse arg fileInfo

/*----------------------------------------------------------------*/
/* Initialize variables                                           */
/*----------------------------------------------------------------*/
fileInfoString = fileInfo
filePath = ''
delimiter = '/'

/*----------------------------------------------------------------*/
/* Separate file name & path from the file information passed     */
/*----------------------------------------------------------------*/
do while(fileInfoString <> '')
  parse value fileInfoString with filePathElement (delimiter) fileInfoString
end
filename = filePathElement
filePath = substr(fileInfo,1,index(fileInfo,filename) - 2)
say "Reading from" filename "via path" filePath

lineNum = 0
lines.0 = 0
address SYSTEM "cat "fileInfo with output stem fileStem.
if RC == 0 then do
  do i = 1 to fileStem.0
    say "Line #"i "is" fileStem.i
  end
end
else call FileError filename,filePath,'OPEN/READ' 
exit


/*----------------------------------------------------------------*/
/* Display file handling errors to user                           */
/*----------------------------------------------------------------*/
FileError: procedure
parse arg filename,filePath,errorType

select
  when errorType == 'NOTREADY' then
    say "File" filename "in path" filePath " is not ready"
  when errorType == 'OPEN/READ' then
    say "Error opening file" filename "from path" filePath ".Check if file exists"
  otherwise 
    say "Error handling file" filename "from path" filePath
end
return
