.. card:: carbonio core doCreateBucket

   .. code:: console

      zextras$ carbonio core doCreateBucket provider bucket_name access_key \
      secret [param VALUE[,VALUE]]

   .. rubric:: Parameter List

   .. csv-table::
      :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

      "**provider** (M)", "String", "Supported storage provider", ""
      "**bucket_name** (M)", "String", "Amazon AWS bucket", ""
      "**access_key** (M)", "String", "Service username of bucket", "" 
      "**secret** (M)", "String", "Service password"
      "**label** (M)", "String", "Bucket configuration description", ""
      "region (O)", "String", "Amazon AWS Region"
      "url (O)", "String", "S3 API compatible service URL (e.g., s3api.example.com)"
      "prefix (O)", "String", "Prefix added to blobs keys"
      "notes (O)", "String", "Bucket configuration details", ""


   \(M) == mandatory parameter, (O) == optional parameter

   .. rubric:: Example

   .. code:: console
             
      zextras$ carbonio core doCreateBucket S3 MyBucketName \
      X58Y54E5687R543 abCderT577eDfjhf My_New_Bucket url \
      https://example_bucket_provider.com

   The following values are used
   
   * S3 as the type of bucket

   * BucketName as the name of the bucket, which must coincide with
     the name on the remote provider, otherwise the command will fail
     
   * X58Y54E5687R543 as the remote username (access_key)

   * abCderT577eDfjhf as the remote password (bucket_name)

   * My_New_Bucket is a label given to the bucket

   * https\://example_bucket_provider.com is the endpoint to which
     Carbonio Storage connects to the bucket
