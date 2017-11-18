#!/usr/bin/Rscript


rm(list = ls())
library(rhdf5)
library(R.matlab)
library(ncdf4)


# ====== ============= READ DATA ====================
#[1] OPEN COORDINATE DATA 
dr = dir("../data/",pattern = "lat")
lonlat = readMat(sprintf("../data/%s",dr))
length(lonlat)
names(lonlat)
dim(lonlat$lat)
#[2] OPEN HDF FILE DERRIVED AHI
f = "Himawari08_AHI_L2_Cloud_20160525_0500.hdf"
hd=h5ls(sprintf("../data/%s",f))

# ====================== PARAMETER YANG DIPILIH ======================
# cloud optical depth
# cloud particle effective radius
# cloud top pressure

CTP <- h5read(sprintf("../data/%s",f), "cloud_top_pressure")
CODIR <- h5read(sprintf("../data/%s",f), "cloud_optical_depth_ir")
CODVIS <- h5read(sprintf("../data/%s",f), "cloud_optical_depth_vis")
CER <- h5read(sprintf("../data/%s",f), "cloud_particle_effective_radius")
# image(CTP,col=grey)
source("filterdata.R")