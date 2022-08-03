resource "cloudflare_record" "kubesphere" {
  zone_id  = var.cloudflare_zone_id
  name     = "kubesphere.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = true
}

resource "cloudflare_record" "teleport" {
  zone_id  = var.cloudflare_zone_id
  name     = "teleport.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = true
}

resource "cloudflare_record" "anonaddy" {
  zone_id  = var.cloudflare_zone_id
  name     = "anonaddy.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = true
}

resource "cloudflare_record" "mail" {
  zone_id  = var.cloudflare_zone_id
  name     = "mail.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}
