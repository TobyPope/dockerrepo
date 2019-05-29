#!/bin/bash
cd /home/tpope/webappdocker/terraform-configurations
terraform plan
terraform apply -auto-approve
