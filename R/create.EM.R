#' Create grain-size-distributions.
#' 
#' This function allows creating artificial grain-size end-members. One such
#' "artificial end-member loading" may be composed of one or more superimposed
#' normal distributions.
#' 
#' When building a data set of many artificial end member loadings, these 
#' should all have the same \code{boundaries} and \code{n}. The function 
#' builds composites of individual normal distributions. Each distribution is 
#' scaled according to \code{s}. Finally the distribution is scaled to 100 \%.
#' 
#' @param p1 \code{Numeric} vector, means of normal distributions, i.e. mode
#' positions.
#' 
#' @param p2 \code{Numeric} vector, standard deviations of normal 
#' distributions, i.e. mode width.
#' 
#' @param s \code{Numeric} vector, relative proportions of each mode, i.e.
#' relative mode height.
#' 
#' @param boundaries \code{Numeric} vector of length two with class boundaries 
#' (i.e. \code{c(lower boundary, upper boundary)}).
#' 
#' @param n \code{Numeric} scalar with number of classes, i.e. resolution of 
#' the end-member.
#' 
#' @return \code{Numeric} vector with normalised end-member loadings, 
#' consisting of the mixed normal distributions according to the input 
#' parameters.
#' 
#' @author Michael Dietze, Elisabeth Dietze
#' 
#' @seealso \code{mix.EM}
#' 
#' @keywords EMMA
#' 
#' @examples
#' 
#' ## set lower and upper class boundary, number of classes and class units
#' boundaries <- c(0, 11)
#' n <- 40
#' phi <- seq(from = boundaries[1], 
#'            to = boundaries[2], 
#'            length.out = n)
#' 
#' ## create two artificial end-member loadings
#' EMa.1 <- create.EM(p1 = c(2, 5), p2 = c(1, 0.8), s = c(0.7, 0.3), 
#'                    boundaries = boundaries, n = n)
#' EMa.2 <- create.EM(p1 = c(4, 7), p2 = c(1.1, 1.4), s = c(0.5, 0.5),
#'                    boundaries = boundaries, n = n)
#' 
#' ## plot the two artificial end-member loadings
#' plot(phi, EMa.1, type = "l")
#' lines(phi, EMa.2, col = "red")
#' 
#' @export create.EM
create.EM <- function(
  p1,
  p2, 
  s, 
  boundaries, 
  n
){

  ## create result matrix
  EM <- matrix(nrow = length(p1), ncol = n)
  
  ## create class values according to normal distribution parameters
  for (i in 1:length(p1)) {
    EM[i,] <- 1/(p2[i] * sqrt(pi)) * exp(-0.5 * ((seq(boundaries[1], 
      boundaries[2], length.out = n) - p1[i]) / p2[i])^2)
    EM[i,] <- EM[i,]/max(EM[i,]) * s[i]
  }
  
  ## combine individual class values and rescale the result
  EM <- apply(EM, 2, sum)
  EM <- as.vector(EM / sum(EM))
  
  return(EM)
}