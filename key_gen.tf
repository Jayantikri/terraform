resource "aws_key_pair" "myawskey" {


  public_key =  file("/home/ubuntu/.ssh/id_rsa.pub")
  key_name = "mylbkey"
  

}
