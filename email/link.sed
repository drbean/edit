/mailto\|@\|＠\|at\.png/!d
s/^.*mailto:\([^"]*\)".*$/\1/
s/^.*[^[:alnum:]]\([-_.+[[:alnum:]]]\+\([@＠]\|at\)\([[:alnum:]]\+.[-[:alnum:]]\+\)\+\).*$/\1/

# fcu
/[[:alnum:]]@fcu.edu.tw/d
s/<td>\([-._[:alnum:]]*\)<img src='images\/at.png' alt='at'\/>\([-._[:alnum:]]*\)\s*<\/td>/\1@\2/
