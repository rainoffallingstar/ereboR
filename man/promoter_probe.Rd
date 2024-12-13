% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/moriaclass.R
\name{promoter_probe}
\alias{promoter_probe}
\alias{MoriaClass}
\title{promoter with gene annotation}
\format{
A data frame with promoter island with gene annotation.
MoriaClass

MoriaClass:In the Mines of Moria, you can feel the past, and the shadow of the present despair.
this is an R6 object for TGCA_GEO_Miner/download
}
\value{
R6 object
}
\description{
A database of promoter island with gene annotation information.
}
\examples{
laml <- MoriaClass$new(mine = "TCGA-LAML",Dwarf_worker = "TGCA")
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{mine}}{character NULL the id of TGCA project or GEO repo}

\item{\code{Dwarf_worker}}{character "TGCA"/"GEO" the repos}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-TGCA_GEO_Miner-new}{\code{MoriaClass$new()}}
\item \href{#method-TGCA_GEO_Miner-info}{\code{MoriaClass$info()}}
\item \href{#method-TGCA_GEO_Miner-download}{\code{MoriaClass$download()}}
\item \href{#method-TGCA_GEO_Miner-clone}{\code{MoriaClass$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TGCA_GEO_Miner-new"></a>}}
\if{latex}{\out{\hypertarget{method-TGCA_GEO_Miner-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MoriaClass$new(mine = NULL, Dwarf_worker = "TGCA")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{mine}}{character NULL the id of TGCA project or GEO repo}

\item{\code{Dwarf_worker}}{character "TGCA"/"GEO" the repos}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TGCA_GEO_Miner-info"></a>}}
\if{latex}{\out{\hypertarget{method-TGCA_GEO_Miner-info}{}}}
\subsection{Method \code{info()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MoriaClass$info()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
str
begin download
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TGCA_GEO_Miner-download"></a>}}
\if{latex}{\out{\hypertarget{method-TGCA_GEO_Miner-download}{}}}
\subsection{Method \code{download()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MoriaClass$download(sup = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{sup}}{logit download sup file when TRUE}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
list
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TGCA_GEO_Miner-clone"></a>}}
\if{latex}{\out{\hypertarget{method-TGCA_GEO_Miner-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MoriaClass$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
