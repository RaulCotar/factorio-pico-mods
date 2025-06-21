INCLUDE := $(wildcard *.lua) graphics info.json locale src readme.md thumbnail.png
MODSDIR := ~/.factorio/mods
BUILDIR := build
ZIPFILE := $(MODSDIR)/$(shell jq -r '.name+"_"+.version' info.json).zip

.PHONY: install uninstall clean run

install: $(ZIPFILE)
	@echo -e '\e[32mINSTALLED\e[0m'

$(ZIPFILE): $(patsubst %,$(BUILDIR)/%,$(INCLUDE))
	rm -rf $@
	7z a $@ $(BUILDIR)

$(BUILDIR)/%: % | $(BUILDIR)
	cp -r $< $@

$(BUILDIR):
	mkdir -p $@

uninstall:
	rm -rf $(ZIPFILE)
	@echo -e '\e[32mREMOVED\e[0m'

clean:
	rm -rf $(BUILDIR)

run: $(ZIPFILE)
	factorio