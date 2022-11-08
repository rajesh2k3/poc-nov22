data "terraform_remote_state" "networks" {
  backend = "local"

  config = {
    #path = "../../../../../generated/google/poc-project-367814/networks/asia-south1/terraform.tfstate"
    path = "../../poc-nov22/networks/asia-south1/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnetworks" {
  backend = "local"

  config = {
    #path = "../../../../../generated/google/poc-project-367814/subnetworks/asia-south1/terraform.tfstate"
    path = "../../poc-nov22/subnetworks/asia-south1/terraform.tfstate"
    
  }
}
