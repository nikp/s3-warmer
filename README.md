# s3 warmer

![Toasty](s3-warmer.jpg)

S3 supports [1 million buckets](https://aws.amazon.com/about-aws/whats-new/2024/11/amazon-s3-up-1-million-buckets-per-aws-account/), but you don't want to wait to create them until you need them, right? The technical term for this is "control plane and data plane separation".

AWS best practices suggest you should [pre-warm your data stores for throughput](https://aws.amazon.com/blogs/database/pre-warming-amazon-dynamodb-tables-with-warm-throughput/).

Well that's basically what this script does. First it requests a service limit increase.

Then it makes your account nice and toasty warm with 1 million fresh buckets. Don't forget the marshmallows!