
filterdata <- function(y1,y2,x1,x2,cps){
	y = lonlat$lat
	x = lonlat$lon   # tapi kagak ada
	#y1 = 19
	#y2 = 29
	y1y2 = which(y > y1 & y < y2)
	#x1 = 117
	#x2 = 127
	x1x2 = which(x > x1 & x < x2)
	if( length(y1y2) <  length(x1x2) ){
		xysip =y1y2[which(y1y2 %in%  x1x2)]
	} else {
			xysip =x1x2[which(x1x2 %in%  y1y2)]
	}

	dat = cps[xysip]
	x = x[xysip]
	y = y[xysip]
	hasil = data.frame(x,y,dat)
	return(hasil)
}

