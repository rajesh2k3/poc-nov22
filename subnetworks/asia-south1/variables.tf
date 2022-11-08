data "terraform_remote_state" "networks" {
  backend = "gcs"

  config = {
    #path = "../../../../../generated/google/poc-project-367814/networks/asia-south1/terraform.tfstate"  - #/home/srajesh2k3/poc-nov22/networks/asia-south1
    bucket = "poc-ng-gcs"
    prefix = "regional/ng-poc"
    path = "../../poc-nov22/networks/asia-south1/terraform.tfstate"
           
  }
}
