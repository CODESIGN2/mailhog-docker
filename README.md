# mailhog-docker-rpi
Raspberry Pi Docker Raspberry Pi

# Setup

You need [Docker runtime installed on your rpi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)

# Build

```
git clone https://github.com/Lewiscowles1986/mailhog-docker-rpi
cd mailhog-docker-rpi
docker build -t mailhog:alpine-pi .
```

# Run

```
docker run --restart always --name mailhog -p 1025:1025 -p 8025:8025 -d mailhog:alpine-pi
```

# Goals

[Mailhog](https://github.com/mailhog/MailHog) is great. Raspberry Pi's are cheap, convenient, and when paired with device-mode, it's a really easy setup for convinient, isolated functionality. I pair these separate pieces of technology so I can test email on-the-go without needing internet connection. If you pair this with a pi-hole you could spoof non-ssl mail internally ensuring testing or staging environments remain trapped inside. It could also useful for testing IoT email notifications.

* Deploy script
* Dockerhub image
* Links to other resources

# Special Thanks to

* [Docker](https://www.docker.com/)
* [GBAMan](http://blog.gbaman.info/?p=791)
* [Alpine Project](https://alpinelinux.org/)
* [MailHog](https://github.com/mailhog/MailHog)
