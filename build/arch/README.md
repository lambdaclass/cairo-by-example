![image](https://github.com/lambdaclass/cairo-by-example/assets/53660242/ea79c985-619d-4a25-b00a-a335a89b74d9)
# Building packages for Arch Linux 

Arch Linux supports 3rd-party packages via the *arch user repository* or *AUR*.

### How do I install it?
You can use either the `installer.sh` script, which automates the process, or you can use any AUR Helper of your choice. 

Just install the `cairo-lang` package and let it compile for you.

### How do I upgrade the AUR repository? <sup><sub>maintainers only!</sub></sup>
* We need to clone the AUR repo.
```bash
git clone ssh://aur@aur.archlinux.org/cairo-lang.git
```
> This is where Arch saves our package info. Here is where users pull the data when installing the package.
* Execute the update script `update-version.sh`. This should overwrite the current files within the repo.
```bash
cd cairo-lang/
./update-version.sh
```
> This script gets the latest cairo-lang version from [here](https://github.com/starkware-libs/cairo/) and overwrites the `PKGBUILD` and `.SRCINFO` files.
* Push the new changes to the remote.
```bash
git push
```
> We need to push our changes to the AUR origin, to update our repo where users will install the package.

Done! Now the AUR repo should have the latest `cairo-lang` version!
