import subprocess
subprocess.Popen("firefox --private-window --kiosk http://localhost:8080", shell=True)
#subprocess.Popen("chromium-browser --fullscreen --kiosk http://localhost:8080", shell=True)
