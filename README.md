# devu-uvc
## USB Video Class diver for QNX 6.5/6.6 and above.

    The driver very precisely emulates V4L2 Linux kernel API (V4L2 core) and
uvcvideo API for controlling extension units functionality. Therefore driver
is not rely on Linux kernel code, except for headers. This is not a fork, but
standalone UVC implementation. V4L2 API was choosen because it is de facto
standard for video capturing for even non-Linux operation systems, like
OpenBSD, NetBSD, FreeBSD, and now QNX.
    Due to non-monolithic kernel restrictions, driver implements only MMAP
buffers handling and generic read/write access through the accessing file
descriptor. Other types of buffer access (USERPTR and DMABUF) can't be
implemented on QNX 6.x.
    This implementation goes far beyond comparing to the Linux uvcvideo driver
and supports more controls and UVC variety of devices, for example, UVC analog
video grabbers, audio inputs, etc. All features are tighted strongly with V4L2
API.

## Platforms
This will build the x86, x86 debug and the armlev7 variant of the driver

To add a new variant use the following commands:
```bash
$ cd devu-uvc
$ cd 3dparty
$ addvariant nto <CPU> a
$ cd ../nto
$ addvariant <CPU> o
$ cd ..
$ make
```
With &lt;CPU&gt; being one of arm, mips, ppc, x86 (650) or arm, x86 (660)
mips and ppc may need a-be or a-le and o-be or o-le respectively
add -g to the variant for a debug version of the driver.

## TODO
* Note about sysfs.
* Note about media.
* Note about raw control read.
* Note about QNX extensions of buffer handling.
