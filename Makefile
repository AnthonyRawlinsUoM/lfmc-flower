all: build install pull
	
stack:
	@docker build --tag=127.0.0.1:5000/lfmc-flower .
	@docker push 127.0.0.1:5000/lfmc-flower
		
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