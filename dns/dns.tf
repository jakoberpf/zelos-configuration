resource "cloudflare_record" "kubesphere" {
  zone_id  = var.cloudflare_zone_id
  name     = "kubesphere.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}

resource "cloudflare_record" "teleport" {
  zone_id  = var.cloudflare_zone_id
  name     = "teleport.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}

resource "cloudflare_record" "vaultwarden" {
  zone_id  = var.cloudflare_zone_id
  name     = "vaultwarden.test.erpf.de"
  value    = "jakob.nodes.zelos.k8s.erpf.de"
  type     = "CNAME"
  proxied  = false
}
