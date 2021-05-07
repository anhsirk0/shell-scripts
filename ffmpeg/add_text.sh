ffmpeg -i part2fast.mp4 -vf drawtext="text='4x speed': fontcolor=white: fontsize=44: box=1: boxcolor=black@0.5: \
boxborderw=5: x=(w-text_w)/2: y=(h-text_h)/2" -codec:a copy output.mp4
