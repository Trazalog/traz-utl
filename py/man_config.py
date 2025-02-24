class Config:
    TOOLS_API_SERVER="10.142.0.11:8283"
    TOOLS_API_URL = f"http://{TOOLS_API_SERVER}"
    IMAGE_SAVE_DIRECTORY = '/var/www/html/tools/traz-prod-assetplanner/assets/images'
    WHA_TOOLS_PATTERN = r'^TTOOLS-SOLSERV-(\d+)$'
    TWILIO_ACCOUNT_SID = 'ACf37511c7d00c8af84a1558005f99a5e7'
    TWILIO_ACCOUNT_TOKEN = '168f5aeb0716648418df31c608a33354'
    FLASK_HOST='0.0.0.0'
    FLASK_PORT=3651
    LOG_NAME='whasolservreceiver.log'
    MAX_IMAGES = 7
