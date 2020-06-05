# hylafaxtoemail
Send faxes recieved from HylaFAX to an email address as PDFs

    sudo apt-get install sendemail libio-socket-ssl-perl libnet-ssleay-perl

Copy the service to /etc/systemd/system,

    systemctl daemon-reload
    systemctl enable faxtoemail.service
    systemctl start faxtoemail

