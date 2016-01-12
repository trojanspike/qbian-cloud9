# qbian-c9 Cloud9 IDE

Version : 1.0.0

### Install the qbian cli
[ qbain cli ](https://github.com/trojanspike/qbian)

### How to build
Make sure that the qbian-cli install available on your system.
- clone the repo https://github.com/trojanspike/qbian-cloud9.git
- cd into repo & build the default image. This just configs for the auto running provision
- once build you'd need to build the default image twice.
- build the qbian-c9 image, using the prev default image as the base image
- Run the image and let the provisioning run.

```bash
$ git clone git@github.com:trojanspike/qbian-cloud9.git
$ cd qbian-cloud9
$ qbain --create-default && \ # Run this image twice to get configured
$ qbian up && \ # login and and run ./Provision.sh , it will restart | halt
$ qbian up && \ # It should auto run the provision and restart | halt. The image is now configured
$ qbain --create-img qbian-cloud9 "-redir tcp:8080::8080" 2.5G default && \ # Create the new image and inject
  # Provision in qemu
$ qbian --run-img qbian-cloud9 5522 && \ # Start the image in qemu, provision will auto run. Take a while
  # Or you can do it from the raspberry pi - make sure to have ethernet connection.
$ qbian --export qbian-c9 /path/to/usb/sdcard # this will dump the disk onto the sd card
  # Put into the raspberry pi & allow to run
```

### Download Links
* [ Pre-built image , not yet provisioned ](https://@link)
* [ Built image , provisioned ](https://@link)

User : qbian
Pass : raspberry
