- Instance Storage
  - Lost on terminating EC2
  - Stored in the hardware rack, does not go thru the network
  - If that hardware fails, then the data is lost

- EBS : Elastic Block Storage
  - Allows to extend the storage
  - Can be mounted to only one EC2
  - EC2 and EBS have to be in the same AZ
  - Commands 
    - lsblk : List the volumes
    - file -s /dev/xvdf : Check the status of volume
    - mkfs -t ext4 xvdf : Format the module xvdf
    - mkdir /appdata : Create directory
    - mount /dev/xvdf /appdata : Mount to /appdata

- EFS : Elastic File System
  - Common storage
  - Can be mounted to multiple EC2 in read-write
  - Size is not specified upfront, grows based on need
  - Changed based on utilization 
  - EC2 and EFS have to be in the same region, not needed to be in the same AZ

- S3 : Simple Storage Service
  - Object based store : Object is a file (text, video, etc)
  - Works with Managed Service, Lambda, 
  - Works with CDN : CloudFront 
    - Used to transfer objects across locations
  - Supports Events : Triggers events based on presence of file
  - Supports CLI
  - Can share objects with selected customers
  - Data can be replicated to other Regions, needs setup
  - Root folder is called buckets
  - Has a soft limit of 100 buckets
  - Can have unlimited folders inside each bucket
  - Name of bucket has to be globally unique
  - File size has to be >= 0 bytes and <= 5 TiB
  - Large files has to be split and uploaded, with each chunk being 5 GiB
  - Has versioning and purge/archival, which help reduce cost
  - Is eventually consistent for write (update) of existing file 
  - Creating a S3
    - S3 -> Create Bucket
    - Name : Has to be unique across all amazon customers
    - Can give permission to other users
    - Can set meta-data like mime, expiry time, etc
    - ARN : Amazon Resource Name 
  - Options to configure S3
    - Lifecycle
    - Replication : Needs versioning enabled
    - Analytics
    - Metrics
    - Inventory