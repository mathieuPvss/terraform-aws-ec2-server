variable "name" {
  description = "Nom logique du serveur (web, monitoring...)"
  type        = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "key_name" {
  type = string
}
variable "admin_cidr" {
  description = "CIDR autorise en SSH"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.admin_cidr))
    error_message = "admin_cidr doit etre un CIDR IPv4 valide (ex : 203.0.113.10/32)."
  }
  validation {
    condition     = !can(regex("/0$", var.admin_cidr))
    error_message = "Impossible de mettre l'adresse 0.0.0.0/0 : le masque /0 ouvre le SSH a tout Internet."
  }
  validation {
    condition     = var.admin_cidr != "0.0.0.0/0"
    error_message = "Impossible de mettre l'adresse 0.0.0.0/0."
  }
}
variable "open_ports" {
  description = "Ports TCP ouverts a tout Internet (ex : [80])"
  type        = list(number)
  default     = []
}
variable "tags" {
  type    = map(string)
  default = {}
}

variable "enable_monitoring_port" {
  description = "Ouvre le port 9100 (node exporter) au CIDR administrateur"
  type        = bool
  default     = false
}
