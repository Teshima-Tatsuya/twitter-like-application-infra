locals {
  services = {
    nginx = {
      subnet = "pub-a"
    }
    rails = {
      subnet = "pri-a"
    }
  }
}