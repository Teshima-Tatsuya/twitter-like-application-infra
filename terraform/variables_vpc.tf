variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  description = "VPC CIDR"
}

variable "vpc_subnet" {
  default = {
    "subnet-pub-a" = {
      cidr_block_host = 2
      cidr_block_bit  = 2
      az              = "ap-northeast-1a"
    },
    "subnet-pri-a" = {
      cidr_block_host = 2
      cidr_block_bit  = 0
      az              = "ap-northeast-1a"
    },
  }
}

variable "vpc_route" {
  default = {
    "rt-subnet-pub-a" = {
      subnet = "subnet-pub-a"
      dest_cidr = "0.0.0.0/0"
      igw = true
    },
    "rt-subnet-pri-a" = {
      subnet = "subnet-pri-a"
      igw = false
    },
  }
}

variable "vpc_sg" {
  default = {
    "sgp-eice" = {
      description = "for vpce"
      rules = {
        "egress" = {
          type = "egress"
          description = "egress all"
          from = -1
          to = -1
          protocol = "ALL"
          cidr = "0.0.0.0/0"
        },
        "ingress-ssh" = {
            type = "ingress"
            description = "ssh"
            from = 22
            to = 22
            protocol = "TCP"
            cidr = "0.0.0.0/0"
        },
      }
    },
    "sgp-nginx" = {
      description = "for nginx"
      rules = {
        "egress" = {
          type = "egress"
          description = "egress all"
          from = -1
          to = -1
          protocol = "ALL"
          cidr = "0.0.0.0/0"
        },
        "ingress-ssh" = {
            type = "ingress"
            description = "ssh"
            from = 22
            to = 22
            protocol = "TCP"
            cidr = "0.0.0.0/0"
        },
        "ingress-http" = {
            type = "ingress"
            description = "http"
            from = 80
            to = 80
            protocol = "TCP"
            cidr = "0.0.0.0/0"
        },
      }
    },
  }
}  