
.PHONY: coverage
all: srb2.pk3 music.dta player.dta zones.pk3

clean:
	rm bin/*

coverage:
	@./coverage.sh

bin/srb2.pk3: srb2.pk3/*
	pushd srb2.pk3 && \
	zip -FSr ../bin/srb2.pk3 * && \
	popd

bin/music.dta: music.dta/*
	@echo "TODO: Add WAD creation tool. For now it's a PK3 zipper"
	pushd music.dta && \
	zip -FSr ../bin/music.dta * && \
	popd

bin/player.dta:
	@echo "TODO: Add WAD creation tool"

bin/zones.pk3:
	pushd zones.pk3 && \
	zip -FSr ../bin/zones.pk3 * && \
	popd
