VERSION = $(shell git tag | tail -n 1)
GOOS := $(shell go env GOOS)
GOARCH := $(shell go env GOARCH)
RUNTIME_GOPATH := $(GOPATH):$(shell pwd)
SRC := $(wildcard *.go) $(wildcard src/mypasswd/*.go)
TEST_SRC := $(wildcard src/mypasswd/*_test.go)
CPATH := $(shell mysql_config --include | sed 's/-I//')

all: mypasswd

mypasswd: $(SRC)
	GOPATH=$(RUNTIME_GOPATH) CPATH=$(CPATH) go build

test: $(TEST_SRC)
	GOPATH=$(RUNTIME_GOPATH) CPATH=$(CPATH) go test -v $(TEST_SRC)

dev_dep:
	go get github.com/stretchr/testify

clean:
	rm -f mypasswd{,.exe} *.gz *.zip

package: clean mypasswd
ifeq ($(GOOS),windows)
	zip mypasswd-$(VERSION)-$(GOOS)-$(GOARCH).zip mypasswd.exe
else
	gzip -c mypasswd > mypasswd-$(VERSION)-$(GOOS)-$(GOARCH).gz
endif
