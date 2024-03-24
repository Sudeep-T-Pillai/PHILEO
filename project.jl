using Omniscape
using Printf
using Rasters
using Plots
run_omniscape("C:\\Users\\YOSHUA~1\\AppData\\Local\\Temp\\RtmpWAeYkj\\omniscape_1\\cum_currmap.tif")
current = Raster("C:\\Users\\YOSHUA~1\\AppData\\Local\\Temp\\RtmpWAeYkj\\omniscape_1\\cum_currmap.tif")
plot(current,
            title = "Cumulative Current Flow", xlabel = "Easting", ylabel = "Northing",
            seriescolor = cgrad(:inferno, [0, 0.005, 0.03, 0.06, 0.09, 0.14]),
                 size = (700, 640))
savefig("C:\\Users\\YOSHUA~1\\AppData\\Local\\Temp\\RtmpWAeYkj\\omniscape_1\\cum_currmap.png")
normalized_current = Raster("C:\\Users\\YOSHUA~1\\AppData\\Local\\Temp\\RtmpWAeYkj\\omniscape_1\\normalized_cum_currmap.tif")
plot(normalized_current,
            title = "Normalized Current Flow", xlabel = "Easting", ylabel = "Northing",
            seriescolor = cgrad(:inferno, [0, 0.005, 0.03, 0.06, 0.09, 0.14]),
                 size = (700, 640))
savefig("C:\\Users\\YOSHUA~1\\AppData\\Local\\Temp\\RtmpWAeYkj\\omniscape_1\\normalized_cum_currmap.png")
