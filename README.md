# Travis CI SBT packager

This repository contains scripts and tools that builds a *.deb package from SBT installer found online.

It was originally based on work by [Przemek Pokrywka](http://github.com/przemek-pokrywka) and his Ubuntu SBT packager.
Over time, Travis CI needs started requiring things like

 * System-wide list of default resolvers (so that we can use super fast local mirrors)
 * Other system-wide customizations

This features require us to move to SBT 0.12.0 preview releases and make the package not useful for the rest of
the Scala community. If you need a [Debian/Ubuntu package of SBT 0.11.3](https://github.com/michaelklishin/sbt-installer-ubuntizer),
our original fork of the project is still around in a separate repository.


## Package details

The differences between SBT documentation and this package:
- SBT gets installed to /usr/lib/sbt-${version} directory to be available to all users
  (original SBT documentation tells you to install it in ~/bin, but not everybody has it on PATH)
- symbolic link is created in /usr/bin so you don't need to setup PATHS nor create anything yourself
  (if you use multiple versions of SBT you may need to modify this link after installation)


## License & Copyright

Original work by [Przemek Pokrywka](http://github.com/przemek-pokrywka).

Michael S. Klishin and Travis CI Development Team, 2012. Released under the Apache Public License 2.0.
