% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EMMAgeo-package.R
\docType{package}
\name{EMMAgeo-package}
\alias{EMMAgeo-package}
\alias{EMMAgeo}
\title{End-member modelling algorithm and supporting functions for unmixing
grain-size distributions and further compositional data.}
\description{
EMMAgeo provides a set of functions for end-member modelling analysis
(EMMA) of grain-size data and other cases of compositional data. EMMA
describes a multivariate data set of m samples, each comprising n parameters
(e.g. grain-size classes), as a linear combination of end-member loadings
(the underlying distributions) and end-member scores (the contribution of
each loading to each sample).\cr EMMA can be run in two principal ways,
a deterministic and a robust, including modelling the uncertainties. The
deterministic way can be accessed simply with the function \code{EMMA()}.
For the robust way there are two protocols that need to be respected. There
is a compact protocol, which is mainly automated but needs adjustments by
the user, and there is an extended protocol, which allows access to all
parameterisation steps of robust EMMA.\cr The package contains further
auxiliary functions to check and prepare input data, test parameters and
use a graphic user interface for deterministic EMMA. The package also
contains an example data set, comprising meaured grain-size distributions
of real world sediment end-members.
}
\details{
\tabular{ll}{ Package: \tab EMMAgeo\cr Type: \tab Package\cr Version: \tab
0.9.8\cr Date: \tab 2025-03-24\cr License: \tab GPL-3\cr }
}
\author{
Michael Dietze, Elisabeth Dietze
}
\keyword{package}
