
.PHONY: coverage
all: srb2.pk3 music.dta player.dta zones.pk3

clean:
	rm bin/*

coverage:
	@echo "=== ASSET COVERAGE IN % ==="
	echo "4 k $(shell grep "	" CREDITS.txt | wc -l) $(shell grep ":" CREDITS.txt | wc -l) / 100 * p q" | dc

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
