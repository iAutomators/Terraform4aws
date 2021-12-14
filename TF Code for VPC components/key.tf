# key pair

resource "aws_key_pair" "mynkkeypair" {
  key_name   = "mynkkeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}