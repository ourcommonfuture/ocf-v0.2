ocf-v0.2
=================

OCF Website v0.2. Based on Ruby on Rails.

# Get Started

## Requirements

- You need to have vagrant installed (see instructions [here](https://github.com/ourcommonfuture/dev-setup/)

If you are contributor, of course more requirements ;) :

- Make sure you put a valid SSH private key in `provision/data/id_rsa`. Valid means that it has authorisation into staging and/or production servers, and that its private key is added in your [github SSH keys list](https://github.com/settings/ssh).

**N.B.:** See [here](https://help.github.com/articles/generating-ssh-keys/) is you need to create a ssh key. Then send the public version to the main dev admin to add it to the servers (never share the private version!!!)

- Also put into `provision/data/gitconfig` your `.gitconfig` file from your local environement that you have set (see [here](https://help.github.com/articles/set-up-git/))

## Start-up your dev box with Vagrant

Run those commands in your github project folder:
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

Simply run the command `bundle exec cap staging deploy`.

**N.B.:** make sure the command `bundle exec cap staging check_write_permissions` and `bundle exec cap staging git:check` runs successfully.

If not, it might comes from your ssh key in the `provision/data` folder.

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