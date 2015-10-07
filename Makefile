
all: extract-stamp

dl/gs-core-1.2.zip:
	cd dl && curl -O http://graphstream-project.org/media/data/gs-core-1.2.zip
	
dl/gs-ui-1.2.zip:
	cd dl && curl -O http://graphstream-project.org/media/data/gs-ui-1.2.zip
	
dl/%-sources.jar: dl/%.zip
	unzip -jo $< $*/$*-sources.jar -d dl

dl/%.jar: dl/%.zip
	unzip -jo $< $*/$*.jar -d dl

extract-stamp: dl/gs-core-1.2.jar dl/gs-ui-1.2.jar Makefile
	mkdir -p lib
	cd lib && jar xf ../dl/gs-core-1.2.jar
	cd lib && jar xf ../dl/gs-ui-1.2.jar
	touch extract-stamp

#extract-stamp: dl/gs-core-1.2-sources.jar dl/gs-ui-1.2-sources.jar Makefile
#	mkdir -p src
#	cd src && jar xf ../dl/gs-core-1.2-sources.jar org
#	cd src && jar xf ../dl/gs-ui-1.2-sources.jar org
#	touch extract-stamp

clean:
	rm -rf dl/* lib/* extract-stamp
