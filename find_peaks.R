# 2016-10-20
# Simple peak-finder for mr datasets.
# SH

peaks_dir <- Sys.getenv("QA_PEAKS_DIR")

vals_fname <- paste0(peaks_dir, '/orig_vals')
png_fname <- paste0(peaks_dir, '/peaks.png')
peaks_fname <- paste0(peaks_dir, '/peaks.txt')

# load the data
xdat <- read.table(vals_fname, as.is = TRUE, header = FALSE, sep = " ")

# plot this
png(png_fname, height = 960, width = 1280)
#dev.new(height = 5, width = 9)
plot(xdat, 
     type = "l", 
     col = "blue", 
     xlab = "pixel value", 
     ylab = "Frequency (count)")

# peak identification and plotting
# Maybe define a peak threshold?
pthresh <- 300
smoothCounts <- ksmooth(x = xdat[,1], 
                        y = xdat[,2], 
                        kernel = "normal", 
                        bandwidth = 10)
dsmooth <- diff(smoothCounts$y)
locmax <- sign(c(0, dsmooth)) > 0 & sign(c(dsmooth, 0)) < 0
lines(smoothCounts, col = "red")
points(smoothCounts$x[locmax & smoothCounts$y > pthresh], 
       smoothCounts$y[locmax & smoothCounts$y > pthresh], 
       cex = 3, 
       col = "red", 
       lwd = 3)
dev.off()

sink(peaks_fname)
cat(smoothCounts$x[locmax & smoothCounts$y > pthresh], sep="\n")
sink()

# eof
