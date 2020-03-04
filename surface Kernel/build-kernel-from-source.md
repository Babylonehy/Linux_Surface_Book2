#Compiling the Kernel from Source
### For Debian-Based Systems (Debian, Ubuntu, Pop!_OS, elementary OS, ...)

1. Install the required build-dependencies:
   ```
   sudo apt install build-essential binutils-dev libncurses5-dev libssl-dev ccache bison flex libelf-dev
   ```

2. Clone the kernel repository:
   ```
   git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
   ```
   and change into its directory via `cd linux`.

   If you already have the sources checked out from a previous build and want to re-compile the kernel for an updated version, you can run `git fetch` inside the repository to update it and then follow the steps below.

3. Check out your desired version, e.g. via
   ```
   git checkout v5.3.14
   ```
   You usually want the latest version supported by the patches, so change this accordingly.
   It is recommended that you then create a new branch, e.g. via
   ```
   git switch -c v5.3.14-surface
   ```

4. Assuming you have cloned this repo to `~/linux-surface`, apply the patches via
   ```
   for i in ~/linux-surface/patches/[VERSION]/*.patch; do patch -p1 < $i; done
   ```

5. Configure your kernel.
   For Debian, you can use one of the configurations provided in https://github.com/linux-surface/kernel-configs.
   Check out the different branches for different kernel versions.
   For Debian based systems, you should choose the `debian-[version].config`
   If you choose one of the configurations from the repo, copy it to `.config`, e.g. via
   ```
   cp ~/linux-surface-kernel-configs/debian-5.3-x86_64.config .config
   ```
   If you did not choose a config from that repo, you should run one of the config targets in the makefile, e.g. via `make menuconfig`.

   By completing this step, you have set up the kernel sources and the configuration.
   The steps until here should be fairly similar on non-Debian based distributions.

6. Build the kernel `.deb` packages.
   For non-Debian-based distributions, please refer to the documentation of your distribution on how to build and package the kernel.
   For Debian-based distributions simply run
   ```
   make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-linux-surface
   ```

7. Install the kernel packages, e.g. via
   ```
   sudo dpkg -i linux-headers-[VERSION].deb linux-image-[VERSION].deb linux-libc-dev-[VERSION].deb
   ```