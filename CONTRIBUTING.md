![Weissblatt - The Asura Incident](doc/weissblatt-lettering.png)

# Contributing to Weissblatt

As Weissblatt is a living project, this document only covers the high-level basics of contributing to the project. If you need details on the technical aspects of our engine or how we develop Weissblatt: TAI, check out the [Weissblatt Wiki] or ask around on our [Discord]

[Weissblatt Wiki]: https://wiki.weissblatt.cc
[Discord]: https://discord.gg/HVTzVfAWG6

## Legal conditions to submitting your work

Before we can accept your contribution,
the following conditions need to be met:

1. By submitting, you give us permission to license your contribution under
   [Creative Commons Attribution Share-Alike 4.0 (CC-BY-SA 4.0)][CC-BY-SA]
   and to modify or package it (e.g. cutting audio into loops, converting
   files into compatible formats, etc.) as we deem suitable for this project.
2. By submitting, you assume liability for assuring your contribution is
   free to use commercially. We can't afford to take risks here.
3. We may reject or at any point remove or replace your contribution for
   any reason and without notice.
4. You **must** include the following information alongside your contribution:
    1. Title and intended use for your contribution
    2. Your contributor's name or an explicit request not to be credited.
    3. For contributions based on legal third-party sources (such as
       CC-licensed or public domain artwork), you must provide source,
       author and licensing terms. This also applies to edited
       contributions based on previous contributions by other authors.
       Incorrect or missing information may result in your contribution
       being removed from the project at any point without notice.

[CC-BY-SA]: <https://creativecommons.org/licenses/by-sa/4.0/>


## Building the Asset PK3

The game assets for Weissblatt - The Asura Incident are built using a
custom-developed build system called [PK3Make].  Although available [on
PyPI](https://pypi.org/project/pk3make/), we also keep track of each
version of PK3Make used to build the game through Git Submodules. This
ensures sovereignty of the PyPI repository as well as reproducibility for
older builds of the game (given access to a Git repository with the
corresponding commit).

### Using PIP (recommended)

1. Clone the repository: `git clone https://github.com/liquidunderground/total-conversion.git`
2. Set up Python3
    1. Install Python
    2. Set up a [virtual environment] using `python3 -m venv .venv`
    3. Activate the virtual environment using `. .venv/bin/activate`
    4. Install PK3Make using `pip install pk3make`
3. Build the project using `pk3make all`

### Using Git Submodules (for archival purposes)

1. Clone the repository: `git clone https://github.com/liquidunderground/total-conversion.git`
2. Pull in [PK3Make] `git submodule update --init --recursive`
3. Set up Python3
    1. Install Python
    2. Set up a [virtual environment] using `python3 -m venv .venv`
    3. Activate the virtual environment using `. .venv/bin/activate`
    4. Install PK3Make using `pip install -e pk3make`
4. Build the project using `pk3make all`

[PK3Make]: https://github.com/liquidunderground/pk3make
[virtual environment]: https://docs.python.org/3/library/venv.html

## Creating Assets

When creating assets (graphics, maps, music, scripts, etc.), the
recommended general workflow is as follows:

1. Create your assets in whichever program you see fit (drawing program,
   DAW, mapping tool, etc.)
2. Test your assets in-engine For manual debugging, we recommend using [SLADE](https://slade.mancubus.net/), but *always test your against PK3Make before contributing (using `pk3make all`)*
3. Once you're ready to contribute, credit your contribution by file name under `src/CREDITS.txt`. Name credits should generally follow one of these patterns.
    1. `<FIRST NAME> "<NICKNAME>" <(CAP.) FAMILY NAME>`
    2. `<FIRST NAME> <(CAP.) FAMILY NAME>`
    3. `"<NICKNAME>"`
    4. `<CAP. FAMILY NAME> "<NICKNAME>" <FIRST NAME>`
    5. `<CAP. FAMILY NAME> <FIRST NAME>`
4. Commit your changes using Git. To get started using Git, we recommend
   the following guides:
    - [GitHub workflow](https://docs.github.com/get-started/quickstart/github-flow)
    - [How To Write A Git Commit](https://chris.beams.io/posts/git-commit/)

Specifics to each type of asset follow in these subsections.

### Graphics 

Graphics (sprites, textures, etc.) are submitted in PNG format. Design and
test your assets against the color palette defined by `src/PLAYPAL.png`.
The engine will automatically apply this palette in-game.

Graphics must be submitted in PNG format and designed against the 256 color
palette defined by `src/PLAYPAL.png`. PK3Make will automatically convert
the PNG graphics into Doom picture format while building the PK3.


### Audio (Music and Sounds)

Sound effects are contributed as OGG Vorbis files (`.ogg`). Music files
must be in one of the following formats:

- (General) MIDI (`.mid`). The engine allows the user to select between
  MIDI and digital music, so (if possible) make sure to provide a MIDI
  version in addition to a digital music track.
- Protracker modules (`.MOD`)
- FastTracker 2 modules (`.XM`)
- ScreamTracker 3 modules (`.S3M`)
- Impulse Tracker modules (`.IT`)
- OGG Vorbis (`.ogg`)

### Maps

To create maps for Weissblatt, we recommend our in-house tool BlattPlanner (link TBA).
