variable "awsregion" {
  description = "resource will created in region"
  type        = string
  default     = "us-east-1"
}

variable "VmImage" {
  description = "VM image creation"
  type        = string
  default     = "ami-0b5eea76982371e91"

}

variable "VmSize" {
  description = "VM size creation"
  type        = string
  default     = "t2.micro"

}


 