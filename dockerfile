FROM python:3.7.2-alpine3.9 as base

MAINTAINER Emmett Carey <emmettcarey95@gmail.com>

FROM base as builder

RUN mkdir /install
WORKDIR /install

COPY requirements.txt /requirements.txt

RUN apk --update add --no-cache g++

RUN pip install --install-option="--prefix=/install" -r /requirements.txt

FROM base


#Copying over the installed pip packages in builder fashion
COPY --from=builder /install /usr/local


#Update packages and add the following programs for selenium to work
RUN apk --update add --no-cache g++
RUN apk add wget unzip dbus-x11 ttf-freefont firefox-esr xvfb tar

#Pull geckodriver from the github respository 
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz

#unzip it and move to a directory.
RUN tar -zxvf geckodriver-v0.24.0-linux64.tar.gz
RUN mv ./geckodriver /usr/local/bin

# then make it executable to everyone
RUN chmod a+x /usr/local/bin/geckodriver

#Pull python file into the location of the geckodriver for it to run 
COPY /selenium-firefox-demo.py /usr/local/bin
WORKDIR /usr/local/bin



CMD python selenium-firefox-demo.py
#CMD [ "python", ma ]