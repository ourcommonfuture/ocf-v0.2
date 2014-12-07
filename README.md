ocf-v0.2
=================

OCF Website v0.2. Based on Ruby on Rails.

Get Started
==========

You need to have vagrant installed (see [here](https://github.com/ourcommonfuture/dev-setup/), them run those commands in your github project folder:
```bash
# Then start your box: it download the required files (can take some times) and run the VM
vagrant up
# You then only have to run this command to ssh in a the perfect env!
vagrant ssh
```

Then, initiate the database by running:

```bash
rake db:create db:migrate db:seed
```

Test
========

To test the app, run the following commands:

```bash
rake test
```

Production
======

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