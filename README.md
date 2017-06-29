# s3.packages

In some cases, you may want to use R packages for private or team use only.  This package provides an easy method for installing packages that are stored in an s3 bucket.  Using s3 as a way to store/share R packages gives you much more access control than github or CRAN hosting.


## Setting up your s3 bucket

The function in this package expects that you will have your R package in the same format that you would use for a github hosted package.

Simply store your R package in the root folder of your s3 bucket in a folder by the same name of the package. 

```
mys3bucket
-myRpackage
--R
--data
--inst
...
```


## Installation

Note, this package depends on: aws.s3 and devtools
```
devtools::install_github('iankloo/s3.packages')
```


## Using the function

You will need to know: the name of the s3 bucket, the name of the package, and your aws keys.  For more info on the aws keys, see the documentation for the aws.s3 R package.  


```
install_s3(bucket = 'mys3bucket', package = 'myRpackage', awsKey = 'myawskey', secretKey = 'myawssecretkey')

