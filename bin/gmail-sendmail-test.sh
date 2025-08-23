#!/bin/sh

cat << EOF > message.txt
From: sascha.wander@gmail.com
To: sawander@protonmail.com
Subject: MSMTP sendmail test

MSMTP sendmail test

Managing my passwords with pass - the standard unix password manager

EOF

cat message.txt | msmtp \
    --auth=on --tls=on \
    --host smtp.gmail.com \
    --port 587 \
    --user sascha.wander@gmail.com \
    --passwordeval "pass mail/gmail-mutt" \
    --read-envelope-from \
    --read-recipients
