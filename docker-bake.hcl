variable "PUPPETEER_VERSION" {
  default = "16.1.0"
}
variable "IMAGE" {
  default = "makepad/pa11y"
}
target "pa11y" {
    args = {
      "PUPPETEER_VERSION" = "${PUPPETEER_VERSION}"
    }
    dockerfile = "Dockerfile"
    context = "."
    tags = [ "${IMAGE}:${PUPPETEER_VERSION}","${IMAGE}:latest" ]
    attest = [ "type=provenance,mod=max","type=sbom"]
    cache-from = [ "type=registry,ref=${IMAGE}:buildcache" ]
    cache-to = [ "type=registry,ref=${IMAGE}:buildcache,mod=max" ]
    platforms = [ "linux/amd64","linux/arm64" ]
}