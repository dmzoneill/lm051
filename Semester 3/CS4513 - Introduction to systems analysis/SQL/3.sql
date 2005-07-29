select EPISODE, SERIES from SYS.Podcasts 
where LENGTH>20 
and (BITRATE=32 or BITRATE=64)
