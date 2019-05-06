output "dockerapp_frontend_url" {
  value = "http://${module.dockerapp_frontend_elb.elb_dns_name}"
}
