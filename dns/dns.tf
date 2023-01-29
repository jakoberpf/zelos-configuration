resource "cloudflare_record" "services" {
  for_each = toset(local.domains)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = true
}

locals {
  domains = [
    "vaultwarden.erpf.de",
    "bitwarden.erpf.de",
    "bashhub.erpf.de",
    "kubesphere.erpf.de",
    "anonaddy.erpf.de",
    "grafana.erpf.de",
    "vault.erpf.de",
    "mail.erpf.de",
    "iam.erpf.de"
  ]
}

resource "cloudflare_record" "services_unproxied" {
  for_each = toset(local.domains_unproxied)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}

locals {
  domains_unproxied = [
    "gatus.erpf.de",
    "teleport.erpf.de",
    "*.teleport.erpf.de",
    "netmaker.erpf.de",
    "*.netmaker.erpf.de",
  ]
}
