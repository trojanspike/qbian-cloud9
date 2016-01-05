# qbian

### Install the qbian cli
[ qbain cli ](https://github.com/trojanspike/qbian)

### Install qbian-cloud9

```
$ git clone git@github.com:trojanspike/qbian-cloud9.git && \
$ cd qbian-cloud9 && \
$ qbain --create-default && \ # Run this image twice to get configured
$ qbian up && \ # login and and run ./Provision.sh , it will restart | halt
$ qbian up && \ # It should auto run the provision and restart | halt. The image is now configured
$ qbain --create-img qbian-cloud9 "-redir tcp:8080::8080" 2.5G && \ # Create the new image and inject
$ qbian --run-img qbian-cloud9 5522 && \ # Start the image in qemu, provision will auto run. Take a while

```
