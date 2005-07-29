select SERIES, sum(FILESIZE), avg(LENGTH), sum(PLAYED) from SYS.Podcasts 
group by SERIES
