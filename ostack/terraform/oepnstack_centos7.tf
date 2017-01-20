# Configure the OpenStack Provider
provider "openstack" {
#  The openstack configuration can be provided inside of the .tf file or using env variables.
#  WARNING, early versions of terraform, store the unencrypted credentials in terraform state file.
#    user_name = "OS_USERNAME"
#    tenant_name = "OS_TENANT_NAME"
#    auth_url = "OS_AUTH_URL"
#    password = "OS_PASSWORD"
}

# Create some Openstack Floating IP's for our VM's
/*resource "openstack_compute_floatingip_v2" "floatip_1" {
    region = ""
    pool = "net_external"
}*/

# Deploy
resource "openstack_compute_instance_v2" "kubenow" {
    name = "KubeNow"
    image_id = "349fc27d-c046-4835-b96b-0b552ffb8f06"
    flavor_id = "87cb9ac1-2ccb-4eaf-9436-5e4d17499429"
    network = {uuid="86b3ccc0-91d3-4496-9896-266747c1a870"}
#    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
    key_pair = "phenomenal-dev2"
    security_groups = []
#    provisioner "local-exec" {
#        command = "echo ${openstack_compute_instance_v2.centos7.access_ip_v4} > my_ip.txt"
#    }
}
