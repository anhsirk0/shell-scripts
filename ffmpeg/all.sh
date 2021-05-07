lu ffmpeg
ffmpeg -f concat -i mylist.txt -c copy final.mp4
ffmpeg -i out$i.mp4 -filter:v "setpts=0.75*PTS" fast$i.mp4
ffmpeg -i final.mp4 -filter:v "setpts=1.5*PTS" final_fast.mp4
ffmpeg -i out$i.mp4 -filter:v "setpts=1.5*PTS" fast$i.mp4
cd ffmpeg/
ffmpeg -ss 6 -i 'input.mp3' -t 200 -c copy output.mp3
ffmpeg -ss 6 -i 'input.mp3' -t 213 -c copy output.mp3
ffmpeg -ss 6 -i 'input.mp3' -t  -c copy output.mp3
ffmpeg -i output.mp3 -filter:a "volume=2.25" loud.mp3
ffmpeg -i output.mp3 -filter:a "volume=2.5" loud.mp3
ffmpeg -i norm.mp3 -filter:a "volume=2.5" loud.mp3
ffmpeg -i norm.mp3 -filter:a "volume=1.5" loud.mp3
ffmpeg -i loud.mp3 -filter:a loudnorm norm.mp3
ffmpeg -i output.mp3 -filter:a loudnorm norm.mp3
ffmpeg -i output.mp3 -filter:a "volume=1.25" loud.mp3
ffmpeg -ss 0 -i 'Same Jatt - Karan Aujla.mp3' -t 143 -c copy output.mp3
ffmpeg -ss 0 -i 'Same Jatt - Karan Aujla.mp3' -t 142 -c copy output.mp3
