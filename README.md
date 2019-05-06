# selenium-alpine-docker
Simple python alpine docker image for webscraping with Selenium and beautiful soup.

the python file is a test run to check it is set up correctly, this can easily changed to suit your needs 


Requirements:
Docker

pull the files down to a local directory using. Ensure when that you are in the correct location for where you want to build the container

```
git clone https://github.com/emmc15/selenium-alpine-docker.git
```

To build the container, navigate to the directory the location and use the following command, sudo is for linux users 
```
<sudo> docker build . --force-rm
```
This will build the container and remove the intermediate container on build

check the images that were created due to name assignment when building
```
<sudo> docker images
```

to run the image
```
<sudo> docker run <image id>
```


