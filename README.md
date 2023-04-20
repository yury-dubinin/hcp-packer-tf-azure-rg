# hcp-packer-tf-azure-rg
Terraform for an Image Gallery in Azure for HCP Packer

## Packer
- https://github.com/danbarr/hcp-packer-azure/tree/main/hcp-packer-ubuntu20
- https://www.youtube.com/watch?v=2jxmDkOsAzc
- https://www.youtube.com/watch?v=r0I4TTO957w
- https://www.youtube.com/watch?v=9s7PtPiHTSI

## Packer Commit and Build process
- validate: `packer validate ubuntu-focal.pkr.hcl`
- build: `packer build -parallel-builds=1 ubuntu-focal.pkr.hcl`

## To look for 
- https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/packer-build-v1?view=azure-pipelines
- https://www.nielskok.tech/azure-virtual-desktop/packer-yaml-azure-devops-pipeline-pt-1/
- https://www.youtube.com/watch?v=2-WOwF2_R20
- https://www.youtube.com/watch?v=MfXHZOqkzuE
