all: build install pull
	
stack:
	@docker build --tag=anthonyrawlinsuom/lfmc-flower .
	@docker push anthonyrawlinsuom/lfmc-flower
		
build:
	@docker build --tag=anthonyrawlinsuom/lfmc-flower .

install:
	@docker push anthonyrawlinsuom/lfmc-flower
	
pull:
	@docker pull anthonyrawlinsuom/lfmc-flower

release:
	./release.sh

clean:
	@docker rmi --force anthonyrawlinsuom/lfmc-flower