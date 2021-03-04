/mailto\|@\|＠\|at\.png/!d
s/^.*mailto:\([^"]*\)".*$/\1/
s/^.*[^[:alnum:]]\([-_.+[[:alnum:]]]\+\([@＠]\|at\)\([[:alnum:]]\+.[-[:alnum:]]\+\)\+\).*$/\1/

# fcu
# s/^<td>\([-._[[:alnum:]]]*\)<img src='images\/at.png' alt='at'\/>\([-._[[:alnum:]]]*\)<\/td>$/\1@\2/
s/<td>\(.*\)<img src='images\/at.png' alt='at'\/>\(.*\)<\/td>/\1@\2/
