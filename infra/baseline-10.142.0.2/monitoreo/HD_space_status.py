# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
################################################################################
# Script to check free space in specifie path
################################################################################
import ctypes
import os
import platform
import sys
import socket
import smtplib


# Static var
path = "/trazaSystems"
umbral = 2048
client = "Google Cloud"


# Get free space in MB
def get_free_space_mb(dirname):
    """Return folder/drive free space (in megabytes)."""
    if platform.system() == 'Windows':
        free_bytes = ctypes.c_ulonglong(0)
        ctypes.windll.kernel32.GetDiskFreeSpaceExW(ctypes.c_wchar_p(dirname), None, None, ctypes.pointer(free_bytes))
        return free_bytes.value / 1024 / 1024
    else:
        st = os.statvfs(dirname)
        return st.f_bavail * st.f_frsize / 1024 / 1024

# Send email
def send_email_alert(path, umbral):
    recipients = ["infra@trazalog.com", "rnsanchez@trazalog.com", "pmarrelli@trazalog.com", "ramos@trazalog.com"]
    FROM = "infra@trazalog.com"
    TO = recipients
    SUBJECT = "CRITICAL EVENT: Drive space"
    TEXT = """
    Hostname: """ + socket.gethostname() + """
    Client: """ + client + """
    Type alert: Disk space
    Message: Drive space fallen below metrics thresholds
    Path: """ + path + """
    Umbral metrics: """ + str(umbral) + """MB
    Current free space: """ + str(get_free_space_mb(path)) + """MB"""

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



# Run
if(get_free_space_mb(path) < umbral):
    send_email_alert(path, umbral)
