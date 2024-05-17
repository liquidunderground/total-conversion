
.PHONY: coverage
all: srb2.pk3 music.dta player.dta zones.pk3

clean:
	rm bin/*

coverage:
	@./coverage.sh

#bin/srb2.pk3: $(shell find ./srb2.pk3/ -name "*.png" | sed "s/.\/\(.*\)\.png/build\/\1\.lmp/g")
#bin/srb2.pk3: build/srb2.pk3
bin/srb2.pk3: build/srb2.pk3/Fades build/srb2.pk3/Flats build/srb2.pk3/Graphics build/srb2.pk3/Patches build/srb2.pk3/Sounds build/srb2.pk3/Sprites build/srb2.pk3/Textures
	pushd build/srb2.pk3 && \
	zip -FSr ../bin/srb2.pk3 **.lmp && \
	popd
	zip -FSr bin/srb2.pk3 srb2.pk3/Fades/*.png
	zip -FSr bin/srb2.pk3 srb2.pk3/Sounds/**.ogg

# Compiled GFX
build/srb2.pk3/Flats build/srb2.pk3/Graphics build/srb2.pk3/Patches build/srb2.pk3/Sprites build/srb2.pk3/Textures: srb2.pk3/Flats srb2.pk3/Graphics srb2.pk3/Patches srb2.pk3/Sprites srb2.pk3/Textures
	pushd srb2.pk3 && \
	dimgconv . -r --verbose --output ../build/srb2.pk3 --palette ../PLAYPAL.pal && \
	popd

# Raw sounds - The engine encourages it
build/srb2.pk3/Sounds: srb2.pk3/Sounds srb2.pk3/Patches srb2.pk3/Sprites srb2.pk3/Textures
	mkdir -p build/srb2.pk3/Sounds/
	cp -r srb2.pk3/Sounds/**.ogg build/srb2.pk3/Sounds/

# Fades
build/srb2.pk3/Fades: srb2.pk3/Fades 
	mkdir -p build/srb2.pk3/Fades/
	cp -r srb2.pk3/Fades/*.png build/srb2.pk3/Fades/

bin/music.dta: music.dta/*
	@echo "TODO: Add WAD creation tool. For now it's a PK3 zipper"
	pushd music.dta && \
	zip -FSr ../bin/music.dta *.ogg *.mid MUSICDEF && \
	popd

bin/player.dta:
	@echo "TODO: Add WAD creation tool"

bin/zones.pk3:
	pushd zones.pk3 && \
	zip -FSr ../bin/zones.pk3 * && \
	popd
