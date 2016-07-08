all: compile docker

compile:
		CGO_ENABLED=0 go build -o repofilter

docker:
		docker build --force-rm=true -t sjezewski/repofilter .
