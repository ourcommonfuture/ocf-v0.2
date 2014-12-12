ocf-v0.2
=================

OCF Website v0.2. Based on Ruby on Rails.

# Get Started

## Requirements

- You need to have vagrant installed (see instructions [here](https://github.com/ourcommonfuture/dev-setup/))

If you are contributor (of course more requirements ;) :

- Make sure you put a valid SSH private key in `provision/data/` as `id_rsa`. Valid means that it has authorisation into staging and/or production servers, and that its public key is added in your [github SSH keys list](https://github.com/settings/ssh).

**N.B.:** See [here](https://help.github.com/articles/generating-ssh-keys/) for more instructions, especially if you need to create a ssh key. The public version of your ssh key shoud be sent to the main dev admin in order to add it to the servers (**carefull**, never share the private key!!!)

- Also put into `provision/data/` as `gitconfig` your `.gitconfig` file from your local environement that you have previously set up (guide [here](https://help.github.com/articles/set-up-git/))

## Start-up your dev box with Vagrant

Run those commands in the github project folder you just cloned:
```bash
# Start your box: it download the required files (can take some times), run the VM and configure the whole environement (this can also take some times, go grab a coffee and enjoy the feeling of seeing the computer doing stuff for you :)
vagrant up
# You then only have to run this command to ssh in a the perfect env!
vagrant ssh
```

## Initialization

Initiate and prepopulate the database by running:

```bash
rake db:create db:migrate db:seed
```

# Test

To test the app, run the following commands:

```bash
rake test
```

# Deployment

## Push to staging

Simply run this command:

```bash
bundle exec cap staging deploy
```

**N.B.:** If it shows errors (unsuccessfull), make sure the command `bundle exec cap staging check_write_permissions` and `bundle exec cap staging git:check` runs successfully.

If not, it might comes from your ssh key in the `provision/data` folder that is either missing, or not authorized on the server.

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