# take screenshot from video
# specify fps

ffmpeg -i test.mp4 -vf fps=10 outfile.png
