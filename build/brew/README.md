![homebrew](https://github.com/lambdaclass/cairo-by-example/assets/53660242/4403b29e-8430-4daa-9897-15d0e335eb4c)
# Building packages for Brew

Homebrew is a package manager for MacOS, we can define a custom `formula` for creating our own packages.

### How do I install it?
You can use either the `installer.sh` script, which automates the process, or you can `tap` our repository and do it manually.
```
brew tap lambdaclass/homebrew-cairo-lang
```
Install the desired package

    *(Make sure to add the **@** symbol to specify the version!)*
```
brew install lambdaclass/homebrew-cairo-lang/cairo-lang@2.2.0
```

### How do I upgrade the formulae repository? <sup><sub>maintainers only!</sub></sup>
* We need to clone the [cairo-lang](https://github.com/lambdaclass/homebrew-cairo-lang) repository.
```bash
git clone git@github.com:lambdaclass/homebrew-cairo-lang.git
```
> This is where the all the formulas are stored. `brew` pulls from here.
* Execute the update script `update-formulae.sh`. This should overwrite the current files within the repo.
```bash
cd homebrew-cairo-lang/
./update-formulae.sh
```
> This script gets the latest cairo-lang version from [here](https://github.com/starkware-libs/cairo/) and overwrites the formulae. If a new version is released, it will appear once the script is executed.
* Push the new changes to the repository.
```bash
git push
```
> We need to push our changes to the repo, so, if any new version is released, it will now be supported.

Done! Now the `brew` repo should have the latest `cairo-lang` version!