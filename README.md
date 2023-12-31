# SRB2 Total Conversion

A Creative Commons-licensed, non-copyright-infringing total conversion for
Sonic Robo Blast 2 in the spirit of Freedoom and LibreQuake.

# Getting Started

`CREDITS.TXT` serves as our record for what needs to be done as
well as who did what regarding the project.
Missing contributors next to a file name means that this file is yet to be
added to the game. Additional, such as this:

File names should follow this schema for consistency

```
srb2.pk3:/Graphics/HUD/Titlecard/LTACTRED_comic.png "Zibon 'PixL' Badi" (unused;nonstandard)
```

**DEVELOPER WARNING**: *Every release of our total conversion needs to
include the current version of this file in it's WAD/PK3 files for legal
reasons*.


## Creating Assets and Configs

The following directories are named after the WAD/PK3 files they're
intended to replace and consequently represent where you should add your
contribution:

`srb2.pk3/`
: Main game assets

`zones.pk3/`
: Game levels

`player.dta/`
: Playable characters

`music.dta/`
: Soundtrack (MIDI and OGG) and `MUSICDEF`

### File formats

- All graphics must be submitted in PNG format. We can convert them later.
- All music files must be submitted in OGG format for digital tracks and
  MIDI for, well... MIDI music. This is a game engine limitation.
- Text-based config files may retain their original file names (for
  compatibility), but should when appropriate be noted as text files for
  easy editing.

## Levels

Sonic Robo Blast 2 uses a custom variant of the Doom Builder called the
[Zone Builder](https://mb.srb2.org/addons/zone-builder.149/)

## Packaging

We recommend storing your packaged builds under `bin/`. This file should be
caught by the `.gitignore`, but please make sure not to include packaged
binaries in your commits.

To help with Doom and SRB2-related packaging quirks, (e.g. convert graphics
to paletted `.lmp` format), we recommend
[SLADE](https://slade.mancubus.net/)

## Planning/Concept/Ideas/Stories/etc.

For conceptual work, such as concept art, story drafts, please include them
under `docs/`. Text documents are best written in
[GitHub-flavored Markdown](https://github.github.com/gfm/), so that they're
readable.


# How to contribute

To contribute, we suggest submitting it to the
[Liquid Underground Discord](https://discord.gg/HVTzVfAWG6).  
Alternatively you can also submit your contribution as a Pull Request or
through this project's issue tracker.

If you're new to using Git or GitHub, we recommend the following pages:

- [GitHub workflow](https://docs.github.com/get-started/quickstart/github-flow)
- [How To Write A Git Commit](https://chris.beams.io/posts/git-commit/)

## Legal conditions to submitting your work

We're sorry for the legalese, but before we can accept your contribution,
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

## Technical requirements to contribute

1. If you wish to publish project files for your contribution (e.g.
   multi-layered images, incompatible tracker modules), place them
   under the `docs/` directory to separate it from the finished assets.
2. All finished graphics must be submitted in PNG format. We can convert them later.
3. We recommend submitting digital audio in OGG format for compatibility
   with different builds of Sonic Robo Blast 2. Depending on the file size,
   we also accept tracker modules in MOD,XM,IT and S3M formats, although we
   may convert them to OGG for technical compatibility down the line.
   MIDI music needs to be published as MIDI files for compatibility.
   If you need tools to help convert your audio, we recommend FFMPEG or Audacity.
4. Text-based config files may retain their original file names (for
   compatibility), but should when appropriate be noted as text files in
   `CREDITS.txt` for easy editing.
