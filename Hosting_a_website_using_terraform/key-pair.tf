resource "aws_key_pair" "website" {
  key_name = "website-key-pair"
  public_key = file()
}