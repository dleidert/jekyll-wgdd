---
layout: post
lang: en
date: 2005-10-31T22:12:00.000+01:00
last_modified_at: 2015-02-11T20:59:44.631+01:00
title: >
  Debian package repository at debian.wgdd.de now signed
author: dleidert
description: >
  The private Debian repository at debian.wgdd.de is now signed. Using it may
  result in GPG related warnings about non verified signatures as long as the
  key is not added to the apt-key keyring.
categories:
- debian
- repository
tags:
- software
- debian
- packaging
- repository
redirect_from:
- /2005/10/debian-package-repository-at.html
---

My repository is now signed. So maybe you see the following warning when running `apt-get`{: title="Debian APT package handling utility"} from Debian Etch or Sid or Ubuntu Breezy:

```shell
W: GPG error: http://debian.wgdd.de unstable Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 0F719C35E394D996
W: You may want to run &#187;apt-get update&#171; to correct these problems
```

Please read the related information about how getting my key under [Archive signing key](http://debian.wgdd.de/repository#gpgkey).
