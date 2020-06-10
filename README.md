# hylafaxtoemail
Send faxes recieved from HylaFAX to an email address as PDFs

    sudo apt-get install sendemail libio-socket-ssl-perl libnet-ssleay-perl
    
    git clone https://github.com/signal-9/hylafaxtoemail.git
    
    cd hylafaxtoemail
    
Edit `faxtoemail.sh` and fix your SMTP settings, directories, etc.
Edit `faxtoemail.service` and adjust your username accordingly.

    sudo cp faxtoemail.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl enable faxtoemail.service
    systemctl start faxtoemail

To automatically remove converted PDFs older than 7 days, add to your crontab:

    0 0 * * 0 find /your/pdf/directory/here/* -mtime +6 -type f -delete >/dev/null 2>&1
