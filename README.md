# BldContainers_template
Build environment for building autoSD images.

## Intro
Provides the basic environment to run OSBuild.

## Using

### Building the container
> ./build_docker_image.sh

### Installing the build environment to use the container
> ./install.sh

### Using the build environment
In the installation directory (specified in the installation step):

- Source the .alias file `source .alias`
- Build the project: `<build_container> make -C sample-images/osbuild-manifests <image>`
- Try `make help` for images to build
- Or enter the container and execute commands directly: `<build_container>``

### Notes
If working inside the container,
any pushes to the repo need to be made outside the container, as the container does not
have the user's push credentials.

 
