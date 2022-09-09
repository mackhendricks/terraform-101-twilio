# terraform-101-twilio

# Obtain Your AWS API Credentials and Set as Environment Variables
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```
# Initialize Terraform

```
terraform init
```

# Create the AWS Instance

```
terraform plan -var access_key=$AWS_ACCESS_KEY_ID -var secret_key=$AWS_SECRET_ACCESS_KEY -var name=mack
```
