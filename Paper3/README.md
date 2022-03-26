# Socio-economic dependents for Future Children Intention

We use the Canadian GSS 2017 data to study social trends in order to study socio-economic dependents that lead to Canadian's future intention of children.

The Data is available here: http://www.chass.utoronto.ca/ for University of Toronto Students. Navigate to the Data Centre > UofT Users or http://dc.chass.utoronto.ca/myaccess.html. Select the SDA @ CHASS Option on the left hand column of the webpage and sign in with your institutional account. We used the 2017 GSS data for our analysis. Select the data listed against General social survey on Family (cycle 31), 2017. Click on Download > Customized Subset to select a CSV Data file with the Data Definitions stated in STATA. Select all the available variables and create the files to download and save the file as raw_data in inputs/data. 

Download the files gss_labels.txt and gss_dict.txt from inputs/data. Run the 01-gss_cleaning.R file in order to create the gss.csv data file in outputs/data. The gss.csv file is read by the Markdown File in outputs/paper in order to conduct our analysis. The final paper is exported with the figures as paper.pdf in outputs/paper.