# Ashlee Abdel-Razeq
# integrate monthly UFO data into a single file

rm(list=ls())

setwd("./monthly_sightings")
getwd()

csv_files <- list.files(pattern = ".csv")

combined_data <- data.frame()

for (file in csv_files) {
  data <- read.csv(file)
  combined_data <- rbind(combined_data, data)
}

combined_data[duplicated(combined_data),]
combined_data <- unique(combined_data)

#combined_data$country <- gsub("Netherlands The", "Netherlands", combined_data$country)
#combined_data$country <- gsub("United Kingdon", "United Kingdom", combined_data$country)
#combined_data$country <- gsub("Unioted Kingdom", "United Kingdom", combined_data$country)


write.csv(combined_data, "/Users/ashleeabdelrazeq/Desktop/combined_data.csv")

# Save the combined data to a CSV file with UTF-8 encoding and without row numbers
write.csv(combined_data, "ufo_sightings.csv", row.names = FALSE, fileEncoding = "UTF-8")
