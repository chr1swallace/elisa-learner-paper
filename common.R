library(magrittr)
library(data.table)
library(ggplot2)
library(cowplot); theme_set(theme_cowplot())

## data location
dsp <- "~/rds/rds-cew54-wallace-share/Data/elisa-learner-in" # input data, seroprevalence-paper data
d <- "~/rds/rds-cew54-wallace-share/Data/elisa-learner-out" # output data on this project
NFOLDS <- 9 # number of different fold strategies
NFOLD_REPS <- 10 # number of fold values
list.files(d)

## pregnant and blood donors
file_xlsx_v1 <- file.path(dsp, "200606 Chris Donors and Pregnant Cohorts.xlsx")
file_xlsx_v2  <- file.path(dsp, "200608 BD + Preg All Values.xlsx")
file_xlsx_v3  <- file.path(dsp, "200609 BD + Preg All Values.xlsx")
file_xlsx_v4 <- file.path(dsp,"200705 BD Preg Wks 14-25.xlsx")
file_xlsx_v5 <- file.path(dsp,"200708 S Re-run .xlsx")
## file_xlsx_v6 <- file.path(d,"200923 BD PW Wks 30-34 S RBD IgG.xlsx")
file_xlsx_v7 <- file.path(dsp,"200928 BD PW Wk33 re-run S IgG.xlsx")
file_xlsx_v8 <- file.path(dsp,c("201007_Additional_300_neg_ctrls__ENS_.xlsx","201002_Additonal_ENS_training_data.xlsx"))
file_xlsx_v9 <- file.path(dsp,"201216_BDPW_Wk45-50.xlsx")
file_xlsx_v10 <- file.path(dsp,"210308_BDPW_Wks4-8.xlsx")

## patient samples
file2_xlsx_v1 <- file.path(dsp,"200619 Patient Data for Chris - regression.xlsx")
file2_xlsx_v2 <- file.path(dsp,"200626 Chris, Stas Updated Patient File.xlsx")
file2_xlsx_v3 <- file.path(dsp,"200627 Updated data table, Chris, Stas.xlsx")
file2_xlsx_v5 <- file.path(dsp,"200712 Clin Data + Neuts - DUPS REMOVED + PCR.xlsx")

file_rdata=file.path(d,"data-learner-210315.RData")
