# Vagrant image for Moira development
You can use this vagrant image for quickly setup development environment.

All code available for edit on host-machine in directory `project`.

This is an image for developing or for a quick review of the system. NOT for production!

## Instruction

```
git clone https://github.com/moira-alert/moira-vagrant-dev
vagrant up

start http://localhost:8888
```
---
## How To Contribute

### Web,  Worker

1. Fork repository
2. Replace variable value `moira_web_repo` or `moira_worker_repo` on your fork in file `ansible\group_vars\all.yml` 
3. Start vagrant provisioning
4. Write code on host-machine in `project` directory
5. Apply changes:
```
vagrant ssh
sudo systemctl restart moira-web
sudo systemctl restart moira-checker
sudo systemctl restart moira-api
```
6. Look at the changes on http://localhost:8888/
7. Push & PR 


### Cache

1. Fork repository
2. Start vagrant provisioning
3. Set GOPATH in your editor to `project\gocode` (if you want IntelliSense to work)  
4. Add git remote to your repo in directory `project\gocode\github.com\moira-alert\cache`
```
git remote add myfork https://github.com/you/cache.git
``` 
5. Write code on host-machine in `project\gocode\moira-alert\` directory
6. Apply changes:
```
vagrant ssh
cd /vagrant/data/gocode/src/moira-alert/cache
go install
sudo systemctl restart moira-cache
```
* Look at the changes on http://localhost:8888/
* Push & PR
```
git push myfork
```

### Notifier

In the same way as Cache. 

Apply changes:
```
vagrant ssh
cd /vagrant/data/gocode/src/moira-alert/notifier/notifier
go install
sudo systemctl restart moira-notifier
```
---
## Troubleshooting

### Q:
```
> vagrant provision

There are errors in the configuration of this machine. Please fix
the following errors and try again:

ansible local provisioner:
 * `playbook` does not exist on the guest: c:/vagrant/ansible/moira.yml 
```
### A:
This is a known issue https://github.com/mitchellh/vagrant/issues/6740

Use:

```
vagrant halt
vagrant up --provision
```
or
```
vagrant ssh
cd /vagrant
./start_provision.sh
```
---
###Q:
```
TASK: [moira | Create symlink for node_modules] *******************************
failed: [localhost] => {"failed": true, "path": "/vagrant/project/moira-web/node_modules", "state": "absent"}
msg: Error while linking: [Errno 71] Protocol error

FATAL: all hosts have already failed -- aborting
```

###A: 
Start cmd as Administrator
