provider "google" {
  project = "poc-project-367814"
}

terraform {
	required_providers {
		google = {
	    version = "~> 4.42.1"
		}
  }
}
