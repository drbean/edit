sed -i.BAK -e '/jys@mail.ntust.edu.tw/d' */address.txt
svn diff */address.txt
svn ci -m 'jys@mail.ntust.edu.tw: User unknown'
