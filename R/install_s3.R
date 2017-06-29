#' Install packages from an s3 buckey
#'
#' This function allows you to install R packages stored in an s3 bucket.
#' @param bucket The name of the s3 where your packages are stored
#' @param package The name of your package (the folder name in the s3 bucket)
#' @param awsKey Your awsKey
#' @param secretKey Your aws secret key
#' @param deleteFiles Defaults to TRUE, all temp files created during installation will be deleted
#' @export


install_s3 <- function(bucket, package, awsKey, secretKey, deleteFiles = TRUE){
  Sys.setenv("AWS_ACCESS_KEY_ID" = awsKey,
             "AWS_SECRET_ACCESS_KEY" = secretKey)
  
  dir.create('tempFors3')
  
  packageFiles <- aws.s3::get_bucket(bucket = bucket, prefix = package)
  lapply(packageFiles, FUN = function(d){aws.s3::save_object(d$Key, file = paste('tempFors3/',d$Key, sep=''), bucket = bucket)})
  
  devtools::install_local(paste('tempFors3/',package,sep=''), force = TRUE)
  
  if(deleteFiles == TRUE){
    unlink('tempFors3', recursive = TRUE)
  }
}