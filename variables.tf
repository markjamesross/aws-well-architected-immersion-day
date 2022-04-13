variable "deployment_tool" {
  type        = string
  default     = "terraform"
  description = "Tool used to deploy code"
}
variable "service_name" {
  description = "Name of the service"
  type        = string
  default     = "aws-well-architected-immersion-day"
}
variable "repository_name" {
  description = "Name of the GitHub Repository."
  type        = string
  default     = "aws-well-architected-immersion-day"
}
variable "email_address" {
  description = "Email address for notifications"
  type        = string
  default     = "mark.ross@atos.net"
}
variable "last_name" {
  description = "Last name of person doing deployment"
  type        = string
  default     = "ross"
}
variable "date_time" {
  description = "Date and time starting immersion day"
  type        = string
  default     = "20220413-1122"
}
variable "key_name" {
  description = "SSH key name, leave as default if using AWS Event Engine"
  type        = string
  default     = "ee-default-keypair"
}