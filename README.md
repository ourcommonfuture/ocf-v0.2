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

Once you are ssh-ed in your box, run those commands to configure postgres:

```bash
sudo -i -u postgres
createuser -P -s vagrant
# it will ask you for the password, put the one you want
```

