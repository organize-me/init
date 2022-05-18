# AWS
Though these services are running locally, I am using AWS for DNS, SMTP, offsite backups, and secure paramiters.

## Aws User
Create a programtic user (with access key and secret access key). You'll need read/write access to S3, SSM Properties, and Route 53. To make sure you have suffesent permissions, assign your user to a group with the following policies:

* AmazonS3FullAccess
* AmazonSSMFullAccess
* AmazonRoute53FullAccess

## Aws-Cli
Install the aws-cli and configure it with the user.
```
$ aws configure
AWS Access Key ID [None]: ${accesskey}
AWS Secret Access Key [None]: ${secretkey}
Default region name [None]: ${region}
Default output format [None]:
```

## Aws Paramiters
A number of the paramiters are saved in AWS's SSM paramiter store. This saves credentals off-site in the event of a system failure. All of these paramiters need to be encrypted.

```
# --== AWS ==-- #
organize-me.aws_access_key        # Access Key
organize-me.aws_secret_access_key # Secret Access Key

# --== SMTP ==-- #
organize-me.smtp_host              # SMTP host
organize-me.smtp_port             # SMTP port
organize-me.smtp_username         # SMTP username
organize-me.smtp_password         # SMTP password

# --== MYSQL ==-- #
organize-me.mysql_password        # MySQL root password

# --== Keycloak ==-- #
organize-me.keycloak_db_username  # Keycloak database username
organize-me.keycloak_db_password  # Keycloak database password
organize-me.keycloak_username     # Keyclaok admin username
organize-me.keycloak_password     # Keycloak admin password

# --== WikiJs ==-- #
organize-me.wikijs_db_username    # WikiJs database username
organize-me.wikijs_db_password    # WikiJs database password
organize-me.wikijs_username       # WikiJs admin username
organize-me.wikijs_password       # WikiJs admin password

# --== Nextcloud ==-- #
organize-me.nextcloud_db_username # Nextcloud database username
organize-me.nextcloud_db_password # Nextcloud database password
organize-me.nextcloud_username    # Nextcloud admin username
organize-me.nextcloud_password    # Nextcloud admin password

# --== Snipe-IT ==-- #
organize-me.snipeit_db_username   # Snipe-IT database username
organize-me.snipeit_db_password   # Snipe-IT database password
organize-me.snipeit_username      # Snipe-IT admin username
organize-me.snipeit_password      # Snipe-IT admin password
organize-me.snipeit_appkey        # Snipe-IT app key
```
