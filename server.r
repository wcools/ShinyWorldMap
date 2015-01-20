# run locally at start (outside shinyServer())
# library(shiny)

# components
	# RENDER functions
	# each requires one {expression}  as argument (the expression returns an object)
		# renderImage 	renderPlot 	renderPrint 	renderTable 	renderText 	renderUI 	

library(rworldmap)
library(ggplot2)
library(reshape)

# load in the dtc object
load("data/myWorldInfo.RData")		

# prepare the data for use with rworldmap
tdtc <- dtc
tdtc$logPop <- log(tdtc$population)
tdtc$visit <- tdtc$visited
levels(tdtc$visit)[levels(tdtc$visit)==c("check","minimal","near future","high probability","maybe","low probability","no intent")] <- c("checked","checked","not","not","not","not","not")
wmap <- joinCountryData2Map( tdtc,joinCode = "ISO3",nameJoinColumn = "ISO3",verbose=T)
mx <- matrix(as.numeric(unlist(lapply(dta$coordinates[!is.na(dta$coordinates)],function(.x) strsplit(.x,",")))),ncol=3,byrow=T)
wdta <- wmap@data[,c("ISO3","ADMIN","SETx","visit")]
levels(wdta$visit) <- c("checked","checked","not","not","not","not","not")
mapCountryData(wmap,nameColumnToPlot="visit",numCats=2,colourPalette=c("#404040","#afafa0"),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		
mapDevice()

###########################
# shiny function for server : to run interactive, and appear in the app
shinyServer(function(input, output, session) {
	# input$
	# to set up widgets that allow for user input & control
	userChoice <- reactive({
		switch(input$mapPlot,
			"visited" = input$visited,
			"rank" = input$rank,
			"nrDays" = input$logNrDays,
			"visit1" = input$visit1,
			"visitN" = input$visitN,
			"nrVisits" = input$nrVisits,
			"expFutureDays" = input$expFutureDays,
			"probVisit" = input$probVisit,
			"population" = input$population,
			"density" = input$density,
			"GDPn" = input$GDPn,
			"GDPc" = input$GDPc,
			"SET" = input$SET)
		switch(input$checkVisited,
			"checked" = input$checkVisited
		)
		# mapCountryData(input,nameColumnToPlot=input$mapPlot,numCats=15)
	})
	userChoice <- reactive({
		# wmapx <- wmap@data
		wdtax <- wdta
		wdtax$visit <- as.character(wdta$visit)
		wdtax
	})
	# output$ -> using input$ and put in quarantine using a render()
	output$mapWorld <- renderPlot({
		par(bg="#060606")
		# change the checkbox status and the wdta temporary visit information
		if(input$setMap%in%c("clearAll")) { 
			wdta$visit <- rep("not",length(wdta$visit))
			for(it in wmap@data[!is.na(wmap@data$visited),"ISO3"]){
				updateCheckboxInput(session,it, NULL, value = FALSE)
			}
		}
		if(input$setMap%in%c("addMyVisits")){ 
			for(it in wmap@data[wmap@data$visited%in%c("check","minimal"),"ISO3"]){
				updateCheckboxInput(session,it, NULL, value = TRUE)
				wdta[wdta$ISO3==it,"visit"] <- "checked"
			}
		}
		if(input$setMap%in%c("addMyFutureVisits")){ 
			for(it in wmap@data[wmap@data$visited%in%c("near future","high probability"),"ISO3"]){
				updateCheckboxInput(session,it, NULL, value = TRUE)
				wdta[wdta$ISO3==it,"visit"] <- "checked"
			}
		}
		# overwrite the information in the wdta file
		for(it in wdta[,"ISO3"]){
			ifelse(input[[it]], wdta[wdta$ISO3==it,"visit"] <- "checked", wdta[wdta$ISO3==it,"visit"] <- "not")
		}
	    updateRadioButtons(session, "setMap",
			label = "",
			choices = list( "free selection" = "setFree"
				,"clear all" = "clearAll"
				,"add visited places" = "addMyVisits"
				, "add intended visits" = "addMyFutureVisits")
				,selected = "setFree")
		
		# note: possible problems with ISO3 = ESH and SSD
		
		# overwrite the visit information in the wmap@data
		wmap@data$visit <- wdta$visit
		mapCountryData(wmap,nameColumnToPlot="visit",numCats=2,colourPalette=c("#404040","#afafa0"),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606",addLegend=FALSE)		
	})
	output$mapWorldEurope <- renderText({
		set <- "Europe"
		sdta <- subset(userChoice(),SETx==set)
		cnt <- 0
		for(it in sdta[,"ISO3"]){	if(input[[it]]) cnt <- cnt + 1		}
		out <- paste0(set,": \n\t",cnt," countries")
		out
	})
	output$mapWorldAsia <- renderText({
		set <- "Asia"
		sdta <- subset(userChoice(),SETx==set)
		cnt <- 0
		for(it in sdta[,"ISO3"]){	if(input[[it]]) cnt <- cnt + 1		}
		out <- paste0(set,": \n\t",cnt," countries")
		out
	})
	output$mapWorldAfrica <- renderText({
		set <- "Africa"
		sdta <- subset(userChoice(),SETx==set)
		cnt <- 0
		for(it in sdta[,"ISO3"]){	if(input[[it]]) cnt <- cnt + 1		}
		out <- paste0(set,": \n\t",cnt," countries")
		out
	})
	output$mapWorldAmerica <- renderText({
		set <- "America"
		sdta <- subset(userChoice(),SETx==set)
		cnt <- 0
		for(it in sdta[,"ISO3"]){	if(input[[it]]) cnt <- cnt + 1		}
		out <- paste0(set,": \n\t",cnt," countries")
		out
	})
	output$mapWorldOther <- renderText({
		set <- "Other"
		sdta <- subset(userChoice(),SETx==set)
		cnt <- 0
		for(it in sdta[,"ISO3"]){	if(input[[it]]) cnt <- cnt + 1		}
		out <- paste0(set,": \n\t",cnt," countries")
		out
	})
	# output$ -> using input$ and put in quarantine using a render()
	output$myWorld <- renderPlot({
		par(bg="#060606")
		
		if(input$mapPlot%in%c("visited")){
			mapCountryData(wmap,nameColumnToPlot="visited",colourPalette=c("#222222","#555555","#cccccc","#888844","#888833","#663333","#661111")[7:1],borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("rank")){
			mapCountryData(wmap,nameColumnToPlot="rank",numCats=21,catMethod="fixedWidth",colourPalette=colorRampPalette(c("#4444dd", "#dd4444"))(21),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")			}
		if(input$mapPlot%in%c("nrDays")){
			mapCountryData(wmap,nameColumnToPlot="nrDays",numCats=9,catMethod="fixedWidth",colourPalette=colorRampPalette(c("#808080", "#800000"))(9),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("visit1")){
			mapCountryData(wmap,nameColumnToPlot="visit1",numCats=40,colourPalette=rgb(red=seq(1,.2,length=40), green = seq(.6,.1,length=40), blue = 0.2, names = paste("c", 1:40, sep = ".")),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("visitN")){
			mapCountryData(wmap,nameColumnToPlot="visitN",numCats=15,colourPalette=rgb(red=seq(1,.2,length=15), green = seq(.6,.1,length=15), blue = 0.2, names = paste("c", 1:15, sep = ".")),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("nrVisits")){
			mapCountryData(wmap,nameColumnToPlot="nrVisits",numCats=6,catMethod="fixedWidth",colourPalette=c("#555555","#bbbb88","#bbbb55","#bbbb22","#663333","#661111")[6:1],borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("expFutureDays")){
			mapCountryData(wmap,nameColumnToPlot="expFutureDays",numCats=9,catMethod="fixedWidth",colourPalette=paste0("#22",(1:9)*(1111)),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("probVisit")){
			mapCountryData(wmap,nameColumnToPlot="probVisit",numCats=9,catMethod="fixedWidth",colourPalette=paste0("#22",(1:9)*(1111)),borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("density")){
			mapCountryData(wmap,nameColumnToPlot="density",numCats=30,colourPalette="heat",borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("population")){
			mapCountryData(wmap,nameColumnToPlot="population",numCats=120,colourPalette="heat",borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$mapPlot%in%c("GDPc")){
			mapCountryData(wmap,nameColumnToPlot="GDPc",numCats=120,colourPalette="heat",borderCol="white",missingCountryCol="#0a0a06",oceanCol="#060606")		}		
		if(input$checkVisited){
			points(SpatialPoints(mx, proj4string=CRS(as.character(NA)), bbox = NULL),pch=19,cex=.8,col=2)
			points(SpatialPoints(mx, proj4string=CRS(as.character(NA)), bbox = NULL),pch=19,cex=.3,col=7)
		}
	})
	output$myTable <- renderTable({
		# if(input$stats%in%c("myTable")){
			tdtc <- dtc
			levels(tdtc$visited) <- c("yes","yes","todo","todo","no","no","no")
			tdtc$been <- as.character(tdtc$visited)
			tdtc$regions <- as.character(tdtc$SET)
			tst <- cast(tdtc,regions~been,"length",value="nrDays")[,c("regions","yes","todo","no")]
			tst$total <- as.integer(rowSums(tst[,-1]))
			tst$propRegion <- round(tst$yes / tst$total,2)
			tst$propVisited <- round(tst$yes / sum(tst$yes),2)
			tst <- tst[rev(order(tst$propRegion,tst$todo,tst$total)),]
			names(tst)[names(tst)=="propRegion"] <- c("%Region")
			names(tst)[names(tst)=="propVisited"] <- c("%Visit")
			row.names(tst) <- NULL
			tst
		# }
	})
	output$myPlot <- renderPlot({
		par(bg="#060606")
		if(input$stats%in%c("barDays")){
			tbv <- ggplot(data=dtc[order(dtc$visited,dtc$size),],aes(x=SET,y=sqrt(size),fill=nrDays)) + geom_bar(aes(color=SETx),stat="identity")
			tbv <- tbv + theme(axis.text.x = element_text(angle = 90, vjust = .3,size=10))
			tbv <- tbv + ggtitle("Number of days in Visited Countries per Region") + theme(plot.title = element_text(vjust = 2))
			tbv <- tbv + xlab("world region") + theme(axis.title.x = element_text(vjust=.25,size=14))
			tbv <- tbv + guides(fill = guide_legend("nrDays",order = 1), color = guide_legend("",order = 2))
			tbv <- tbv + theme(legend.background = element_rect(fill = "gray95"),plot.background = element_rect(fill = "gray95"))
			tbv <- tbv + theme(panel.background = element_rect(fill = "gray95"))
			tbv <- tbv + theme(axis.text.y=element_blank(),axis.ticks.y=element_blank()) + labs(y = expression(sqrt("stacked country sizes")))
		}
		if(input$stats%in%c("barVisit")){
			tbv <- ggplot(data=dtc[order(dtc$visited,dtc$size),],aes(x=SET,y=sqrt(size),fill=visited)) + geom_bar(aes(color=SETx),stat="identity")
			tbv <- tbv + theme(axis.text.x = element_text(angle = 90, vjust = .3,size=10))
			tbv <- tbv + ggtitle("Visited Countries per Region") + theme(plot.title = element_text(vjust = 2))
			tbv <- tbv + xlab("world region") + theme(axis.title.x = element_text(vjust=.25,size=14))
			tbv <- tbv + scale_fill_grey(name="country visited")
			tbv <- tbv + guides(fill = guide_legend("visited",order = 1), color = guide_legend("",order = 2))
			tbv <- tbv + theme(legend.background = element_rect(fill = "gray95"),plot.background = element_rect(fill = "gray95"))
			tbv <- tbv + theme(panel.background = element_rect(fill = "gray95"))
			tbv <- tbv + theme(axis.text.y=element_blank(),axis.ticks.y=element_blank()) + labs(y = expression(sqrt("stacked country sizes")))
		}
		if(input$stats%in%c("myTable")){
			tbv <- NULL
		}
		tbv
	})
	output$myVisits <- renderText({
		out <- ""
		if(input$mapPlot%in%c("rank","expFutureDays","visit1","visitN","probVisit","density","population","GDPc","GDPn"))
			out <- paste(out,"the scale ranges from ",min(tdtc[,input$mapPlot],na.rm=T)," to ",max(tdtc[,input$mapPlot],na.rm=T))
		if(input$mapPlot%in%c("nrDays"))
			out <- paste(out,"the scale ranges from ",min(tdtc[,input$mapPlot],na.rm=T)," to a maximum set artificially to 99 for the place that I live")
		if(input$mapPlot%in%c("visited","nrVisits","SET"))
			out <- paste("the legend is shown above")
		out
	})
	output$myComments <- renderText({
		out <- ""
		if(input$stats%in%c("barVisit"))
			out <- paste(out,"visited countries (check/minimal) and other countries are combined per region, with sizes reflecting the square root of the country size.")
		if(input$stats%in%c("barDays"))
			out <- paste(out,"number of days in countries with 99 artificially used as maximum to refer to my home country.")
		out
	})
	
})