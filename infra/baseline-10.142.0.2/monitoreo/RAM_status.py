# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
################################################################################
# Script to check memory usage
################################################################################
import os
import platform
import sys
import socket
import smtplib

# Static var
umbral = 1024
client = "Google Cloud"


# Send email
def send_email_alert(xmx):
    recipient = "infra@trazalog.com"
    FROM = "infra@trazalog.com"
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = "CRITICAL EVENT: RAM usage"
    TEXT = """
    Hostname: """ + socket.gethostname() + """
    Client: """ + client + """
    Type alert: Random Access Memory usage
    Message: Memory (RAM) Utilization, fallen below metrics thresholds
    Umbral metrics: """ + str(umbral) + """MB
    Current free: """ + xmx + """MB"""

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


# Get total memory
mem_free = str(round(float(os.popen(''' free -m | grep Mem | awk '{print $4+$6}'  ''').readline()),2))

if(float(mem_free) <= umbral):
    send_email_alert(mem_free)
