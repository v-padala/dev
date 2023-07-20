terraform {
 backend "gcs" {
   bucket  = "dev-assessment"
   prefix  = "terraform/assessment"
 }
}
