# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
################################################################################
# Script to check internet access
################################################################################
import socket
import os
import platform
import sys
import socket
import smtplib

# Static var
client = "Google Cloud"


def is_connected():
    try:
        # connect to the host -- tells us if the host is actually
        # reachable
        socket.create_connection(("www.google.com", 80))
        return True
    except OSError:
        pass
    return False

# Send email
def send_email_alert():
    recipient = "infra@trazalog.com"
    FROM = "infra@trazalog.com"
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = "INFO EVENT: Internet access is alive"
    TEXT = """
    Hostname: """ + socket.gethostname() + """
    Client: """ + client + """
    Type alert: VM Internet Access
    Message: Internet access alive """

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
    except:
        print ('alert failed')


if(is_connected):
    send_email_alert()
