#' Define mode limits by mouse clicks.
#' 
#' This function allows defining limits for robust end-members by mouse clicks
#' on a combined plot output, showing a histogram and all end-members together.
#' Clicks must be placed in the order lower limit, upper limit - for each
#' end-member successively.
#' 
#' @param data \code{List} object, output of \code{test.robustness}.
#' 
#' @param n \code{Numeric} scalar, number of target end-members.
#' 
#' @param classunits \code{Numeric} vector, optional class units (e.g. 
#' micrometers or phi-units).
#' 
#' @return \code{Numeric} matrix, limit classes. The first row contains lower
#' limits, the second row upper limits for each end-member.
#' 
#' @author Michael Dietze, Elisabeth Dietze
#' 
#' @seealso \code{test.robustness}, \code{robust.EM}
#' 
#' @keywords EMMA
#' 
#' @examples
#' 
#' ## load example data set
#' data(example_X)
#' 
#' ## Test robustness
#' q <- 4:7
#' l <- seq(from = 0, to = 0.1, by = 0.02)
#' TR <- test.robustness(X = X, q = q, l = l)
#' 
#' ## define 2 limits by mouse clicks (uncomment to use).
#' # limits <- click.limits(data = TR, n = 2)
#' # limits  
#' 
#' @export click.limits
click.limits <- function(
  data,
  n,
  classunits
){
  
  ## check/set classunits vector
  if(missing(classunits) == TRUE) classunits <- 1:ncol(data$Vqsn)

  ## adjust plot margins
  par(oma = c(0, 1, 0, 0))

  ## create histogram with rugs
  hist(data$modes, 
       breaks = classunits, 
       main = "Mode positions", 
       xlab =  "Class",
       col = "black")
  rug(data$modes)

  ## add end-member loadings as grey lines
  par(new = TRUE)
  plot(NA, xlim = range(classunits), ylim = range(data$Vqsn), 
       main = "", xlab = "", ylab = "", 
       axes = FALSE, frame.plot = FALSE)
  for(i in 1:nrow(data$Vqsn)) {
    lines(classunits, data$Vqsn[i,], col = "grey")
  }
                             
  ## define auxiliary variables
  limits <- numeric(2 * n)
  colours <- rep(seq(1, n), each = 2)

  ## get mouseclick coordiantes for each limit
  for(i in 1:length(limits)) {
    limits[i] <- locator(1, type = "n")$x
    abline(v = limits[i], col = colours[i])
  }
                             
  ## transform limits vector to matrix
  limits <- matrix(data = limits, ncol = n)
  
  ## return result
  return(limits)
}