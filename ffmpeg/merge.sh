ffmpeg -i part1.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts part1.ts
ffmpeg -i part2.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts part2.ts
ffmpeg -i part3.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts part3.ts
ffmpeg -i "concat:part1.ts|part2.ts|part3.ts" -c copy output.mp4
