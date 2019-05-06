# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default = "eu-west-2"
}

variable "key_pair_name" {
  description = "The name of the Key Pair that can be used to SSH to each EC2 instance in the ECS cluster. Leave blank to not include a Key Pair."
  default = ""
}

variable "dockerapp_frontend_image" {
  description = "The name of the Docker image to deploy for the frontend"
  default = "tobypope/dockerapp"
}

variable "dockerapp_frontend_version" {
  description = "The version (i.e. tag) of the Docker container to deploy for the frontend (e.g. latest, 12345)"
  default = "latest"
}

variable "dockerapp_frontend_port" {
  description = "The port the frontend Docker container listens on for HTTP requests (e.g. 3000)"
  default = 80
}
