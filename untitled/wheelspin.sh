#!/usr/bin/env bash
clear
if [ ! -z "$1" ]; then

# Use an existing file
  if [ -f "$1" ]; then
      echo "Using file '$1'"
      while read entry || [ -n "$entry" ]; do

        ENTRIES+=("$entry")
      done<$1

      if [ -z "$ENTRIES" ]; then
          echo "Entry array is empty!"
          exit 1
      fi
  else
      echo "File '$1' not found"
      exit 1
  fi
else

  # Empty String array
  ENTRIES=()

while true; do
  read -p "Enter options (c to continue, q to quit): " ENTRY
  case $ENTRY in
  c)
    break
    ;;
  q)
    exit 2
    ;;
  *)
    ENTRIES+=("$ENTRY")
    ;;
  esac
done
fi

echo "
======================== Entries"
for entry in ${ENTRIES[@]}; do
  echo "$entry"
done
echo "========================"

#read -p "Ok? (y/n):" OPT
#case $OPT in
#y|Y|yes|YES)
#  :
#  ;;
#*)
#  echo "Exiting"
#  exit 1
#  ;;
#esac

spin_count=0
finish_var=0
while true; do
clear
selectedentry=${ENTRIES[ $RANDOM % ${#ENTRIES[@]} ]}



case $spin_count in
0)
  sleep_count=0.1
  ;;
15)
  sleep_count=0.25
  ;;
22)
  sleep_count=0.5
  ;;
26)
  sleep_count=0.75
  ;;
28)
  finish_var=1
  ;;
esac

if (( $spin_count % 2 == 0 ))           # no need for brackets
then

echo "

                                 ..,;:;;;;:::;;;lkOo;;:::::;;::;,..
                            .';::::;'..         .ox,         ..';::::;'.
                        .'::::,.                .ox,                .,::::'.
                     .,:::'.                    .ox,                    .':cc;.
                   ,cc;.                        .ox,                        .;cc,.
                .:c:.                           .ox,                           .:l:.
              .cc,                              .ox,                              ,lc'
            .cl'                                .ox,                                ,ll.
          .:l,                                  .ox,                                  ,oc.
         ,o;                                    .ox,                                    :o,
       .cl.                                     .ox,                                     .ol.
      .o:                                       .ox,                                      .co.
     'dd:'                                      .ox,                                      .:xx,
    ,o,.,:::,.                                  .ox,                                  .,:::,.,d,
   ,o,     .;::;.                               .ox,                               .;::;'     ,d,
  .o;         .,:::,.                           .ox,                           .':::,.         ;d.
 .lc              .;::;.                        .ox,                        .;:::'              co.
 :o.                 .,:::,.                    .ox,                     ':::;.                 .o:
.o;                      ';::;.                 .ox,                 .;:::'.                     ;d.
:o.                         .,:::'.             .ox,              ':::;.                         .o:
o:                              ':::;.          .ox,          .,:::'.                             :o
d'                                 .,:::'.      .ox,       ';::;.                                 'd
d.                                     ':::;.   .ox,   .,:::,.                                    .d
o.                                        .;:::',dx:.;::;.                                        .o
o                                            .,lk0KOo;.      $selectedentry
o                                           .;::lkOo:::'                                           o
o.                                      .,:::,. .ox, .':::,.                                      .d
d.                                   .;::;.     .ox,     .;::;'                                   .d
d,                               .,:::,.        .ox,        .,:::,.                               ;d
cc                            .;::;'            .ox,            .;::;.                            ll
,o'                       .':::,.               .ox,               .,:::,.                       'd,
 lc                    .;::;'                   .ox,                   .;::;.                    ll
 'd,               .':::,.                      .ox,                      .,:::,.               ;d'
  ;o.           .;:::'                          .ox,                          .;::;.           .d;
   cl.       ':::;.                             .ox,                             .,:::,.      .oc
   .cl.  .,:::'.                                .ox,                                 ';::;.  .ll.
    .co:::;.                                    .ox,                                    .,::cdc.
      ck;                                       .ox,                                       ,xc
       ,o,                                      .ox,                                      ;o,
        .lc.                                    .ox,                                    .cl.
          ;o;                                   .ox,                                   ;o;
           .:l,                                 .ox,                                 ,l:.
             .cl,                               .ox,                               ,lc.
               .:l;.                            .ox,                            .;l:.
                 .;c:,                          .ox,                         .,cc;.
                    .:c:,.                      .ox,                      .,:c:.
                       .;::;'.                  .ox,                  .';::;.
                          .';:::;'.             .ox,             .';:::;'.
                               .,;:;;;;,'....   'dx;   ....',;;;;:;,.
                                    .';clodddoood00xooodddolc;'.
"
else

echo "

                                    .';:clllcc::::::cccllllc:,..
                              ..',,',,'....             ....',,,,;,'.
                          .',,,,..                               ..,;;;,.
                      .'::,'.                                         .';cl;.
                    ';;,:o'                                             .ll;::;.
                 .;;,.   'o;                                           'o;   .,::,
               ':;.       .o:                                         ,o,       .:c;.
             ,:,.          .lc.                                      ;o.          .;l:.
           'c;.             .cl.                                    cl.              ;l;
         .::.                 :o.                                 .ll.                .:l'
        ,c'                    ;o'                               .lc                    'oc.
      .::.                      'o,                             .o;                      .co.
     .c;                         .o:                           ,o,                         ;o,
    .l,                           .lc.                        ;o'                           'o;
   .l,                             .cl.                      :o.                             'd;
  .l;                                :o.                   .cl.                               ,d'
  cc                                  ;o'                 .lc.                                 :o.
 ;l.                                   ,o,               .o:                                   .ll
.o;                                     .o:             'o,                                     'd,
:l.                                      .lc.          ;o'                                       ll
o;                                        .ll.        :o.                                        ,d'
d'                                          :o.     .cl.                                         .o:
o.                                           ;o'   .lc.                                           ll
l                                             ,o,':l:                                             :o
x:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;oO00x:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;dd
d,'''''''''''''''''''''''''''''''''''''''''''',okk0x;'''''''''''''''''''''''''''''''''''''''''''''od
o                                             :o..'ll.                                            co
d.                                          .cl.    :o.                                           ll
d,                                         .lc.      ;o'                                         .d;
lc                                        .l:         ,o,                                        ;d.
;o.                                      'o;           'o;                                       ll
.oc                                     ,o,             .oc                                     ,d'
 ,d'                                   ;o'               .ll.                                  .o:
  co.                                 :l.                  cl.                                 co.
  .lc                               .ll.                    ;o'                               :x,
   .oc                             .lc                       ,o,                             ;Ol
    .lc                           .o;                         'o;                           :0d.
     .ll.                        ,o,                           .oc                         c0o.
       :o'                      ;o'                             .ll.                     .oOc
        'l:.                   :o.                               .cl.                   ;do'
         .:l,                .cl.                                  :o.                'lc'
           .cl'             .lc.                                    ,o,             .cl'
             'cc,          .o:                                       'o;          'cl,
               .:c;.      'o;                                         .o:      .;lc'
                 .:ol,   ;o'                                           .ll.  ,cc:.
                   .:dxood'                                             .oxcc:'
                      'cxkdc,.                                       .,::c:.
                         .;colc:;,..                           ..,;:::;'.
                              ..';:;;;;;;,'.............',;::;;::;'.
                                     .';clooddddddddddddolc;'.

"
fi


if [ $finish_var -eq 1 ]; then
    break
fi

spin_count=$((spin_count+1))
sleep $sleep_count
done
clear
echo "

                                 ..,;:;;;;:::;;;lkOo;;:::::;;::;,..
                            .';::::;'..         .ox,         ..';::::;'.
                        .'::::,.                .ox,                .,::::'.
                     .,:::'.                    .ox,                    .':cc;.
                   ,cc;.                        .ox,                        .;cc,.
                .:c:.                           .ox,                           .:l:.
              .cc,                              .ox,                              ,lc'
            .cl'                                .ox,                                ,ll.
          .:l,                                  .ox,                                  ,oc.
         ,o;                                    .ox,                                    :o,
       .cl.                                     .ox,                                     .ol.
      .o:                                       .ox,                                      .co.
     'dd:'                                      .ox,                                      .:xx,
    ,o,.,:::,.                                  .ox,                                  .,:::,.,d,
   ,o,     .;::;.                               .ox,                               .;::;'     ,d,
  .o;         .,:::,.                           .ox,                           .':::,.         ;d.
 .lc              .;::;.                        .ox,                        .;:::'              co.
 :o.                 .,:::,.                    .ox,                     ':::;.                 .o:
.o;                      ';::;.                 .ox,                 .;:::'.                     ;d.
:o.                         .,:::'.             .ox,              ':::;.                         .o:
o:                              ':::;.          .ox,          .,:::'.                             :o
d'                                 .,:::'.      .ox,       ';::;.                                 'd
d.                                     ':::;.   .ox,   .,:::,.                                    .d
o.                                        .;:::',dx:.;::;.                                        .o
o                                            .,lk0KOo;.      $selectedentry
o                                           .;::lkOo:::'                                           o
o.                                      .,:::,. .ox, .':::,.                                      .d
d.                                   .;::;.     .ox,     .;::;'                                   .d
d,                               .,:::,.        .ox,        .,:::,.                               ;d
cc                            .;::;'            .ox,            .;::;.                            ll
,o'                       .':::,.               .ox,               .,:::,.                       'd,
 lc                    .;::;'                   .ox,                   .;::;.                    ll
 'd,               .':::,.                      .ox,                      .,:::,.               ;d'
  ;o.           .;:::'                          .ox,                          .;::;.           .d;
   cl.       ':::;.                             .ox,                             .,:::,.      .oc
   .cl.  .,:::'.                                .ox,                                 ';::;.  .ll.
    .co:::;.                                    .ox,                                    .,::cdc.
      ck;                                       .ox,                                       ,xc
       ,o,                                      .ox,                                      ;o,
        .lc.                                    .ox,                                    .cl.
          ;o;                                   .ox,                                   ;o;
           .:l,                                 .ox,                                 ,l:.
             .cl,                               .ox,                               ,lc.
               .:l;.                            .ox,                            .;l:.
                 .;c:,                          .ox,                         .,cc;.
                    .:c:,.                      .ox,                      .,:c:.
                       .;::;'.                  .ox,                  .';::;.
                          .';:::;'.             .ox,             .';:::;'.
                               .,;:;;;;,'....   'dx;   ....',;;;;:;,.
                                    .';clodddoood00xooodddolc;'.
"

echo "==========WINNNER==========
$selectedentry
===================="