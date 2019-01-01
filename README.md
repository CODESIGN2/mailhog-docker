# mailhog-docker-rpi
Raspberry Pi Docker Raspberry Pi

## Setup

You need [Docker runtime installed on your rpi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)

## Build

```
git clone https://github.com/Lewiscowles1986/mailhog-docker-rpi
cd mailhog-docker-rpi
docker build -t mailhog:alpine-pi .
```

## Run

```
docker run --restart always --name mailhog -p 1025:1025 -p 8025:8025 -d mailhog:alpine-pi
```

## Troubleshooting

### This isn't intercepting my mail?

- [ ] Are you sending emails on the 1025 or 8025 ports?
- [ ] Are you using a hostname which resolves to the mailhog docker-container, such as localhost or '127.0.0.1'?
- [ ] is the docker service running (does `docker ps -a` show mailhog Status as "Up {n} Hours|Mins|Secs|Days")

### I would like to add features to this

- [ ] Have you identified which part of this you'd like to make changes to?
- [ ] Do you know this is basically a bundle of parts and want to improve this (so mailhog improvements go to their project(s), this one will osmose them, same with docker & alpine)?
- [ ] Have you checked the license `GPL-3.0` and decided you wish to contribute under that license?
- [ ] Please raise an issue before submitting a pull-request

## Goals

### Convenience

[Mailhog](https://github.com/mailhog/MailHog) is great. Raspberry Pi's are cheap, convenient, and when paired with device-mode, it's a really easy setup for convinient, isolated functionality. 

### Interoperability

I often like to combine separate pieces of technology. I made this dockerfile so I can test email on-the-go without needing internet connection.

### Extensibility

If you pair this tool with a pi-hole you could spoof non-ssl mail internally ensuring testing or staging environments remain trapped inside.

### Enabling experimentation

This could also be useful for testing IoT email notifications if the edges are expected to send the emails, although you'd need to be able to say "use mailhog MTA" or "use real MTA" if you wanted to do that.

## Improvements

* Deploy script
* Dockerhub image
* Links to other resources (tutorials, cool projects that use this etc)

## Special Thanks to

* [Docker](https://www.docker.com/) - for working on the packaging, distribution, runtime
* [GBAMan](http://blog.gbaman.info/?p=791) - for documenting device-mode extensions for raspberry pi so well
* [Alpine Project](https://alpinelinux.org/) - for making lightweight docker-images that have less moving parts
* [MailHog](https://github.com/mailhog/MailHog) - for making the program we run in docker, on alpine, and I combine with device-mode on a raspberry pi zero
