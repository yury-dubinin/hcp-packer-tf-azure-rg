# hcp-packer-tf-azure-rg
Terraform for an Image Gallery in Azure for HCP Packer

## How it looks in Azure?
- during `packer build . `
<img width="673" alt="Screenshot 2023-04-17 at 17 47 18" src="https://user-images.githubusercontent.com/62520712/234008167-d2436c73-e48c-4046-bd21-16fbbdfb6737.png">
- once completed
<img width="695" alt="Screenshot 2023-04-20 at 21 17 58" src="https://user-images.githubusercontent.com/62520712/234008554-0b21a575-2663-44c4-a3f7-bf2a26b62945.png">

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
