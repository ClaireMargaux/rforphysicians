library(readr)

# Import reference data set
merged_nhanes <- read.csv("/home/claire/Documents/GitHub/rforphysicians/data_sets/merged_nhanes.csv")

# Define fixed-width column specs
fwf_specs <- fwf_positions(
  start = c(1, 15, 16, 17, 18, 21, 22, 44, 47),
  end   = c(5, 15, 16, 17, 20, 21, 22, 46, 49),
  col_names = c("SEQN", "ELIGSTAT", "MORTSTAT", "CAUSEAVL",
                "UCOD_LEADING", "DIABETES", "HYPERTEN",
                "PERMTH_INT", "PERMTH_EXM")
)

# Load mortality data
mortality_df <- read_fwf(
  file = "~/Documents/GitHub/rforphysicians/data_sets/NHANES_2011_2012_MORT.dat",
  col_types = "iiiiciinnn",
  fwf_specs,
  na = c("", ".")
)

# Merge with NHANES dataset on SEQN
merged_nhanes_with_mort <- merge(
  merged_nhanes,
  mortality_df,
  by = "SEQN",
  all.x = TRUE
)

# Inspect newly merged data
head(merged_nhanes_with_mort[, c("SEQN", "MORTSTAT", "PERMTH_INT")])

# Save newly merged data
write.csv(
  merged_nhanes_with_mort,
  file = "~/Documents/GitHub/rforphysicians/data_sets/merged_nhanes_with_mort.csv",
  row.names = FALSE
)
