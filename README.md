# fairphone2-docker-build
Docker build environment for Fairphone Open OS.

Inspired by https://github.com/justfortherec/fairphone2-build-env

This is a work in progress and probably does not work as expected yet. Stay tuned for updates!

```bash
docker-compose run --rm fp
```

* Time for first sync: ~1h
* Space consumption after sync: ~23 GiB
* Build time (Intel i7-4770, 16GiB RAM, using an HDD, not SSD): ~1,25 h
* Space consumption after successful build: ~53 GiB

## Todos

* [x] Successfully complete sync and build process
* [x] Figure out minium set of required dependencies
* [ ] Figure out how to flash build properly to device
* [ ] Test if build is functional
* [ ] Add patching sysm
  * [ ] Add patch for enabling signature spoofing
  * [ ] Add patch for fully functional UnifiedNlp/MicroG
  * [ ] Add [patch for Build F-Droid Privileged Extension](https://code.fairphone.com/gerrit/#/c/27/)
