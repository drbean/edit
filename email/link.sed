# /mailto\|@\|＠\|at\.png\| at /!d
/mailto\|@\|＠\|at\.png/!d
s/^.*mailto:\([^"]*\)".*$/\1/
s/^.*[^[:alnum:]]\([-_.+[[:alnum:]]]\+\([@＠]\|at\)\([[:alnum:]]\+.[-[:alnum:]]\+\)\+\).*$/\1/

# fcu
# /[[:alnum:]]@fcu.edu.tw/d
/Copyright@.*Feng Chia/d
s/<td>\([-._[:alnum:]]*\)<img src='images\/at.png' alt='at'\/>\([-._[:alnum:]]*\)\s*<\/td>/\1@\2/
s/^\s*\([-._[:alnum:]]*\) at \([-._[:alnum:]]*\)\s*$/\1@\2/

# scmu
/@media/d

# asia
/@import/d
/[^-._[:alnum:]]@[^-._[:alnum:]]l/d
