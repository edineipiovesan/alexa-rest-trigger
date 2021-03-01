variable "project_name" {
  type        = string
  description = "Alexa Skill name"
}

variable "image_uri" {
  type        = string
  description = "Image uri from ECR"
}

variable "skill_event_source_token" {
  type        = string
  description = "Event source from Alexa Skill to trigger lambda function"
}
