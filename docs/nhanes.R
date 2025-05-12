# Install and load the necessary package
install.packages('nhanesA')  # Install the package (run this only once)
library(nhanesA)

# Download NHANES tables for 2011-2012
demo <- nhanes("DEMO_G")   # Demographics (cycle G = 2011–2012)
bpx  <- nhanes("BPX_G")    # Blood pressure
bmx  <- nhanes("BMX_G")    # Body measures
smq  <- nhanes("SMQ_G")    # Smoking questionnaire

# Save data frames as CSV files
# Save data frames as CSV files to the specified directory
write.csv(demo, "/home/claire/Documents/GitHub/rforphysicians/data_sets/DEMO_G.csv", row.names = FALSE)
write.csv(bpx, "/home/claire/Documents/GitHub/rforphysicians/data_sets/BPX_G.csv", row.names = FALSE)
write.csv(bmx, "/home/claire/Documents/GitHub/rforphysicians/data_sets/BMX_G.csv", row.names = FALSE)
write.csv(smq, "/home/claire/Documents/GitHub/rforphysicians/data_sets/SMQ_G.csv", row.names = FALSE)