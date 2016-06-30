VERSION = $(shell git tag | tail -n 1)
GOOS := $(shell go env GOOS)
GOARCH := $(shell go env GOARCH)
RUNTIME_GOPATH := $(shell pwd)
ifdef GOPATH
RUNTIME_GOPATH := $(GOPATH):$(RUNTIME_GOPATH)
endif
SRC := $(wildcard *.go) $(wildcard src/mypasswd/*.go)
TEST_SRC := $(wildcard src/mypasswd/*_test.go)

all: mypasswd

mypasswd: $(SRC)
	GOPATH=$(RUNTIME_GOPATH) go build -o mypasswd

test: $(TEST_SRC)
	GOPATH=$(RUNTIME_GOPATH) go test -v $(TEST_SRC)

dev_dep:
	go get github.com/stretchr/testify

clean:
	rm -f mypasswd mypasswd.exe *.gz *.zip

package: clean mypasswd
ifeq ($(GOOS),windows)
	zip mypasswd-$(VERSION)-$(GOOS)-$(GOARCH).zip mypasswd.exe
else
	gzip -c mypasswd > mypasswd-$(VERSION)-$(GOOS)-$(GOARCH).gz
endif
