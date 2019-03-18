---
layout: post
lang: en
date: 2019-03-07T13:52:00.001+01:00
last_modified_at: 2019-03-07T13:52:48.180+01:00
title: >
  Exclude files from being exported into the zip/tar source archives on github.com
author: dleidert
description: >
  Exclude files from being export into source archives (zipball / tarball)
  using the export-ignore attribute in .gitattributes on GitHub and GitLab.
categories:
- github
- github-pages
tags:
- software
- planet-debian
- git
- github pages
- github
redirect_from:
- /2019/03/exclude-files-from-being-exported-into.html
---

[GitHub.com][github] (and probably [GitLab][gitlab] too) provides various ways to export the Git branch contents or tags and releases as Zip- or Tar-archives. When creating a release, these tar-/zipballs are automatically created and added to the release. I often find archives, which contain a lot of files not useful to the end user, like `.github` directories, Git (`.gitignore`, `.gitattributes`) or CI related files (`.travis.yml`, `.appveyor.yml`). Sometimes they also contain directories (e.g. for test files), the repository owner wants to host in Git, but does not need for the source distribution. But there is an easy way to keep these files out of the automatically created source archives and keep the latter clean by using the `export-ignore` attribute in the `.gitattributes` files:

```shell
# don't export the github-pages source
/docs export-ignore
# export some other irrelevant directories
/foo export-ignore
/test export-ignore
# don't export the files necessary for CI
Gemfile export-ignore
.appveyor.yml export-ignore
.travis.yml export-ignore
# ignore Git related files
.gitattributes export-ignore
.gitignore export-ignore
```

[github]: https://github.com
[gitlab]: https://gitlab.com
