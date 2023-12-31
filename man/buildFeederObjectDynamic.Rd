\name{buildFeederObjectDynamic}
\alias{buildFeederObjectDynamic}

\title{
  Building Feeder-Object for the integration to the PKN
}

\description{
  This function estimates the possible mechanisms of interactions to be added to the PKN from a database of interactions for improving the fitting cost.
}

\usage{
buildFeederObjectDynamic(model = model, cnolist = cnolist, indices = indices, database = NULL, DDN = TRUE, pathLength = 2, k = 2, measErr = c(0.1, 0), timePoint = NA)
}


\arguments{
  \item{model}{a model as returned by readSIF. Alternatively, the filename can also be provided}
  \item{cnolist}{a cnolist structure, as produced by \link{makeCNOlist}}
  \item{indices}{a list of indices of poorly fitted measurements as returned from \link{identifyMisfitIndices}}
  \item{database}{a database of interactions which can be optionally provided as an interaction matrix with 3 or 4 colums (source of interaction, sign of interaction, target of interaction and optionally a weight value from 0 to 1 indicating the significance of that interaction in the database). Default: database=NULL}
  \item{DDN}{a parameter indicating whether integrating links inferred from the Data-Driven FEED approach. Default: DDN = TRUE}
  \item{pathLength}{a path length parameter for the maximal path length of additional interactions to search for in the database. Default: pathLength = 2}
  \item{k}{a parameter that determine the threshold of significancy of the effect of stimuli and inhibitors, default to 2}
  \item{measErr}{a 2 value vector (err1, err2) defining the error model of the data as sd^2 = err1^2 + (err2*data)^2, default to c(0.1, 0)}
  \item{timePoint}{time-points to be considered. By default set to NA, which means that the function will search for poorly fitted measurements at each time-point.}
}
\details{
The function identifies and proposes the new links to integrate in the PKN either either by means of the data-driven method from the FEED algorithm or from the provided database of interactions or from both of them.
}

\value{
this function returns a list with fields:
\item{Original PKN}{the original PKN}
\item{Feed mechanisms}{the list of proposed interactions to integrate to the PKN (if both the database and the data-driven method are considered by the user, the last mechanism corresponds to the data-driven approach)}

}

\author{
    E.Gjerga
}
\examples{
data(ToyModel_Gene, package="CNORfeeder")
data(CNOlistToy_Gene, package="CNORfeeder")
data(simData_toy,package="CNORfeeder")


feederObject = buildFeederObjectDynamic(model = model, cnolist = cnolist,
                                        indices = NULL, database = NULL,
                                        DDN = TRUE, pathLength = 2)
}