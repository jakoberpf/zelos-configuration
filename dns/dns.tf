resource "cloudflare_record" "services" {
  for_each = toset(local.domains)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = "fabian.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = true
}

locals {
  domains = [
    "vaultwarden.erpf.de",
    "bitwarden.erpf.de",
    "owncloud.erpf.de",
    "bashhub.erpf.de",
    "zerotier.erpf.de",
    "kubesphere.erpf.de",
    "anonaddy.erpf.de",
    "grafana.erpf.de",
    "vault.erpf.de",
    "argo.erpf.de",
    "mail.erpf.de",
    "iam.erpf.de"
  ]
}

resource "cloudflare_record" "services_unproxied" {
  for_each = toset(local.domains_unproxied)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = "fabian.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}

locals {
  domains_unproxied = [
    "gatus.erpf.de",
    "teleport.erpf.de",
    "*.teleport.erpf.de",
    "dashboard.netmaker.erpf.de",
    "api.netmaker.erpf.de",
    "broker.netmaker.erpf.de",
  ]
}

# resource "cloudflare_record" "services_strato" {
#   for_each = toset(local.domains_strato)
#   zone_id  = var.cloudflare_zone_id
#   name     = each.key
#   value    = "one.strato.nodes.zelos.k8s.erpf.de"
#   type     = "CNAME"
#   proxied  = false
# }

# locals {
#   domains_strato = [
#     "broker.netmaker.erpf.de"
#   ]
# }
