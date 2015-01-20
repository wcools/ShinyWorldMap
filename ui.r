# library(shiny)

# use www folder
	# mspc.png
	# use cyborg.css
	
# components
	# WIDGETS to allow for user input / control are placed in either panel
	# each requires a name for value reference and a label (possibly "") to show
		# actionButton 	checkboxGroupInput 	checkboxInput 	dateInput 	dateRangeInput 	fileInput 	helpText 	
		# numericInput 	radioButtons 	selectInput 	sliderInput 	submitButton 	textInput 
	# OUTPUT functions
	# each requires a name for reference
		# htmlOutput 	imageOutput 	plotOutput 	tableOutput 	textOutput 	uiOutput 	verbatimTextOutput 

###################################
# shiny function for user interface
shinyUI( 

	fluidPage(theme = "cyborg.css",
		titlePanel("",windowTitle="Gondar goes Shiny"),
		HTML("<div class='well'><img src='walk.png' height=16>&nbsp;&nbsp;Gondar's Way</div>"),
		navlistPanel(HTML("View</br></br>"),widths=c(2,10),
			
			# tab 1 named Map: map visualisations
			tabPanel(HTML("World Map"),	  

				fluidRow(
						plotOutput("mapWorld", height=600)
				),
				fluidRow(
					column(2,
						HTML("<div class='well'>"),
						textOutput("mapWorldEurope"),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						textOutput("mapWorldAfrica"),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						textOutput("mapWorldAmerica"),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						textOutput("mapWorldAsia"),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						textOutput("mapWorldOther"),
						HTML("</div>")
					),
					column(2,
						HTML("</br>")
					)					
				),
				fluidRow(
					column(2,
						HTML("<div class='well'>"),
						checkboxInput("ALB", label = "Albania", value = TRUE),
						checkboxInput("AND", label = "Andorra", value = FALSE),
						checkboxInput("AUT", label = "Austria", value = TRUE),
						checkboxInput("BLR", label = "Belarus", value = FALSE),
						checkboxInput("BEL", label = "Belgium", value = TRUE),
						checkboxInput("BIH", label = "Bosnia and Herzegovina", value = TRUE),
						checkboxInput("BGR", label = "Bulgaria", value = TRUE),
						checkboxInput("HRV", label = "Croatia", value = TRUE),
						checkboxInput("CZE", label = "Czech Republic", value = TRUE),
						checkboxInput("DNK", label = "Denmark", value = TRUE),
						checkboxInput("EST", label = "Estonia", value = FALSE),
						checkboxInput("FIN", label = "Finland", value = FALSE),
						checkboxInput("FRA", label = "France", value = TRUE),
						checkboxInput("DEU", label = "Germany", value = TRUE),
						checkboxInput("GRC", label = "Greece", value = TRUE),
						checkboxInput("HUN", label = "Hungary", value = TRUE),
						checkboxInput("IRL", label = "Ireland", value = FALSE),
						checkboxInput("ISL", label = "Iceland", value = FALSE),
						checkboxInput("ITA", label = "Italy", value = FALSE),
						checkboxInput("KOS", label = "Kosovo", value = TRUE),
						checkboxInput("LVA", label = "Latvia", value = FALSE),
						checkboxInput("LIE", label = "Liechtenstein", value = FALSE),
						checkboxInput("LTU", label = "Lithuania", value = FALSE),
						checkboxInput("LUX", label = "Luxembourg", value = TRUE),
						checkboxInput("MKD", label = "Macedonia", value = TRUE),
						checkboxInput("MLT", label = "Malta", value = FALSE),
						checkboxInput("MDA", label = "Moldova", value = TRUE),
						checkboxInput("MCO", label = "Monaco", value = TRUE),
						checkboxInput("MNE", label = "Montenegro", value = TRUE),
						checkboxInput("NLD", label = "Netherlands", value = TRUE),
						checkboxInput("NOR", label = "Norway", value = TRUE),
						checkboxInput("POL", label = "Poland", value = TRUE),
						checkboxInput("PRT", label = "Portugal", value = TRUE),
						checkboxInput("ROU", label = "Romania", value = TRUE),
						checkboxInput("RUS", label = "Russia", value = TRUE),
						checkboxInput("SMR", label = "San Marino", value = FALSE),
						checkboxInput("SRB", label = "Serbia", value = TRUE),
						checkboxInput("SVK", label = "Slovakia", value = TRUE),
						checkboxInput("SVN", label = "Slovenia", value = FALSE),
						checkboxInput("ESP", label = "Spain", value = TRUE),
						checkboxInput("SWE", label = "Sweden", value = TRUE),
						checkboxInput("CHE", label = "Switzerland", value = TRUE),
						checkboxInput("UKR", label = "Ukraine", value = TRUE),
						checkboxInput("GBR", label = "United Kingdom", value = TRUE),
						checkboxInput("VAT", label = "Vatican", value = FALSE),
						HTML("<p>with UK"),
						checkboxInput("GGY", label = "Guernsey", value = FALSE),			# UK
						checkboxInput("GIB", label = "Gibraltar", value = FALSE),			# UK
						checkboxInput("IMN", label = "Isle of Man", value = FALSE),			# UK
						checkboxInput("JEY", label = "Jersey", value = FALSE),				# UK
						HTML("<p>with Finland"),
						checkboxInput("ALA", label = "Aland", value = FALSE),				# Finland
						HTML("<p>with Denmark"),
						checkboxInput("FRO", label = "Faroe Islands", value = FALSE),		# Denmark
						# checkboxInput("ESB", label = "Dhekelia Sovereign Base Area", value = FALSE),
						# checkboxInput("WSB", label = "Akrotiri Sovereign Base Area", value = FALSE),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						checkboxInput("DZA", label = "Algeria", value = FALSE),
						checkboxInput("AGO", label = "Angola", value = FALSE),
						checkboxInput("BEN", label = "Benin", value = FALSE),
						checkboxInput("BWA", label = "Botswana", value = FALSE),
						checkboxInput("BFA", label = "Burkina Faso", value = TRUE),
						checkboxInput("BDI", label = "Burundi", value = FALSE),
						checkboxInput("CMR", label = "Cameroon", value = FALSE),
						checkboxInput("CPV", label = "Cape Verde", value = FALSE),
						checkboxInput("CAF", label = "Central African Republic", value = FALSE),
						checkboxInput("TCD", label = "Chad", value = FALSE),
						checkboxInput("COM", label = "Comoros", value = FALSE),
						checkboxInput("COD", label = "Democratic Rep. Congo", value = FALSE),
						checkboxInput("DJI", label = "Djibouti", value = FALSE),
						checkboxInput("EGY", label = "Egypt", value = TRUE),
						checkboxInput("GNQ", label = "Equatorial Guinea", value = FALSE),
						checkboxInput("ERI", label = "Eritrea", value = FALSE),
						checkboxInput("ETH", label = "Ethiopia", value = TRUE),
						checkboxInput("GAB", label = "Gabon", value = FALSE),
						checkboxInput("GMB", label = "Gambia", value = FALSE),
						checkboxInput("GHA", label = "Ghana", value = TRUE),
						checkboxInput("GIN", label = "Guinea", value = FALSE),
						checkboxInput("GNB", label = "Guinea Bissau", value = FALSE),
						checkboxInput("CIV", label = "Ivory Coast", value = FALSE),
						checkboxInput("KEN", label = "Kenya", value = TRUE),
						checkboxInput("LSO", label = "Lesotho", value = FALSE),
						checkboxInput("LBR", label = "Liberia", value = FALSE),
						checkboxInput("LBY", label = "Libya", value = FALSE),
						checkboxInput("MDG", label = "Madagascar", value = TRUE),
						checkboxInput("MWI", label = "Malawi", value = TRUE),
						checkboxInput("MLI", label = "Mali", value = TRUE),
						checkboxInput("MRT", label = "Mauritania", value = TRUE),
						checkboxInput("MUS", label = "Mauritius", value = FALSE),
						checkboxInput("MAR", label = "Morocco", value = TRUE),
						checkboxInput("MOZ", label = "Mozambique", value = FALSE),
						checkboxInput("NAM", label = "Namibia", value = TRUE),
						checkboxInput("NER", label = "Niger", value = FALSE),
						checkboxInput("NGA", label = "Nigeria", value = FALSE),
						checkboxInput("COG", label = "Republic of the Congo", value = FALSE),
						checkboxInput("RWA", label = "Rwanda", value = FALSE),
						checkboxInput("STP", label = "Sao Tome and Principe", value = FALSE),
						checkboxInput("SEN", label = "Senegal", value = TRUE),
						checkboxInput("SYC", label = "Seychelles", value = FALSE),
						checkboxInput("SLE", label = "Sierra Leone", value = FALSE),
						checkboxInput("SOM", label = "Somalia", value = FALSE),
						checkboxInput("SOL", label = "Somaliland", value = FALSE),
						checkboxInput("ZAF", label = "South Africa", value = TRUE),
						checkboxInput("SSD", label = "South Sudan", value = FALSE),
						checkboxInput("SDN", label = "Sudan", value = TRUE),
						checkboxInput("SWZ", label = "Swaziland", value = FALSE),
						checkboxInput("TZA", label = "Tanzania", value = TRUE),
						checkboxInput("TGO", label = "Togo", value = FALSE),
						checkboxInput("TUN", label = "Tunisia", value = FALSE),
						checkboxInput("UGA", label = "Uganda", value = TRUE),
						checkboxInput("ZMB", label = "Zambia", value = TRUE),
						checkboxInput("ZWE", label = "Zimbabwe", value = TRUE),
						HTML("<p>disputed Morocco"),
						checkboxInput("ESH", label = "Western Sahara", value = FALSE),								# Morocco
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						checkboxInput("ATG", label = "Antigua and Barbuda", value = FALSE),
						checkboxInput("ARG", label = "Argentina", value = TRUE),
						checkboxInput("BRB", label = "Barbados", value = FALSE),
						checkboxInput("BLZ", label = "Belize", value = FALSE),
						checkboxInput("BOL", label = "Bolivia", value = TRUE),
						checkboxInput("BRA", label = "Brazil", value = TRUE),
						checkboxInput("CAN", label = "Canada", value = FALSE),
						checkboxInput("CHL", label = "Chile", value = TRUE),
						checkboxInput("COL", label = "Colombia", value = TRUE),
						checkboxInput("CRI", label = "Costa Rica", value = TRUE),
						checkboxInput("CUB", label = "Cuba", value = TRUE),
						checkboxInput("DMA", label = "Dominica", value = FALSE),
						checkboxInput("DOM", label = "Dominican Republic", value = FALSE),
						checkboxInput("ECU", label = "Ecuador", value = TRUE),
						checkboxInput("SLV", label = "El Salvador", value = TRUE),
						checkboxInput("GRD", label = "Grenada", value = FALSE),
						checkboxInput("GTM", label = "Guatemala", value = TRUE),
						checkboxInput("GUY", label = "Guyana", value = FALSE),
						checkboxInput("HTI", label = "Haiti", value = FALSE),
						checkboxInput("HND", label = "Honduras", value = TRUE),
						checkboxInput("JAM", label = "Jamaica", value = FALSE),
						checkboxInput("MEX", label = "Mexico", value = TRUE),
						checkboxInput("NIC", label = "Nicaragua", value = TRUE),
						checkboxInput("PAN", label = "Panama", value = TRUE),
						checkboxInput("PRY", label = "Paraguay", value = TRUE),
						checkboxInput("PER", label = "Peru", value = TRUE),
						checkboxInput("KNA", label = "Saint Kitts and Nevis", value = FALSE),
						checkboxInput("LCA", label = "Saint Lucia", value = FALSE),
						checkboxInput("VCT", label = "Saint Vincent and the Grenadines", value = FALSE),
						checkboxInput("SUR", label = "Suriname", value = FALSE),
						checkboxInput("BHS", label = "The Bahamas", value = FALSE),
						checkboxInput("TTO", label = "Trinidad and Tobago", value = FALSE),
						checkboxInput("USA", label = "United States of America", value = FALSE),
						checkboxInput("URY", label = "Uruguay", value = FALSE),
						checkboxInput("VEN", label = "Venezuela", value = FALSE),
						HTML("<p>with USA"),
						checkboxInput("PRI", label = "Puerto Rico", value = FALSE),								# USA
						# checkboxInput("UMI", label = "United States Minor Outlying Islands", value = FALSE),
						# checkboxInput("USG", label = "US Naval Base Guantanamo Bay", value = FALSE),
						HTML("<p>with UK"),
						checkboxInput("AIA", label = "Anguilla", value = FALSE),						# UK
						checkboxInput("BMU", label = "Bermuda", value = FALSE),								# UK
						checkboxInput("VGB", label = "British Virgin Islands", value = FALSE),					# UK
						checkboxInput("CYM", label = "Cayman Islands", value = FALSE),						# UK
						checkboxInput("FLK", label = "Falkland Islands", value = FALSE),					# UK
						checkboxInput("MSR", label = "Montserrat", value = FALSE),								# UK
						checkboxInput("SGS", label = "South Georgia and South Sandwich Islands", value = FALSE),	# UK
						checkboxInput("TCA", label = "Turks and Caicos Islands", value = FALSE),				# UK
						HTML("<p>with France"),
						checkboxInput("GUF", label = "French Guiana", value = FALSE),						# France
						checkboxInput("MAF", label = "Saint Martin", value = FALSE),							# France
						checkboxInput("SPM", label = "Saint Pierre and Miquelon", value = FALSE),				# France
						HTML("<p>with Netherlands"),
						checkboxInput("ABW", label = "Aruba", value = FALSE),							# Netherlands
						checkboxInput("CUW", label = "Curacao", value = FALSE),								# Netherlands
						checkboxInput("SXM", label = "Sint Maarten", value = FALSE),							# Netherlands
						HTML("<p>with Denmark"),
						checkboxInput("GRL", label = "Greenland", value = FALSE),
						HTML("<p>with Australia"),
						checkboxInput("HMD", label = "Heard Island and McDonald Islands", value = FALSE),	# Australia
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						checkboxInput("AFG", label = "Afghanistan", value = FALSE),
						checkboxInput("ARM", label = "Armenia", value = FALSE),
						checkboxInput("AZE", label = "Azerbaijan", value = FALSE),
						checkboxInput("BHR", label = "Bahrain", value = FALSE),
						checkboxInput("BGD", label = "Bangladesh", value = TRUE),
						checkboxInput("BTN", label = "Bhutan", value = FALSE),
						checkboxInput("BRN", label = "Brunei", value = TRUE),
						checkboxInput("KHM", label = "Cambodia", value = TRUE),
						checkboxInput("CHN", label = "China", value = TRUE),
						checkboxInput("CYP", label = "Cyprus", value = FALSE),
						checkboxInput("TLS", label = "East Timor", value = FALSE),
						checkboxInput("GEO", label = "Georgia", value = TRUE),
						checkboxInput("IND", label = "India", value = TRUE),
						checkboxInput("IDN", label = "Indonesia", value = TRUE),
						checkboxInput("IRN", label = "Iran", value = TRUE),
						checkboxInput("IRQ", label = "Iraq", value = FALSE),
						checkboxInput("ISR", label = "Israel", value = FALSE),
						checkboxInput("JPN", label = "Japan", value = TRUE),
						checkboxInput("JOR", label = "Jordan", value = TRUE),
						checkboxInput("KAZ", label = "Kazakhstan", value = FALSE),
						checkboxInput("KWT", label = "Kuwait", value = FALSE),
						checkboxInput("KGZ", label = "Kyrgyzstan", value = TRUE),
						checkboxInput("LAO", label = "Laos", value = TRUE),
						checkboxInput("LBN", label = "Lebanon", value = FALSE),
						checkboxInput("MYS", label = "Malaysia", value = TRUE),
						checkboxInput("MDV", label = "Maldives", value = FALSE),
						checkboxInput("MNG", label = "Mongolia", value = FALSE),
						checkboxInput("MMR", label = "Myanmar", value = TRUE),
						checkboxInput("NPL", label = "Nepal", value = TRUE),
						checkboxInput("PRK", label = "North Korea", value = FALSE),
						checkboxInput("CYN", label = "Northern Cyprus", value = FALSE),
						checkboxInput("OMN", label = "Oman", value = TRUE),
						checkboxInput("PAK", label = "Pakistan", value = TRUE),
						checkboxInput("PHL", label = "Philippines", value = TRUE),
						checkboxInput("QAT", label = "Qatar", value = TRUE),
						checkboxInput("SAU", label = "Saudi Arabia", value = FALSE),
						checkboxInput("SGP", label = "Singapore", value = TRUE),
						checkboxInput("KOR", label = "South Korea", value = FALSE),
						checkboxInput("LKA", label = "Sri Lanka", value = TRUE),
						checkboxInput("SYR", label = "Syria", value = TRUE),
						checkboxInput("TWN", label = "Taiwan", value = FALSE),
						checkboxInput("TJK", label = "Tajikistan", value = TRUE),
						checkboxInput("THA", label = "Thailand", value = TRUE),
						checkboxInput("TUR", label = "Turkey", value = TRUE),
						checkboxInput("TKM", label = "Turkmenistan", value = TRUE),
						checkboxInput("ARE", label = "United Arab Emirates", value = TRUE),
						checkboxInput("UZB", label = "Uzbekistan", value = TRUE),
						checkboxInput("VNM", label = "Vietnam", value = TRUE),
						checkboxInput("PSE", label = "Palestine", value = FALSE),				# Palestine
						checkboxInput("YEM", label = "Yemen", value = FALSE),
						HTML("<p>with China</p>"),
						checkboxInput("MAC", label = "Macau S.A.R", value = FALSE),				# China
						checkboxInput("HKG", label = "Hong Kong S.A.R.", value = FALSE),					# China
						HTML("<p>with Palestine</p>"),
						checkboxInput("Gaza", label = "Gaza", value = FALSE),								# Palestine
						HTML("<p>with Australia</p>"),
						checkboxInput("IOA", label = "Indian Ocean Territories", value = FALSE),			# Australia
						HTML("<p>with UK</p>"),
						checkboxInput("IOT", label = "British Indian Ocean Territory", value = FALSE),		# UK
						HTML("<p>to be removed</p>"),
						checkboxInput("CNM", label = "Cyprus No Mans Area", value = FALSE),
						checkboxInput("KAB", label = "Baykonur Cosmodrome", value = FALSE),
						checkboxInput("KAS", label = "Siachen Glacier", value = FALSE),
						checkboxInput("KNM", label = "Korea No Mans Area", value = FALSE),
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						checkboxInput("ATA", label = "Antarctica", value = FALSE),
						checkboxInput("AUS", label = "Australia", value = FALSE),
						checkboxInput("CLP", label = "Clipperton Island", value = FALSE),
						checkboxInput("CSI", label = "Coral Sea Islands", value = FALSE),
						checkboxInput("FSM", label = "Federated States of Micronesia", value = FALSE),
						checkboxInput("FJI", label = "Fiji", value = FALSE),
						checkboxInput("KIR", label = "Kiribati", value = FALSE),
						checkboxInput("MHL", label = "Marshall Islands", value = FALSE),
						checkboxInput("NRU", label = "Nauru", value = FALSE),
						checkboxInput("NZL", label = "New Zealand", value = FALSE),
						checkboxInput("PLW", label = "Palau", value = FALSE),
						checkboxInput("PNG", label = "Papua New Guinea", value = FALSE),
						checkboxInput("WSM", label = "Samoa", value = FALSE),
						checkboxInput("SLB", label = "Solomon Islands", value = FALSE),
						checkboxInput("TON", label = "Tonga", value = FALSE),
						checkboxInput("TUV", label = "Tuvalu", value = FALSE),
						checkboxInput("VUT", label = "Vanuatu", value = FALSE),
						HTML("<p>with Australia</p>"),
						checkboxInput("ASM", label = "American Samoa", value = FALSE),							# USA
						checkboxInput("NFK", label = "Norfolk Island", value = FALSE),							# Australia
						HTML("<p>with France</p>"),
						checkboxInput("PYF", label = "French Polynesia", value = FALSE),						# France
						checkboxInput("ATF", label = "French Southern and Antarctic Lands", value = FALSE),		# France
						checkboxInput("NCL", label = "New Caledonia", value = FALSE),							# France
						checkboxInput("BLM", label = "Saint Barthelemy", value = FALSE),						# France
						checkboxInput("WLF", label = "Wallis and Futuna", value = FALSE),						# France
						HTML("<p>with New Zealand</p>"),
						checkboxInput("COK", label = "Cook Islands", value = FALSE),							# New Zealand
						checkboxInput("NIU", label = "Niue", value = FALSE),									# New Zealand
						HTML("<p>with UK</p>"),
						checkboxInput("PCN", label = "Pitcairn Islands", value = FALSE),						# UK
						checkboxInput("SHN", label = "Saint Helena", value = FALSE),							# UK
						HTML("<p>with USA</p>"),
						checkboxInput("Ashm", label = "Ashmore and Cartier Islands", value = FALSE),			# Australia
						checkboxInput("GUM", label = "Guam", value = FALSE),									# USA
						checkboxInput("MNP", label = "Northern Mariana Islands", value = FALSE),				# USA
						checkboxInput("VIR", label = "United States Virgin Islands", value = FALSE),			# USA
						HTML("</div>")
					),
					column(2,
						HTML("<div class='well'>"),
						radioButtons("setMap", label = "",
							choices = list( "free selection" = "setFree"
							,"clear all" = "clearAll"
							,"add visited places" = "addMyVisits"
							, "add intended visits" = "addMyFutureVisits")
							,selected = "addMyVisits"),
						HTML("</div>")
					)	
				)
			),
			# tab 2 named Map: map visualisations
			tabPanel(HTML("My Map"),	  
				# sidebarlayout comes with main and sidebar panel
				sidebarLayout(
					# output with plot area + text area within well
					mainPanel(
						plotOutput("myWorld"),	
						HTML("<div class='well'>"),
						textOutput("myVisits"),
						HTML("</div>")
					),
					# input area with checkbox, radio button and a comment
					sidebarPanel(
						helpText("Click to show some information on my travels."),
						checkboxInput("checkVisited", label = "show visited places", value = FALSE),
						radioButtons("mapPlot", label = "",
							choices = list("visited countries (past/future)" = "visited"
							, "number of days per country" = "nrDays"
							, "year of first visit" = "visit1"
							, "year of last visit" = "visitN"
							, "number of visits" = "nrVisits"
							, "probability of visit" = "probVisit"
							, "expected future visiting days" = "expFutureDays"
							, "population size" = "population"
							, "population density" = "density"
							, "standard GDP" = "GDPc")
							,selected = "visit1"),
						p("For more information, visit ",a("Gondar's Way",href="http://gondar.tk"))
					)
				)
			),
			# tab 2 named Stat: includes statistical plot of data and summaries
			tabPanel(HTML("Stats"),	  
				sidebarLayout(
					# output area with plot area and within a well a text and table area
					mainPanel(
						fluidRow(
							column(4,
								HTML("<div class='well'>"),
								textOutput("myComments"),
								HTML("</div>")
							  ),
							column(8,
								plotOutput("myPlot")
							)
						),
						fluidRow(
								HTML("<p>"),
						
								HTML("</p>")
						),
						fluidRow(
							column(8,
								tableOutput("myTable")
							  ),
							column(4,
								HTML("<div class='well'>"),
								textOutput("myCommentsTable"),
								HTML("</div>")
							)					
						)
					),
					# input area with comments, and a radio button
					sidebarPanel(
						helpText("Click to show some information on my travels."),
						radioButtons("stats", label = "",
							choices = list("barplot visited countries per region" = "barVisit"
							, "barplot number of days per country / region" = "barDays"
							, "table of visited countries per regions" = "myTable")
							,selected = "barVisit"),
						p("For more information, visit ",a("Gondar's Way",href="http://gondar.tk"))
					)
				)
			)
		)  
	)
)