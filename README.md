# mDNS
To referernce our server within the local network, we need to set the hostname and setup mDNS. This allows us to reference our server using the domain `organize-me.local` without needing to configure the DNS server.

## Set the hostname
```
sudo hostnamectl set-hostname organize-me
```

## Setup mDNS
```
sudo apt update
sudo apt install avahi-daemon
sudo reboot
```


# AWS
Though these services are running locally, I am using AWS for DNS, SMTP, offsite backups, and secure paramiters. The following will need to be setup by an admin (probably you) to support the self-hosted services.

 * User - A user that can perform the needed tasks, but this user should be limited to organize-me related resources. There is an example IAM policy [here](/organize-me-policy.json)
 * KMS key - A key for encrypting/decrypting data. The created user will need access to this key too.
 * Route53 Hosted Zone - To manage your public DNS.
 * SMTP - Used to send out password reset emails and notifications. Currently my smtp is managed in AWS.
 * S3 Bucket - A bucket used to keep the terraform-aws state. If using the example policy, the name must be in the format: 'organize-me.${domain}.*'

## SMTP
Before running anything, setup your SMTP account in AWS. Because SMTP is often abused, this requires you to make a request to AWS. This includes a manual review. As long as you don't plan on spaming people, you shouldn't run into any issue.

## Route 53
DNS setting are managed in the terraform-aws project, but you need to have the hosted zones setup for your domain.

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
A number of the paramiters are saved in AWS's SSM paramiter store. This saves credentals off-site in the event of a system failure. All of these paramiters need to be encrypted. If you're using the example user policy, each property will need to be tagged with {name: "organize-me", value: "${domain}"}

```
# --== AWS ==-- #
organize-me.aws_access_key              # Access Key
organize-me.aws_secret_access_key       # Secret Access Key

# --== SMTP ==-- #
organize-me.smtp_host                   # SMTP host
organize-me.smtp_port                   # SMTP port
organize-me.smtp_username               # SMTP username
organize-me.smtp_password               # SMTP password

# --== MYSQL ==-- #
organize-me.mysql_password              # MySQL root password

# --== Keycloak ==-- #
organize-me.keycloak_db_username        # Keycloak database username
organize-me.keycloak_db_password        # Keycloak database password
organize-me.keycloak_username           # Keyclaok admin username
organize-me.keycloak_password           # Keycloak admin password

# --== WikiJs ==-- #
organize-me.wikijs_db_username          # WikiJs database username
organize-me.wikijs_db_password          # WikiJs database password
organize-me.wikijs_username             # WikiJs admin username
organize-me.wikijs_password             # WikiJs admin password

# --== Nextcloud ==-- #
organize-me.nextcloud_db_username       # Nextcloud database username
organize-me.nextcloud_db_password       # Nextcloud database password
organize-me.nextcloud_username          # Nextcloud admin username
organize-me.nextcloud_password          # Nextcloud admin password

# --== Snipe-IT ==-- #
organize-me.snipeit_db_username         # Snipe-IT database username
organize-me.snipeit_db_password         # Snipe-IT database password
organize-me.snipeit_username            # Snipe-IT admin username
organize-me.snipeit_password            # Snipe-IT admin password
organize-me.snipeit_appkey              # Snipe-IT app key
```
