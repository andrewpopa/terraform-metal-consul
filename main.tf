// ssh key
module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

// TODO: change it to cloud-init
data "template_file" "consul_server" {
  template = file("bootstrap/consul_server.sh")
  vars = {
    CONSULVER   = var.consul_version
    metal_token = var.metal_token
    project_id  = var.project_id
  }
}

// consul devices
module "consul" {
  source = "git::github.com/andrewpopa/terraform-metal-device.git"

  for_each = var.consul_cluster

  hostname            = "${each.value.hostname}-${each.value.facilities}"
  plan                = each.value.plan
  facilities          = [each.value.facilities]
  operating_system    = each.value.operating_system
  billing_cycle       = each.value.billing_cycle
  tags                = "${each.value.hostname}-${each.key}"
  project_id          = var.project_id
  project_ssh_key_ids = [module.key.id]
  user_data           = data.template_file.consul_server.rendered
}