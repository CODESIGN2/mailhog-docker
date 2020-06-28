# mailhog-docker

Docker Mailhog, which works on a Raspberry Pi. Originally this was a raspberry pi only image, but now docker has more stable support for multi-arch you can build the same alpine for x86 as various arm flavours. [They even support windows](https://docs.docker.com/docker-for-windows/). In-theory even windows users can create an issue if you cannot run this. In practice, I don't have a license to a windows with docker runtime, so it may take some time and cause frustration.

## Setup

You need Docker runtime installed, and access to a user that can download, build and run docker images.

- [on your rpi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)
- [on other platforms](https://docs.docker.com/install/)

### I can't run docker after installing

- try `sudo usermod -aG docker $USERNAME`, followed by logging in and out, or rebooting your device. It basically says "Hey add my user to the group that has permissions to run docker please."

## Build (optional for x86 users)

```
git clone https://github.com/CODESIGN2/mailhog-docker
cd mailhog-docker
docker build -t mailhog:alpine -t mailhog:latest .
```

## Run

### After build

```
docker run --restart always --name mailhog -p 1025:1025 -p 8025:8025 -d mailhog:alpine
```

### From latest on dockerhub

```
docker run --restart always --name mailhog -p 1025:1025 -p 8025:8025 -d cd2team/mailhog:latest
```

There are also pre-built versions under `cd2team/mailhog` with `latest` tag for rolling release built, tagged and pushed using Github Actions. It's not robustly tested, but the tagging strategy used also means a timestamp release is published to ensure you can pin dependency versions.

The additional `{timestamp}` version of tags make it easy to maintain history when re-tagging a `latest` and `alpine`. If you encounter issues with a `latest` tag, please try the timestamp from your last successful build, which will share a hash with your last working `latest`.

## Troubleshooting

### This isn't intercepting my mail?

- [ ] Are you sending emails on the 1025 or 8025 ports?
- [ ] Are you using a hostname which resolves to the mailhog docker-container, such as localhost or '127.0.0.1'?
- [ ] is the docker service running (does `docker ps -a` show mailhog Status as "Up {n} Hours|Mins|Secs|Days")

### I would like to add features to this

- [ ] Have you identified which part of this you'd like to make changes to?
- [ ] Do you know this is basically a bundle of parts and want to improve this (so mailhog improvements go to their project(s), this one will osmose them, same with docker & alpine)?
- [ ] Have you checked the license `GPL-3.0` and decided you wish to contribute under that license?
- [ ] Please raise an [issue](https://github.com/CODESIGN2/mailhog-docker/issues/new) before [submitting a pull-request](https://github.com/CODESIGN2/mailhog-docker/compare)

## Goals

### Convenience

[Mailhog](https://github.com/mailhog/MailHog) is great. Raspberry Pi's are cheap, convenient, and when paired with device-mode, it's a really easy setup for convenient, isolated functionality. 

### Interoperability

I often like to combine separate pieces of technology. I made this dockerfile so I can test email on-the-go without needing internet connection.

### Extensibility

If you pair this tool with a pi-hole you could spoof non-ssl mail internally ensuring testing or staging environments remain trapped inside.

### Enabling experimentation

This could also be useful for testing IoT email notifications if the edges are expected to send the emails, although you'd need to be able to say "use mailhog MTA" or "use real MTA" if you wanted to do that.

## Improvements

* Deploy script
* Links to other resources (tutorials, cool projects that use this etc)

## Special Thanks to

* [Docker](https://www.docker.com/) - for working on the packaging, distribution, runtime.
* [GBAMan](http://blog.gbaman.info/?p=791) - for documenting device-mode extensions for raspberry pi so well.
* [Alpine Project](https://alpinelinux.org/) - for making lightweight docker-images that have less moving parts.
* [MailHog](https://github.com/mailhog/MailHog) - for making the program we run in docker, on alpine, and I combine with device-mode on a raspberry pi zero.
* [GitHub & Actions team](https://github.com) - Wonderful humans, making cool tools.
* [CrazyMax BuildX](https://github.com/crazy-max/ghaction-docker-buildx) - Without this it would be much harder to supply multi-device-architecture images. 
