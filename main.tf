terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN"
  username = "tf-snow"
  account  = "QW66955"
  region   = "ap-south-1.aws"
  private_key_path = "~/.ssh/snowflake_tf_snow_key.p8"
}

resource "snowflake_database" "db" {
  name     = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "X-Small"

  auto_suspend = 60
}