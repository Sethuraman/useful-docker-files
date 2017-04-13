This docker file and the script associated with it, 
generates the 3 keys pairs needed for a concourse installation

* tsa
* worker
* session signing

It then uploads it to S3 to a bucket you specify.

It also downloads the concourse binary from the URL specified
and uploads it to the same S3 bucket.