- The Container (Docker) Ecosystem in AWS
  - Docker Deamon : Starts containers
  - Kuberneties : Manages multiple VMs with docket
  - EKS : Elastic Kuberneties Service
  - ECS : Elastic Container Service 
  - Docker hub : Public repository of images
  - POD : A pod is a group of related containers / TASK in AWS (Generally not preferred)
- Amazon Elastic Container Services
  - Latest release is called fargate
  - Optimal to have one "task" in an EC2
  - and each "task" creating one container.
  - aws ecr get-login --region=us-east2 : will generate the command for docker to login to ECR