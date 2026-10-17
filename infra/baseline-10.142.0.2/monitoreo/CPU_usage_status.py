# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
################################################################################
# Script to check cpu usage
################################################################################
import os
import platform
import sys
import socket
import smtplib

# Static var
umbral = 90
client = "Google Cloud"

# Send email
def send_email_alert(cpu):
    recipient = "infra@trazalog.com"
    FROM = "infra@trazalog.com"
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = "CRITICAL EVENT: CPU overloaded"
    TEXT = """
    Hostname: """ + socket.gethostname() + """
    Client: """ + client + """
    Type alert: CPU usage
    Message: CPU Utilization, fallen below metrics thresholds
    Umbral metrics: """ + str(umbral) + """%
    Current load: """ + cpu + """%"""

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


# Catch CPU usage
#CPU_Pct = str(round(float(os.popen('''grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage }' ''').readline()),2))
#CPU_Pct = str(round(float(os.popen(''' echo "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"  ''').readline()),2))
CPU_Pct = str(os.popen(''' echo "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"  ''').readline())

print(CPU_Pct)
if(int(CPU_Pct) >= umbral):
    send_email_alert(CPU_Pct)
