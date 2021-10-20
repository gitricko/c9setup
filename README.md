# c9setup
Scripts to setup AWS Cloud9 Environment


### Creating C9 Environment
- Give unique name and description for environment
- Click `Next step`
- **Environment type:** `Create a new EC2 instance for environment (direct access)` [Default]
- **Instance type:** Choose `Other instance type`:
    - t3.medium
- **Platform:** Choose `Ubuntu Server 18.04 LTS`
- Click `Next step`, Click `Create environment`
- 
### Setup C9 environment
- Clone this repository
- Assuming you have API access, run command `c9setup/prepVM.sh`
  - This will call resize.sh script to resize EBS from 10G to 100G
  - Install neccessary dev files like python, conda, brew etc