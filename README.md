# Sleep Cycle Analysis
Visualizing data from the [Sleep Cycle](http://www.sleepcycle.com/) phone app in R.

Export the Sleep Cycle data and place it in the project location. In the app, go to Settings > Advanced > Database > Export Database. Input your email address. Once you receive the email, save the "sleepdata.csv" attachment in the same location as these project files.

In RStudio, load the sleep.Rmd R Markdown file. Click the "Knit HTML" button to generate the HTML file containing your sleep charts.

Requires the R library "ggplot2". If necessary, install by running the R command `install.packages("ggplot2")` (only needs to be run once).

### Project Files

* __sleep.R__ is the R script that loads and cleans the data from the "sleepdata.csv" file. It is called from the R Markdown file automatically.

* __sleep.Rmd__ is the R Markdown file that generates the plots. It can be exported to an HTML or PDF file.

* __sleepdata.csv__ contains sample data. Replace this file with your own data from the phone app.

* __sleepdata.Rproj__ is the RStudio project file.
