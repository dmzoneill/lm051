select LENGTH, PLAYED, BITRATE from SYS.Podcasts 
where SERIES in (select distinct SERIES from SYS.Podcasts group by SERIES having count(*)=1)
