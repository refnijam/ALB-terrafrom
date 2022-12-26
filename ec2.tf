

resource "aws_instance" "test" {

  ami           = var.VmImage
  instance_type = var.VmSize
  key_name      = "nijam"
  count         = 1
}






