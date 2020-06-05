#!/bin/bash

# HylaFAX recieved directory
TARGET=/var/spool/hylafax/recvq
# Directory you will have converted pdfs stored
PROCESSED=/home/username/pdfs
# Edit your SMTP server info as needed
SMTPFROM=user@email.org
SMTPTO=user2@email.org
SMTPSERVER=mail.email.org:587
SMTPUSER=user@email.org
SMTPPASS=mysupersecurepassword
MESSAGEBODY="New Fax Recieved.  Say whatever you want here."
SUBJECT="New Fax, or something"

# Watch the target directory for new files, wait 30
# seconds, then convert to pdf and email the file.

inotifywait -m -e create --format "%f" $TARGET \
        | while read FILENAME
                do
                        echo Detected $FILENAME, converting to pdf and emailing
                        sleep 30s
                        tiff2pdf -o "$PROCESSED/$FILENAME.pdf" "$TARGET/$FILENAME"
                        wait
                        sleep 10s
                        sendEmail -f $SMTPFROM -t $SMTPTO -u $SUBJECT -m $MESSAGEBODY -s $SMTPSERVER -xu $SMTPUSER -xp $SMTPPASS -a "$PROCESSED/$FILENAME.pdf"
                done
