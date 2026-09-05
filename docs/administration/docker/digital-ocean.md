# DigitalOcean and EspoCRM

DigitalOcean is a cloud platform that provides scalable infrastructure, including virtual servers (Droplets), storage, networking, and other cloud services. In this guide, we will use a DigitalOcean Droplet to deploy and run a self-hosted EspoCRM instance.

1\. Sign up on the [official DigitalOcean website](https://cloud.digitalocean.com/registrations/new)

2\. Create a Droplet

![Create a droplet](../../_static/images/administration/digital-ocean/droplet-create.png)

3\. Choose a datacenter region that is convenient for you. The recommended OS is Ubuntu or Debian.

![Choose a datecenter](../../_static/images/administration/digital-ocean/datacenter.png)

4\. We recommend a Droplet plan with at least 2 GB of RAM. Higher plans may provide a smooother user experience.

![Choose a droplet plan](../../_static/images/administration/digital-ocean/droplet-plan.png)

5\. Attach an SSH key or create a password, although using a password provides lower security. Add Payment Method and complete the Droplet creation.

![Create an SSH key](../../_static/images/administration/digital-ocean/ssh-key.png)

!!! note

    To make your EspoCRM instance accessible through a domain, configure a DNS record pointing the domain to the Public IPv4 address of your Droplet. See the [Domain Configuration Guide](../DNS-configuration.md) for an example using Cloudflare.

![puplic IPv4](../../_static/images/administration/digital-ocean/public-ip.png)

6\. Now, log in to your server using the "Web Console" button or any other convenient way (e.g., a terminal) as the root user.

![web-console position](../../_static/images/administration/digital-ocean/web-console.png)

7\. Right after you log in to your server you can already download the installation script and run it with a single command:
```
wget -N https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
sudo bash install.sh --ssl
```
During installation process, the system will prompt you to choose appropriate SSL protocol and enter a domain name, if available.

It's also possible to run the installer with all necessary preset, for example:
```
wget -N https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
sudo bash install.sh -y --ssl --letsencrypt --domain=espocrm-sandbox.com --email=email@my-domain.com
```

All available prompt options can be foud [here](../installation-by-script.md#available-options)

After a successful installation, the login credentials, including the URL that you can use to access EspoCRM, will be shown in the terminal.

![Login credentails in terminal](../../_static/images/administration/digital-ocean/credentials.png)

## Additional Security

To improve the security of your EspoCRM server, we recommend configuring Fail2ban to help protect against repeated unauthorized access attempts.

For more information, see the [Fail2ban Setup Guide](../Fail2ban.md).

