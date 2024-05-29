

resource "google_project_service" "compute" {
  project = var.GCP_PROJECT
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = false
}


resource "google_project_service" "container" {
  project = var.GCP_PROJECT
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = false
}



resource "google_organization_policy" "services_policy" {
  org_id     = var.GCP_Organization
  constraint = "compute.vmExternalIpAccess"

  list_policy {
    allow {
      all = true
    }
  }
}
