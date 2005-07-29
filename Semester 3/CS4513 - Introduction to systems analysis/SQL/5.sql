select distinct SERIES, max(DOWNLOAD) from SYS.Podcasts 
where FORMAT='WMA' 
group by SERIES
