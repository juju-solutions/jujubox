TAG=jujusolutions/jujubox:latest

build:
	docker build -t ${TAG} ./
	@ docker images ${TAG} --format {{.Size}}
	
test:
	./test-jujubox.sh

clean:
	docker rmi -f ${TAG}
