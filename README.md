# Richard's Custom Nix Packages

Made using the template from this repository:
https://github.com/drupol/my-own-nixpkgs

## Usage

Begin adding packages to the `pkgs/by-name` directory. Follow the
same approach as adding packages in `nixpkgs`. Similar to [RFC140], packages
added in this directory will be automatically discovered.
- Create a new directory for each package.
- Inside each directory, create a `package.nix` file.
 
Optionally, you can add packages directly to the `pkgs/` directory and
manually update the bindings in the `imports/pkgs-all.nix` file.

### Integrating This Repository as an Overlay

WARNING this is intended for my personal use only I make no guarantees it will not be broken, use at your own risk!

To use this repository as an overlay in another project, follow these steps:

1. **Add the Repository as an Input**:

   Add the following to your `nix` file to include this repository as an input:

   ```nix
   inputs = {
       my-custom-nixpkgs.url = "repo-url";  # Replace "repo-url" with the actual URL to your repository
   };
   ```

2. **Include the Overlay in `pkgs`**:

   When constructing `pkgs`, include the overlay as follows:

   ```nix
   pkgs = import inputs.nixpkgs {
     overlays = [
       inputs.my-custom-nixpkgs.overlays.default
     ];
   };
   ```

3. **Use Your Packages**:

   Access the packages in your project like this:

   ```nix
   buildInputs = [ pkgs.example1 pkgs.example2 ];
   ```

[RFC140]: https://github.com/NixOS/rfcs/pull/140

### Examples

Refer to the dummy projects `example1` and `example2` for practical examples of
how packages can be structured.

## Going further

- Use the continuous integration service of your choice to build and test your
  packages
- Add a binary cache to your repository to speed up builds and avoid
  recompilation using [Cachix](https://cachix.org/)
- This project uses a flake framework, we recommend to use [flake-parts](https://flake.parts)

