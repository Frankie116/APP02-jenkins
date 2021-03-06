BRANCH "master" 
Changelog-001
Initial code copied from https://github.com/AjeetK/terraform-ecs-fargate.git

Changelog-002
Refactored code

Changelog-003
Refactored code - changed variable names

Changelog-004
Refactored code.
Used vpc module instead of resource. (replacing network.tf with 1a-vpc.tf)
Added terraform.tfvars
Updated variables.tf
Added 9b-random-string.tf

Changelog-005
Refactored security groups.  
Added security rules

Changelog-006
Refactored code.


Changelog-007
Refactored code.


Changelog-008
Added template & s3 files

Changelog-009
Refactored. 
Added route53 to enable private dns zone to be used.
Still need to resolve autoscaling issue. (currrent docker container requires port 8080, however, lb target group health checks are failing on port 8080. Therefore, auto scaling is constantly stopping/starting fargate tasks.  Health checks pass on port 80 though.)

Changelog-010
Resolved autoscaling issue by updating the lb health checks to monitor "/login" in the path instead of just "/".

Changelog-011
Added ecs grace period.  
Enables ecs to ignore loadbalancer's unhealthy alarms while containers are being created.
This stops autoscaling kicking in and stopping bootup/recreation.
Updated health check variables.

Changelog-012
sg restored to allow only my-docker-port into lb and into ecs-sg
09c-template-file.tf 
    - Template filename stored as a variable in terraform.tfvars.
    - A corresponding ecs-cd file with the container definition will be created for each required application.
    - the ecs-cd will be stored in ./templates.ecs
    - multiple containers can be defined in this file which corresponds to a single task definition.
    - fargate-memory & fargate-cpu variables are not currently used within templates at this time.

11a-auto_scaling.tf
    - auto-scaling min_capacity variable will now be equal to var.my-desired-container-count

12a-ecs.tf
    - split into 12a-ecs-service.tf & 12b-ecs-td.tf to make it more modular

removed my-docker-image variable from ouputs.tf & variables.tf and replaced with my-ecs-cd-template variable instead.

Changelog-013
Used TF06 template to create the first release of APP02-jenkins

Changlelog-014
refactored the following:
        renamed:    12a-ecs-service.tf -> 03a-ecs-service.tf
        renamed:    12b-ecs-td.tf -> 03b-ecs-td.tf
        modified:   05c-lb-tg.tf
        modified:   09c-template-file.tf
        modified:   10a-cw-logs.tf
        modified:   11a-auto_scaling.tf
        modified:   outputs.tf
        modified:   variables.tf


Changlelog-015
    modified:   03a-ecs-service.tf
        deleted:    04b-sg.tf
        deleted:    04c-sg-rules.tf
        modified:   05a-lb-alb.tf
        modified:   05c-lb-tg.tf
        modified:   07a-s3-bucket.tf
        deleted:    10b-cw-alarms..tf
        modified:   NETWORK DIAGRAM-APP02.jpg

    Untracked files:
        04c-sg-lb.tf
        04d-sg-rules-lb.tf
        04e-sg-ecs.tf
        04f-sg-rules-ecs.tf
        10b-cw-alarms.tf