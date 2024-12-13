# WARNING - Generated by {fusen} from dev/flat_first.Rmd: do not edit by hand

#' promoter with gene annotation
#' @name promoter_probe
#' @description A database of promoter island with gene annotation information.
#' @format A data frame with promoter island with gene annotation.

#' MoriaClass
#' 
#' MoriaClass:In the Mines of Moria, you can feel the past, and the shadow of the present despair.
#' this is an R6 object for TGCA_GEO_Miner/download
#' 
#' @field mine character NULL the id of TGCA project or GEO repo
#' @field Dwarf_worker character "TGCA"/"GEO" the repos
#' 
#' @return R6 object
#' 
#' @export
#' @examples
#' laml <- MoriaClass$new(mine = "TCGA-LAML",Dwarf_worker = "TGCA")
MoriaClass <- R6::R6Class(
  "TGCA_GEO_Miner", 
  public = list(
    mine = NULL,
    Dwarf_worker = NULL,
    
#' @param mine character NULL the id of TGCA project or GEO repo
#' @param Dwarf_worker character "TGCA"/"GEO" the repos
    initialize = function(mine = NULL,
                          Dwarf_worker = "TGCA") {
      self$mine <- mine
      self$Dwarf_worker <- Dwarf_worker
      self$info()
    },
#' @method info
#' 打印R6对象的信息
#' 
#' @return str
    info = function() {
      message("MoriaClass:In the Mines of Moria, you can feel the past, and the shadow of the present despair.this is an R6 object for TGCA_GEO_Miner/download")
    },
#' begin download
#' @method download task
#' @param sup logit download sup file when TRUE
#' @return list
    download = function(sup = TRUE){
      get_gdc_data <- function(project,dataca = "Transcriptome Profiling",
                               data_type = "Gene Expression Quantification"){
        library(SummarizedExperiment)
        if (dataca == "Clinical") {
          query_result <- TCGAbiolinks::GDCquery(project = project,
                                   data.category = dataca,
                                   data.format = "bcr xml") 
          
        } else {
          query_result <- TCGAbiolinks::GDCquery(
            project = project, 
            data.category = dataca,
            data.type = data_type,
            workflow.type = "STAR - Counts")
          process_query <- TCGAbiolinks::getResults(query_result ,cols = "cases") 
          index <- duplicated(process_query)
          process_query2 <- process_query[!index] 
          query_result <- TCGAbiolinks::GDCquery(
            project = project, 
            data.category = dataca,
            data.type = data_type,
            workflow.type = "STAR - Counts",
            barcode = process_query2)
        }
        TCGAbiolinks::GDCdownload(query_result,method="api")
        if (dataca == "Clinical") {
          data_pre <- TCGAbiolinks::GDCprepare_clinic(query_result, clinical.info = "patient")
          
        } else {
          data_pre <- TCGAbiolinks::GDCprepare(query_result)
        }
        return(data_pre)
      }
      
      if (self$Dwarf_worker == "TGCA"){
        library(SummarizedExperiment)
        tgca_gene <- get_gdc_data(self$mine)
        tgca_clinical <- get_gdc_data(self$mine,dataca = "Clinical")
        counts <- as.data.frame(assay(tgca_laml_gene))
        data <- as.data.frame(rowRanges(tgca_laml_gene))
        expr_count = cbind(gene_type=data$gene_type,gene_name=data$gene_name,counts)
        data <- list(
          arraydata = expr_count,
          pdata = tgca_clinical
        )
        return(data)
      } else if (self$Dwarf_worker == "GEO"){
        message("download from GEO, creating data dir...")
        fs::dir_create('temp')
        data <- GEOquery::getGEO(self$mine,destdir = 'temp')
        if (length(data) > 1){
          datalist <- list()
        } else {
          datalist <- NULL
        }
        
        for (i in 1:length(data)){
          arraydata <- data[[i]]@assayData$exprs
          pdata <- data[[i]]@phenoData@data
          supplementary_file = data[[i]]@experimentData@other$supplementary_file
          if (is.null(supplementary_file)) {
            supplementary_file <- NA
          }
          metadata <- data.frame(
            gseid = self$mine,
            platform = data[[i]]@annotation,
            title = data[[i]]@experimentData@title,
            abstract = data[[i]]@experimentData@abstract,
            summary =  data[[i]]@experimentData@other$summary,
            supplementary_file = supplementary_file,
            type = data[[i]]@experimentData@other$type,
            samplenum = nrow(data[[i]]@phenoData@data)
          )
        if (nrow(arraydata) == 0 & sup){
          message("array not found, download supplementary to data dir")
          fs::dir_create(paste0("data/",self$mine,"_",i))
          ftps <- metadata$supplementary_file[1]
          ftps <- stringr::str_split(ftps,"\n")
          ftps <- ftps[[1]]
          for (a in 1:length(ftps)){
            filename <- stringr::str_split(ftps[a],"/")
            filename <- filename[[1]]
            filename <- filename[length(filename)]
            localfilepath <- paste0("data/",self$mine,"_",i,"/",filename)
            download.file(ftps[a],localfilepath, method = "auto")
          }
        }
        templist <- list(
          arraydata = arraydata,
          pdata = pdata,
          metadata = metadata
        )
        if (is.null(datalist)){
          datalist <- templist
        } else {
          datalist[[i]] <- templist
        }
        }
        return(datalist)
      }else {
        stop("the Dwarf_worker should be TGCA/GEO.")
      }
    }
    )
  )
