#!/bin/bash
set -ex

aws s3 cp windows_install.ps1 s3://get.datree.io/windows_install.ps1 --acl public-read
aws s3 cp install.sh s3://get.datree.io/install.sh --acl public-read

CLOUDFRONT_DISTRIBUTION_ID=E1X45HJJOAOQRV
echo "Cloudfront: Invalidating /* for ${CLOUDFRONT_DISTRIBUTION_ID}"
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"
