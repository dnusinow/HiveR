\name{mineHPD}
\alias{mineHPD}
\title{
Examine (mine) a HivePlotData object and extract information contained within it
}
\description{
A \code{HivePlotData object}, especially one created fresh using \code{\link{dot2HPD}}, generally contains a lot of hidden information about the network described. This function can extract this hidden information.  This function has \code{option}s which are quite specific as to what they do.  The user can easily write new options and incorporate them (or send them to me for incorporation).  This function can be called multiple times using different options to gradually modify the \code{HivePlotData} object.
}
\usage{
mineHPD(HPD, option = "rad <- tot.edge.count")
}
\arguments{
  \item{HPD}{
A \code{\link{HivePlotData}} object.
}
  \item{option}{
A character string giving the option desired.  See Details for current options.
}
}
\details{
\code{option = "rad <- tot.edge.count"}  This option looks through the \code{HivePlotData} object and determines how many edges start or end on each node (the "degree").  This value is then assigned to the radius for that node.
\cr
\cr
\code{option = "axis <- source.man.sink"}  This option examines the nodes and corresponding edges in a \code{HivePlotData} object to determine if the node is a source, manager or sink.  A source node only has outgoing edges.  A sink node only has incoming edges.  A manager has both.  Hence, this option treats the \code{HivePlotData} object as if it were directed in that the first node of an edge in will be in \code{HPD$nodes$id1} and the second node of an edge will be in \code{HPD$nodes$id2}.  As a result, this option produces a hive plot with 3 axes (note: sources are on axis 1, sinks on axis 2, and managers on axis 3). This concept is similar to the idea of \code{\link[FuncMap]{FuncMap}} but the internals are quite different.  See also \code{\link{dot2HPD}} for some details about processing .dot files in an agnostic fashion.
\cr
\cr
\code{option = "remove orphans"} removes nodes that have degree zero (no incoming or outgoing edges).
\cr
\cr
\code{option = "remove zero edge"} removes edges with length zero, which includes edges that start and end at the same node (as in \code{option = "remove self edge"}) as well as edges that are zero length because the axis and radius of the start and end nodes just happen to be the same.  The node coordinates are the criteria: if an edge starts on a given axis at a given radius and ends at the same point, it is removed.
\cr
\cr
\code{option = "remove self edge"} removes edges that start and end on the same node.  This differs from \code{option = "remove zero edge"} in that it is the node labels that are compared rather than the node coordinates.
}
\value{
A modified \code{HivePlotData} object.
}
\author{
Bryan A. Hanson, DePauw University. \email{hanson@depauw.edu}
}
\references{
\url{http://academic.depauw.edu/~hanson/HiveR/HiveR.html}
}
\seealso{
See the vignette for an example of using this function.  Use \code{> vignette("HiveR")} to produce the vignette.
}
\keyword{ utilities }