# packer-azure

## Getting started



To make it easy for you to get started with GitLab, here's a list of recommended next steps.


```
packer-azure
├─ packer-common - Its a submodule in this project, used to store the powershell and linux scripts to build images
│  ├─ README.md
│  └─ scripts
│     └─ powershell
│        └─ tool_Script.PS1
├─ .gitlab-ci.yml - Needs to Provide gitlab runner tags to use active runners, variables to clone the git submodule strategy, by using include parameter will call other required files.
├─ .gitmodules - Will create automatically when we run git submodule add commands.
├─ Packer.azure.gitlab-ci.yml - Provided different stages and variables to build the  packer image. This is included in .gitlab-ci.yml by using -include parameter.
├─ variables.auto.pkrvars.hcl - To declare the variable values
├─ variables.pkr.hcl - Defining and declaring the variables to build packer images.
└─ windows_10.pkr.hcl - HCL script to build the windows image in azure using packer

```
