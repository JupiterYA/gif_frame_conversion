md png
ffmpeg -i "%~1" -vf scale=120:-1 ./png/%%06d.png
for

pause
