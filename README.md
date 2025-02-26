Simple docker container to run slickedit (binary proprietary software) in a docker container

I originally tried to make the build do the install, but the unattended install options don't seem to work and according to a slickedit forum they were removed
Instead, I ran the docker container, installed, and then copied the /opt/ dir out via docker cp after install, while the container was still running

```
#!/bin/bash
# QT_X11_NO_MITSHM=1 fixes some issue where the X screen was coming up blank

sudo docker run -ti --user 1000 --rm \
       -e DISPLAY=$DISPLAY \
       -e QT_X11_NO_MITSHM=1 \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /opt/:/opt \
       -v /tmp:/rtmp \
       -v /mnt:/mnt \
       -v /home:/rhome \
       --name vs \
        se-docker:latest \
        /opt/slickedit-pro2020/bin/vs
```
