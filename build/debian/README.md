![debian](https://github.com/lambdaclass/cairo-by-example/assets/53660242/2046d1cd-f47a-4bff-b316-90d0e5bd8c4c)
# Building packages for Debian

Debian uses a tool called `dpkg` to install 3rd-party `.deb` binaries.

### How do I install it?
You can use either the `installer.sh` script, which automates the process, or you can download the .deb in the `releases` section. 

### How do I upgrade compile the latest `.deb`? <sup><sub>maintainers only!</sub></sup>
* We need to go the `build/debian` folder and execute the `create_deb.sh` script.
```bash
./create_deb.sh compile
```
> We pass the `compile` argument to tell the script we want to compile from source before creating the .deb. Not passing the `compile` argument will skip compilation and go straight to the `.deb` creations, which assumes you already have all the different versions compiled. This step will be done for every `cairo` version.
* Once compiled, we want to push the .deb into GitHub.
```bash
find . -type f -name "*.deb" -exec sh -c 'VERSION=$(echo "{}" | sed "s/.*@\(.*\)\.deb/\1/"); gh release create v$VERSION {} --title "v$VERSION" --notes "Cairo v$VERSION .deb binary release."' \;
```
> This command will look for any deb file, and will upload it to GitHub. Don't worry, if the version is already in GitHub, it will skip that tag.

Done! Now the GitHub repo should have the new releases.
