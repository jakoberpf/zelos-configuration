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
    "kubesphere.erpf.de",
    "netmaker.erpf.de",
    "teleport.erpf.de",
    "anonaddy.erpf.de",
    "grafana.erpf.de",
    "vault.erpf.de",
    "mail.erpf.de",
    "iam.erpf.de"
  ]
}
