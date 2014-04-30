

dl/gs-core-1.2.zip:
	mkdir -p dl
	cd dl && wget http://graphstream-project.org/media/data/gs-core-1.2.zip
	
dl/gs-ui-1.2.zip:
	mkdir -p dl
	cd dl && wget http://graphstream-project.org/media/data/gs-ui-1.2.zip
	
dl/%.jar: dl/%.zip
	unzip -jo $< $*/$*.jar -d dl

extract: dl/gs-core-1.2.jar dl/gs-ui-1.2.jar
	jar xf dl/gs-core-1.2.jar
	jar xf dl/gs-ui-1.2.jar
