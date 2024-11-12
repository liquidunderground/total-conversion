---
written by:
  - "[[Zibon Badi|Zibon Badi]]"
---
In general, Weissblatt accepts three kinds of audio files:

1. *Digital Audio* formats such as [WAV](https://en.wikipedia.org/wiki/WAV), [OGG Vorbis](https://en.wikipedia.org/wiki/Vorbis) or [MP3](https://en.wikipedia.org/wiki/MP3). Although the engine may support many formats, we generally only accept OGG Vorbis due to it's openness and compression ratios.
2. [MIDI](https://en.wikipedia.org/wiki/MIDI) files based on .
3. *Tracker Modules*, a catch-all term for an assortment of tracker-specific hybrid formats. Like digital audio, we generally only accept the most common tracker formats *MOD/S3M/XM/IT*.
# Composition Software

In Principle you can use whatever software or workflow suits your fancy to make music for Weissblatt as long as a nice-sounding OGG](https://en.wikipedia.org/wiki/Vorbis), MOD/S3M/XM/IT or MIDI file pops out at the end.

## Digital Audio Music

*Digital Audio* is a technical term for the kind of music you're most likely accustomed to. Be it your CD collection, a sound effect or a strongly-worded voice message on your social media feed, all of it is simply a long series of recorded bits that are sent to your speakers. You can use pretty much any modern music program to create some kind of digital audio, so here's but a small selection of freely available ones:

- [Ardour](https://ardour.org/)
- [Zrythm](https://www.zrythm.org/en/index.html)
- [LMMS](https://lmms.io/)
- [Audacity](https://www.audacityteam.org/), which you can use for quality control as well

Digital Audio is *recorded* audio, plain and simple. As long as you keep bitrate, resolution and format in mind, you can convey any noise you want. The drawback of digital audio compared to MIDIs and tracker modules however is that digital audio files are very large, even after compression is a applied.

For Weissblatt we only accept digital audio in [OGG Vorbis](https://en.wikipedia.org/wiki/Vorbis), so we can keep the file sizes at least *somewhat* under control.

### Loop points

Weissblatt's soundtracks are designed to loop. Aside from compositional techniques (e.g. chord loops, cleverly-placed transitions), the track needs to be prepared to loop well by having small sections of silence removed from the beginning and end of a file. Below you can see such a section highlighted in [Audacity](https://www.audacityteam.org/):

![[audacity-silence.png]]

You can also define lead-ins for digital audio songs to create one-time intros, etc.. Simply add a field called `LOOPPOINT` to the file's metadata, like in the image below. This tells the engine where to start looping the track once the end of the file is reached. Not defining `LOOPPOINT` will make the song loop from the beginning of the file:

![[audacity-export.png]]

The number that needs to be entered into `LOOPPOINT` is counted in *samples*, which are the little dots you start to see once you zoom far enough into the track. These are the literal bits of current that get sent to your speakers to create music. Clicking on the cursor selection widget at the bottom of Audacity's window should give you the sample count for the start/end of your loop. `LOOPPOINT` only requires the start and will simply loop between this and the end of the file.

![[audacity-looppoint.png]]
#### Pro Tip: Smooth loops

To avoid clipping, I recommend zooming into the audio signal and matching the end of the track and your loop point to samples in the middle between the peaks with roughly the same curve direction.
### Mastering and Loudness

Don't you hate it when you're listening to music and you constantly need to adjust your volume because the next song is either too quiet or too loud? This is the result of a long-standing audio mixing trend known as the [Loudness War](https://en.wikipedia.org/wiki/Loudness_war). To stop Weissblatt's music from falling into this trap, there's a mixing standard called [EBU R 128](https://en.wikipedia.org/wiki/EBU_R_128) which defines measurements for the loudness of entire audio programmes, such as music files. [Loudgain](https://github.com/Moonbase59/loudgain) is my preferred tool to measure music against EBU R 128 during mastering. A typical loudgain workflow should look something like this:

```
$ loudgain "/path/to/file.wav"

[✔] Scanning '/path/to/file.wav' ...
[✔] Container: WAV / WAVE (Waveform Audio) [wav]
[✔] Stream #0: PCM signed 16-bit little-endian, 16 bit, 44100 Hz, 2 ch, stereo
 100% [==========]

Track: /path/to/file.wav
 Loudness:   -15.31 LUFS
 Range:        8.30 dB
 Peak:     1.006792 (0.06 dBTP)
 Gain:        -2.69 dB
```

The most important metric here is the *Loudness*, measured in *Limit Under Full Scale* (LUFS). This is basically a decibel (dB) value adjusted to measure the entire audio track. Weissblatt's music is generally mixed to be normalized (meaning the whole loudness spectrum of the file is utilized) while retaining around `-12 LUFS` for consistency across the entire soundtrack. The Loudness/LUFS measurement can be easily controlled using simple amplification, although it's up to your ears to judge whether a song at `-12 LUFS` still sounds pleasing to listen to. Especially bass instruments tend to be louder than they sound.

## MIDI

When composing, keep in mind that unlike digital audio, MIDI files cannot have defined loop points. Instead, the engine simply loops the entire track from the beginning.

Generally, most modern [DAW](https://en.wikipedia.org/wiki/Digital_audio_workstation)s and composition programs support some kind of MIDI export so a good program to compose with should be easy to come by. However, your MIDI songs should try to adhere to [General MIDI](https://de.wikipedia.org/wiki/General_MIDI) when possible for maximum compatibility.

I personally use [Rosegarden](https://www.rosegardenmusic.com/) to hand-translate my MIDI files, although it requires an additional MIDI synthesizer for playback.

The most common MIDI synth (aside from Windows' built-in GS Wavetable synth), is probably [Fluidsynth](https://www.fluidsynth.org/), which is also used by the engine. By default, Fluidsynth usually uses the SF2 soundfont *FluidR3*, although other SF2 soundfonts may be used (e.g. through configuring your system's Fluidsynth or the environment variable `$SDL_SOUNDFONTS`).

### Composition programs

- [Musescore](https://musescore.org/) (Sheet music/engraving-oriented)
- [Rosegarden](https://www.rosegardenmusic.com/) (Hybrid interface; requires external MIDI synth)

### MIDI synthesizers 

- [Fluidsynth](https://www.fluidsynth.org/)
- [TiMidity++](https://en.wikipedia.org/wiki/TiMidity%2B%2B)

## Trackers

*Tracker Module* formats such as *MOD/XM/S3M/IT* are natively supported by Weissblatt's engine and can be considered a hybrid between digital audio formats (like OGG) and MIDI. When loaded into Weissblatt's engine, instrument samples contained within the module are played back in real-time according to pre-programmed patterns, resulting in music at 1/10th the file size of a full digital audio render without the need for a dedicated MIDI synthesizer.

Weissblatt's tracker module support is based on [libopenmpt](https://lib.openmpt.org/libopenmpt/) on which the tracker [OpenMPT](https://openmpt.org/) is based. Since Weissblatt is essentially running a small OpenMPT in the background of it's engine, this means OpenMPT will sound closest to how the modules are interpreted in-engine. This is (ironically) due to bugs and extensions that make libopenmpt sound different from each module format's original tracker program (like [Impulse Tracker](https://en.wikipedia.org/wiki/Impulse_Tracker)).

At this point you may ask: What in the name of the underworld is a tracker? Well, [Ahoy](https://www.youtube.com/watch?v=roBkg-iPrbw) can probably explain it better than me, but in short it's a type of audio software based on writing sequences of sound commands into a spreadsheet-like interface to effectively "program" music in an assembly language-like manner. It may sound complicated, but it yields a lot of control without requirng you to have a degree in music.

Trackers themselves are not just for making modules though: For example, my personal weapon of choice for creating digital audio music is [Furnace Tracker](https://github.com/tildearrow/furnace), which emulates an assortment of different retro sound chips, such as the [SID by MOS Technologies](https://en.wikipedia.org/wiki/MOS_Technology_6581), the [Yamaha YM2612](https://en.wikipedia.org/wiki/Yamaha_YM2612) or the [MOS Paula](https://en.wikipedia.org/wiki/Amiga_Original_Chip_Set#Paula) (all three of which make up a typical Weissblatt soundtrack, btw). Although unable to support tracker module exports, the ability to easily program and fine-tune old-school chip synthesizers like these allows me to create Weissblatt's unique fantasy-chipstune style of soundtrack.

### Chip trackers

- [Furnace Tracker](https://github.com/tildearrow/furnace)
- [Delfemask](https://pareidolabs.itch.io/windows-deflemask) (Windows/iOS/Android only; proprietary; original inspiration for Furnace)
- [Famitracker](https://www.famitracker.com/) (emulates only the NES soundchip)

### Traditional Trackers

-  [OpenMPT](https://openmpt.org/) (Windows only; works well under [WINE](https://www.winehq.org/))
- [Milky Tracker](https://milkytracker.org/) (inspired by [Fast Tracker 2](https://en.wikipedia.org/wiki/FastTracker_2), moderately straight-forward interface)
- [Schism Tracker](https://schismtracker.org/) (Accurate rebuild of [Impulse Tracker](https://en.wikipedia.org/wiki/Impulse_Tracker) for modern systems)

### Weird Trackers

- [Renoise](https://www.renoise.com/) (proprietary and paid)
- [Radium](https://users.notam02.no/~kjetism/radium/)
- [SunVox](https://warmplace.ru/soft/sunvox/) (based on built-in modular synthesizers; literally runs on your Palm Pilot)

# Importing music into Weissblatt

When building a [WAD](https://doomwiki.org/wiki/WAD) or [PK3](https://doomwiki.org/wiki/PK3) for use in-game, all music files are named according to a *prefix* and a *handle*, usually followed by a file extension.

- The prefix `D_*` is used for MIDI music (example: `D_VSBOSS.mid`)
- The prefix `O_*` is used for digital audio music (example: `O_VSBOSS.ogg`)

Each *handle* is case-insensitive and may only be six characters long. Any longer filename is truncated by the engine (e.g. `PINBALL -> PINBAL`).

Tracker modules can be defined as either MIDI or digital audio music, depending on the prefix used.