# Scripts for ATS2

## [Homebrew for ATS2](https://github.com/Homebrew/homebrew-core/blob/master/Formula/ats2-postiats.rb)

This script is for installing ATS2 under a Mac OS. It is maintained externally.

## [C9-ATS2-install.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install.sh)

This script is for installing ATS2 and ATS2-contrib under a
distrbution of Linux. It is primarily used in an Ubuntu box
provided by [Cloud-9](http://c9.io).

## [C9-ATS2-install-cs320.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-cs320.sh)

This script is a variant of C9-ATS2-install.sh. It is tailored
mainly for teaching BU-CAS-CS-320.

## [C9-ATS2-install-cs520.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-cs520.sh)

This script is a variant of C9-ATS2-install.sh. It is tailored
mainly for teaching BU-CAS-CS-520.

## [C9-ATS2-install-cs520-z3.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-cs520-z3.sh)

In addition to C9-ATS2-install-cs520.sh, this script installs patsolve_z3,
a Z3-based external constraint-solver for handling ATS2-typechecking constraints.

## [C9-ATS2-install-latest.sh](http://ats-lang.github.io/SCRIPT/C9-ATS2-install-latest.sh)

This script first installs ATS1 and then installs ATS2 through source
compilation (as ATS2 is implemented in ATS1). It also installs
the libatsopt and libatsynmark library packages, which are needed for
processing the books INT2PROGINATS and ATS2TUTORIAL.

## [msys2-build-ats2.sh](http://ats-lang.github.io/SCRIPT/msys2-build-ats2.sh)

This script is for installing ATS2 and ATS2-contrib under MSYS2 (the
modern rewrite of MSYS) for Windows. It is based on
"C9-ATS2-install.sh".

Installation instructions are as follows:

*    install MSYS2 following their [documentation](http://msys2.github.io/)
*    open up the MSYS2 shell
*    copy the script to a directory (say `$D`) on your system (e.g., `$D`
could stand for `~/tst`) -- it is this directoy that ATS2 and ATS2-contrib will be installed to
*    `cd $D`
*    ensure the script is executable (e.g. by `chmod +x msys2-build-ats2.sh`)
*    finally, run the script

## [Sortsmill-Gentoo-Overlay](https://bitbucket.org/sortsmill/sortsmill-gentoo-overlay)

The sortsmill overlay for Gentoo is a collection of ebuilds related in
some way to font development. It is a Mercurial
[repository](https://bitbucket.org/sortsmill/sortsmill-gentoo-overlay) and
is listed by "layman -L" under the name sortsmill. So you can install it,
if you are using layman, with the command

	layman -a sortsmill

Ebuilds related to ATS2 include

*       dev-lang/ats2                 -- install ATS2
*       dev-lang/ats2-github          -- (try to) install ATS2-github
*       dev-lang/ats2-contrib         -- install ATS2-contrib
*       dev-lang/ats2-contrib-github  -- install ATS2-contrib-github
*       app-emacs/ats2-mode           -- install ats2-mode and optionally also install flymake

You can have multiple versions of ATS2 and ATS2-contrib installed
simultaneously, using eselect or settings of PATSHOME and/or PATSHOMERELOC
to control which versions are used. The ATS2 and ATS2-contrib versions are
controlled independently. (I thought this better than trying to impose
version-matching constraints.)

There is also dev-lang/ats for installing ATS1; this is pulled in by
dev-lang/ats2-github. It is a clumsy ebuild based on the one that is in the
main Gentoo repository.

A Gentoo ebuild is just a Bash script running in a certain environment,
mostly defining certain Bash functions, and so may be useful even to
non-Gentoo users as reading material. (It's not a makefile, nor is it in a
special file format like what you find in rpm and dpkg packages.)

(Gentoo users may be curious about my ebuild-writing style. It is based on
what is common practice in Exherbo Linux, though their repository layout
and script conventions are different.)

The above brief description of the sortsmill overlay is taken
[on-line](https://groups.google.com/forum/?fromgroups#!topic/ats-lang-users/Jj79enV9MpY).
