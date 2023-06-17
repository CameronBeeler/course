# This is the S3 building tf file

resource "aws_s3_bucket" "s3" {
    bucket = "camerons-tf-test-${random_id.randomness.hex}"
    
    tags = {
        Name    = "CamTFBucket"
        Purpose = "VerifyS3Build"
    }
}
resource "aws_s3_bucket_ownership_controls" "my_new_bucket_acl" { 
    bucket = aws_s3_bucket.s3.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}