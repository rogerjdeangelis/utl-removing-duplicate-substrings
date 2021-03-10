Removing duplicate substrings

    Explanation

      Only add words to a new string if word was not present in original string
      Create a new string and only add words that are not in the original string

GitHub
https://github.com/rogerjdeangelis/utl-removing-duplicate-substrings

inspired by
https://tinyurl.com/nv6xh76s
https://stackoverflow.com/questions/66554027/removing-duplicate-substring-in-sas

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

data have;
  input name $50.;
cards4;
A B C A B C
a b c c b a
John Jane Jerry John John
MD SMITH, JOHN MD
SMITH, JOHN W
MD T SMITH, JOHN W.
SMITH, JOHN WILLIAM
JOHN N MD SMITH MD
MD JOHN W. SMITH MD
MD SMITH, MD JOHN
;;;;
run;quit;

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

data want;
   retain name;
   length new $200;
   set have;
   do i=1 to countw(name)+1;
     if findw(new,scan(name,i," "))=0 then new=catx(" ",new,scan(name,i," "));
   end;
   drop i;
run;

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;
Up to 40 obs WORK.WANT total obs=10

Obs    NAME                         NEW

  1    A B C A B C                  A B C
  2    a b c c b a                  a b c
  3    John Jane Jerry John John    John Jane Jerry
  4    MD SMITH, JOHN MD            MD SMITH, JOHN
  5    SMITH, JOHN W                SMITH, JOHN W
  6    MD T SMITH, JOHN W.          MD T SMITH, JOHN W.
  7    SMITH, JOHN WILLIAM          SMITH, JOHN WILLIAM
  8    JOHN N MD SMITH MD           JOHN N MD SMITH
  9    MD JOHN W. SMITH MD          MD JOHN W. SMITH
 10    MD SMITH, MD JOHN            MD SMITH, JOHN
