# Keyvault en/de-crypt demo in OCI

### keywords
- OCI keyvault, masterkey
  - encrypt, decrypt
- OCI cli 
  - python sdk  
- OCI instance principals
  - for compute instance
- OCI FreeTier
- Terraform

### setup
**activate OCI environment variables**
configure and activate environment variables for OCI connection
  - create a file with the following content and fill the information between <..> based on your OS and tenancy information

```console
# unix
export TF_VAR_tenancy_ocid=<value>
export TF_VAR_user_ocid=<value>
export TF_VAR_fingerprint=<value>
export TF_VAR_private_key_path=<value>
export TF_VAR_region=<value>
export TF_VAR_compartment_ocid=<value>
```
```console
# Windows
setx TF_VAR_tenancy_ocid <value>
setx TF_VAR_user_ocid <value>
setx TF_VAR_fingerprint <value>
setx TF_VAR_private_key_path <value>
setx TF_VAR_region <value>
setx TF_VAR_compartment_ocid <value>
```

**activate environment variables**
```console  
# unix
cd path/to/env-vars_tenancy            
chmod +x env-vars_tenancy
source env-vars_tenancy  
```
```console
# Windows PowerShell
cd /path/to/env-vars_tenancy
env-vars_tenancy
```

### terraform build commands
```
terraform init
terraform plan
terraform apply
terraform destroy
```

### ssh connection output
compute instance connection output should look like:
*ssh_connection = ssh -i keys/key_private.pem ubuntu@123.45.67.01*