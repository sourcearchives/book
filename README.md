# Pepper&Carrot Book

This repository was created to host the desktop-publishing source and tooling to publish the open-source first book of [Pepper&Carrot](https://www.peppercarrot.com) comic.

![alt tag](https://www.peppercarrot.com/extras/forum/2017-03-23_screenshot_182109_net.jpg "Book")

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Initial Setup](#initial-setup)
- [Usage](#usage)
- [Current Limitations](#current-limitations)
- [Changelog](#changelog)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Initial Setup

> **Note:** If you want to use a language other than English (`en`), please initialise a new translation by executing `bash initLang.bash fr` (where *fr* is the new language you want using the [short code form](https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes)) before downloading the comic pages.

You will need to download or install the following to design, build, and publish Pepper&Carrot:
- **A font pack** Download and install the official Pepper&Carrot open fonts [from here](https://framagit.org/peppercarrot/fonts#peppercarrot-fonts).
- **Scribus 1.5.4 or later** Download Scribus for editing book layouts (`*.sla` files).
  - On 'buntu 16.04 please use [this PPA](https://launchpad.net/~scribus/+archive/ubuntu/ppa).
  - On Debian please [download the official](https://www.scribus.net/downloads/unstable-branch/) development AppImage, make the file executable, and run it.
- **Krita 3 or later** Download the [latest AppImage](https://krita.org/en/download/krita-desktop/) for editing graphics (`*.kra` files).
- **The comic pages** :
	* You can download them [from here](https://www.peppercarrot.com/en/static6/sources&page=download), and then extract them into the `pages` folder.
	* Or you can execute ```bash ./getPages.bash en``` (where `en` is the language using the [short code form](https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes)) to download and update them.

## Usage

* ```/``` Contains scripts and this README.
* ```/img``` Contains original graphics made for the book. Krita files, or PNG files.
* ```/lang/xx/``` Contains the different translations
	* ```/``` Contains Scribus ```*.sla``` files
	* ```/pages``` Contains the comic page sources (not delivered via git, see **Install**).

## Current Limitations

**STATUS:** needs printer info (ISBN?colorprofile) + proofread texts.

## Changelog

* **2017-11-06**: Re-structure to allow translations in multiple languages.
* **2017-06-09**: Prefinal: All header, footer, gallery, colophon, frontpage, shrink from 80 pages to 68 pages, no need 'Inside' anymore.
* **2017-06-08**: Split gfx and text: more flexibility for cleaning pages footer and adding headers.
* **2017-03-23**: Better cover, add fonts. [screenshot](https://www.peppercarrot.com/extras/forum/2017-03-23_screenshot_182109_net.jpg)
* **2016-09-05**: Initial squeletton. [screenshot](https://www.peppercarrot.com/extras/forum/2016-09-05_desktop-publishing_scribus-step1.jpg)

## License

Based on the webcomic [Pepper&Carrot](https://www.peppercarrot.com) by David Revoy,
licensed under the [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

Based on the universe of [Hereva](https://www.peppercarrot.com/static8/wiki) created by David Revoy with contributions by Craig Maloney. Corrections by Willem Sonke, Moini, Hali, CGand and Alex Gryson.

Authors of all modifications, corrections or contributions to this project accepts to release their work under the license: [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
