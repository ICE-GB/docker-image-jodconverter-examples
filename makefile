build:
	docker build --build-arg BASE_VERSION=0.1.6 --target gui . -t ghcr.io/ice-gb/jodconverter-examples:gui
	docker build --build-arg BASE_VERSION=0.1.6 --target rest . -t ghcr.io/ice-gb/jodconverter-examples:rest

start-gui: stop
	docker run --name jodconverter-gui -m 512m --rm -p 8080:8080 ghcr.io/ice-gb/jodconverter-examples:gui

start-rest: stop
	docker run --name jodconverter-rest -m 512m --rm -p 8080:8080 ghcr.io/ice-gb/jodconverter-examples:rest

stop:
	docker stop --name jodconverter-rest > /dev/null 2>&1 || true
	docker stop --name jodconverter-spring > /dev/null 2>&1 || true
