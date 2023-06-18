[![microinit logo](http://microbox.rocks/assets/readme-headers/microinit.png)](http://microbox.cloud/open-source#microinit)
 [![Build Status](https://github.com/micropack/microinit/actions/workflows/ci.yaml/badge.svg)](https://github.com/micropack/microinit/actions)

# Microinit

A small, proper, init process for docker containers.

## Why microinit?

Docker containers don't usually run with a true init process, and often times suffer from having un-reaped processes sitting around.
There are other init processes that can take care of this.
One of which is my_init which is written in Python.
It works well, but the only issue is that it uses the Python runtime which uses a little more ram than we would like.
Writing the microinit in C helps reduce the memory footprint, allowing more docker containers to run on a system.

## Usage:
    microinit [options...] [init command to run]
        Options:
        --quiet                 Set log level to warning
        --no-killall            Skip killall on shutdown
        --skip-startup-files    Skip /etc/rc.local and /etc/microinit.d/* files

If no command is specified, it defaults to:
    /opt/gomicro/sbin/runsvdir -P /etc/service

Before running the init command, microinit will run:
* /etc/microinit.d/*
* /etc/rc.local

## TODO
- documentation

### Contributing

Contributions to the microinit project are welcome and encouraged. Microinit is a [Microbox](https://microbox.cloud) project and contributions should follow the [Microbox Contribution Process & Guidelines](https://docs.microbox.cloud/contributing/).

### Licence

This project is released under [The MIT License](http://opensource.org/licenses/MIT).

[![open source](http://microbox.rocks/assets/open-src/microbox-open-src.png)](http://microbox.cloud/open-source)
