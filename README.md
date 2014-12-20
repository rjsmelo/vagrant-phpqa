# Vagrant box with PHP QA Tools

This box was build as a companion to my presentation about php QA tools.

For the original references about the tools, please visit the website http://phpqatools.org

## How to use the Vagrant Box

Step By Step instructions:

* Clone this repository (with submodules)
* Start the vagrant Box

Copy & past instructions:

```
git clone  --recursive https://github.com/rjsmelo/vagrant-phpqa.git
cd vagrant-phpqa
vagrant up
```

After the virtual machine finish provisioning, the following ports are forwarded to the virtual machine:

* 8080: points to the Jenkins installation
* 8090: points to the Apache server

If you point your browser to `http://localhost:8080` you should see Jenkins server with the `php-template` configuration ready to be cloned to other PHP projects.

## Contributing

If you find any issue or have any improvement, please clone the repo, make your changes and then submit a pull request.