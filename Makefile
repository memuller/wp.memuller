run:
	cd docker; $(MAKE) run ;

build:
	cd deploy; $(MAKE) pull;
	cd docker; $(MAKE) prepare; $(MAKE) build;

update:
	cd deploy; $(MAKE) push;

pull:
	cd deploy; $(MAKE) pull;