# Vagrant tutorial

*You can use Git Bash for all of the command lines as below:*

## Install Vagrant
Download and install the required tools:
. https://www.vagrantup.com/downloads.html
. https://www.virtualbox.org/wiki/Downloads

## Create and configure guest machines according to your Vagrantfile.
```
$ vagrant up
```

## Access your machine
```
$ vagrant ssh
```

## Shut down the running machine Vagrant is managing.
```
$ vagrant halt
```

## Stop the running machine Vagrant is managing and destroy all resources that were created during the machine creation process.
```
$ vagrant destroy -y
```

### ssh_exchange_identification: read: Connection reset by peer
```
$ vagrant reload
```

### This kernel requires an x86-64 CPU, but only detected an i686 CPU. Unable to boot – please use a kernel appropriate for your CPU
*Solution:* Enable Intel VT-x/AMD-V from BIOS
