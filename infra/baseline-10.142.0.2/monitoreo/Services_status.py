# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
################################################################################
# Script to check services alive
################################################################################
import socket
import os
import platform
import sys
import socket
import smtplib
import subprocess


# Static var
client = "Google Cloud"



# Send email
def send_email_alert(process):
    recipient = "infra@trazalog.com"
    FROM = "infra@trazalog.com"
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = "FATAL EVENT: Service is stopped"
    TEXT = """
    Hostname: """ + socket.gethostname() + """
    Client: """ + client + """
    Type alert: Emergency service stopped
    Message: Service stopped: """ + process

    # Prepare actual message
    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP_SSL("mauriper.ferozo.com", 465)
        server.ehlo()
        server.login(FROM, "***REDACTED***")
        server.sendmail(FROM, TO, message)
        server.close()
        print ('alert sent')
    except Exception as e:
        print ('alert failed')
	print (e)


p = subprocess.Popen(["ps", "-ef"], stdout=subprocess.PIPE)
out, err = p.communicate()


if ('httpd' in str(out)):
    print('httpd running')
else:
    send_email_alert('httpd')


if ('mysqld' in str(out)):
    print('mysql running')
else:
    send_email_alert('mysqld')


if ('postgres' in str(out)):
    print('postgres running')
else:
    send_email_alert('postgres')


if ('tomcat' in str(out)):
    print('tomcat running')
else:
    send_email_alert('tomcat')


if ('bonita' in str(out)):
    print('bonita running')
else:
    send_email_alert('bonita')
