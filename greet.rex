/*rexx*/
say "Hello "userid()
say time('C')
say time('N')
parse value time('C') with hours 3 4 minutes meridian +2
say "Hours "hours
say "Minutes "minutes
say "AM/PM" upper(meridian)
exit

