# ghdl-io

THIS REPO IS NOT FUNCTIONAL, YET

Subdir `site` contains sources to generate the web page at [ghdl.github.io](https://ghdl.github.io). The content is automatically generated and pushed from travis-ci to repo `github.com/ghdl/ghdl.github.io` each time a commit is pushed to this branch (`master`). There is also a daily cron job, which is run if no build is done in the last 24h.

1. The [wiki](https://github.com/ghdl/ghdl/wiki) of ghdl/ghdl is cloned to a subir in `site/content`. Filenames and link syntax are modified, and metadata is added.
3. [Hugo :: A fast and modern static website engine](https://gohugo.io/) is downloaded, extracted and executed.
6. If there is any difference between the new content and the content in the target repo, the site is pushed and, thus, deployed.

The script to automate the procedure ([`travis/gh-pages.sh`](/1138-4EB/ghdl-io/tree/master/travis/gh-pages.sh)) is based on [gist.github.com/domenic/ec8b0fc8ab45f39403dd](https://gist.github.com/domenic/ec8b0fc8ab45f39403dd).
