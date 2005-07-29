select avg(BITRATE), MAX(PLAYED), min(FILESIZE) from SYS.Podcasts 
group by SERIES 
having count(*)>1
