[
  {
    "name": "${my-cd-application}",
    "image": "${my-cd-image}",
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${my-cd-log-group}",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${my-cd-port},
        "hostPort": ${my-cd-port}
      }
    ],
    "healthCheck": {
        "command": [
          "CMD-SHELL",
          "echo hello"
        ],
        "interval": 5,
        "timeout": 2,
        "retries": 3
    }
  }
]