# Lesson 9 participation

#Definitions---------------------------------------------------
#Coordinate reference systems (crs): spatial reference system used to organise and
# orient spatial information
#EPSG registry: public registry for various cordinate reference systems
#  •	4326                       #code for a crs often used in michigan
#  •	29616                      #code for a crs often used in michigan
#Geographic coordinate system: Spherical/elipsoidal cordinate system in untis 
# of longitude/latidute
#  •	Longitude/Latitude
#Projected coordinate system: planar/grid cordinate system, in units 
# of northing/easting
#  •	Northing/Easting
#  •	Universal Transverse Mercator (UTM)
#  o	Lansing is in UTM 16N or (more specifically) 16T

#Questions
#  o	Why do we need to use different datums?
# Datums are the rules that a specific projection uses to convert the spherical 
# surface of the earth to a flat plane for mapping. Different datums may need to 
# be used, for example some are site-specific (ex: UTM16N for Michigan), and some
# more accuratly preserve scale across a larger area (ex: WGS84).

#  o	What is a false northing/easting?  Why is this used?
# False norhting/easting are linear values applied to the origin of the x/y 
# coordinates. This is typically done to ensure that all x and y values are 
# positive.
