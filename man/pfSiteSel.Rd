% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pfSiteSel.R
\name{pfSiteSel}
\alias{pfSiteSel}
\title{GCD sites selection methods}
\usage{
pfSiteSel(...)
}
\arguments{
\item{...}{Any combination of conditions defined by relational operators and
or logical operators that are applied on the "paleofiresites" dataset. See
examples below:}
}
\value{
An object of the class "pfSiteSel" (list) with "id_site" and
"site_name" components.
}
\description{
Main function used for site selection, uses data strored in
data(paleofiresites) to perform site selection according to multiple
criterion, those criterions could be either geographic, based on series
attributes (e.g. # of datings), or on sites attributes (e.g. biome).
}
\details{
Use data(paleofiresites);names(paleofiresites) to retrieve the conditions
that could be used to select sites i.e.: id_site, site_name, lat, long,
elev, pref_units, biome, id_region, id_country, id_site_type, water_depth,
id_basin_size, id_catch_size, id_land_desc, dating_type, min_est_age,
max_est_age, num_dating, age_model, data_source, qtype, rf99, l12, num_samp,
date_int.
}
\examples{

## Sites selection examples

## Select all sites
ID=pfSiteSel()

## Savana sites in Ramankutty and Foley (1999)
ID=pfSiteSel(rf99==9)
plot(ID,zoom="world")

## Tropical forest and tundra such as Levavasseur et al. (2012)
ID=pfSiteSel(l12==6 | l12==7)
plot(ID,zoom="world")

## Sites in North America by geographic location
ID=pfSiteSel(lat>25, lat<75, long<(-45), long>-150) 
plot(ID,zoom="world")

## is equivalent to:
ID=pfSiteSel(lat>25 & lat<75 & long<(-45) & long>-150) 
plot(ID,zoom="world")

## By region criterion
ID=pfSiteSel(continent=="North America")
plot(ID,zoom="world")

## Pas-de-Fond site
pfSiteSel(site_name=="Pas-de-Fond")

## All sites in  eastern North America that are not Pas-de-Fond
pfSiteSel(site_name!="Pas-de-Fond", continent=="North America", long>-100)

## Sites with on average one dating point every 250 to 300 yrs
pfSiteSel(date_int>=250 & date_int<=300)

## Sites between 0, 100 m elevation in Asia
ID=pfSiteSel(elevation>0 & elevation<100, continent=="Asia")

## All sites that are not marine nor fluvial
# ID=pfSiteSel(id_land_desc!="MARI" , id_site_type!="FLUV" & id_site_type!="LFLU") # v.4.0.1 to come
# plot(ID)


}
\seealso{
\code{\link[GCD]{paleofiresites}}
}
\author{
O. Blarquez
}
