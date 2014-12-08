ocf-v0.2
=================

OCF Website v0.2. Based on Ruby on Rails.

# Get Started

## Start-up your dev box with Vagrant

You need to have vagrant installed (see [here](https://github.com/ourcommonfuture/dev-setup/), them run those commands in your github project folder:
```bash
# Then start your box: it download the required files (can take some times) and run the VM
vagrant up
# You then only have to run this command to ssh in a the perfect env!
vagrant ssh
```

## Configure it

(This step will be soon automated...)

### Postgresql

Once you are ssh-ed in your box, run those commands to configure postgres:

```bash
sudo -i -u postgres
createuser -P -s vagrant
# it will ask you for the password, put the one you want
```

Assign the 2 environnement variables `PGUSER` & `PGPASSWORD` by editing the `~/.bashrc`

```bash
export PGUSER=[username]
export PGPASSWORD=[password]
```

### Rails

You know need to configure your rails secret key. Run the `rake secret` command and copy the generate value. Pasted into `~/.bashrc` as the `SECRET_KEY_BASE` environnement variable


```bash
export SECRET_KEY_BASE=[secret_token]
```

Then, initiate the database by running:

```bash
rake db:create db:migrate db:seed
```

### Deployment

In order to be able to deploy to OCF servers, you need to configure your box ssh.

*N.B.:* Make sure you had put your ssh private key in `/provision/data/id_rsa` before running the `vagrant up` command!

```bash
# start the ssh-agent in the background
eval "$(ssh-agent -s)"
# then add your ssh key
ssh-add ~/.ssh/id_rsa
```

# Test


To test the app, run the following commands:

```bash
rake test
```

# Deployment

## Push to staging

**SOON**

## Push to production

**SOON**

## Create a production server

We choosed to run the servers on Digital ocean droplets. [Here is a tutorial](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-passenger-and-nginx-on-ubuntu-14-04) to get a instance up and running thanks to Passenger, along with [installing rails](https://gorails.com/setup/ubuntu/14.10).

To restart your server, just run `sudo nginx -s reload`.

**N.B.:** To connect easily to your instance with a command like `ssh ocf`, add `[IP_ADDRESS] ocf` to your file `/etc/hosts` and add those lines to `~/.ssh/config`:

```
Host ocf
	HostName [IP_ADDRESS]
	User [USERNAME]
	Port [PORT]
	IdentityFile ~/.ssh/[name].pub
```

Knowing that you [created the ssh-key](https://help.github.com/articles/generating-ssh-keys/) and added thanks to `ssh-add -K [name].pub`.