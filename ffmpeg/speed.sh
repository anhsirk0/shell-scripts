# faster
ffmpeg -i input.mp4 -filter:v "setpts=0.5*PTS" output.mp4
# slower
ffmpeg -i input.mp4 -filter:v "setpts=2*PTS" output.mp4

# with audio
ffmpeg -i input.mp4 -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" output.mp4

