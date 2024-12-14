#!/bin/bash

# Check if both project name and GitHub username are provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 <project-name> <github-username>"
  exit 1
fi

# Set the project name and GitHub username from the arguments
PROJECT_NAME=$1
GITHUB_USERNAME=$2

# Create directories
mkdir -p $PROJECT_NAME/{config,cmd,internal/{handlers,services,repositories,routes},pkg,docs}

# Navigate to the project directory
cd $PROJECT_NAME

# Run `go mod init` with the GitHub path
go mod init github.com/$GITHUB_USERNAME/$PROJECT_NAME

# Create initial files
touch main.go
touch internal/handlers/{example_handler.go,README.md}
touch internal/services/{example_service.go,README.md}
touch internal/repositories/{example_repository.go,README.md}
touch pkg/README.md
touch docs/README.md
touch README.md

# Output the created structure
echo "Project initialized with Go module github.com/$GITHUB_USERNAME/$PROJECT_NAME"
cd ..
tree $PROJECT_NAME
