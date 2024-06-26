terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "mashnoor-snowflake-demo"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "mashnoor_demo_db" {
  name    = "MASHNOOR_DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.mashnoor_demo_db.name
  name     = "MASHNOOR_DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}