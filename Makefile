VERSION ?= 1.0.0
NAME := rebuildeq.com

.PHONY: server
server:
	@hugo server
.PHONY: build
build: 
	@#rm -rf public/*
	@hugo -b https://rebuildeq.com/
relogin:
	firebase logout
	firebase login
	firebase use rebuildeq-1
deploy: build
	@firebase deploy
set-version:
	@echo "VERSION=${VERSION}" >> $$GITHUB_ENV