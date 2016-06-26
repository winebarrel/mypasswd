package mypasswd

import (
	"bufio"
	"flag"
	"io/ioutil"
	"os"
	"strings"
)

func readStdin() (string, error) {
	reader := bufio.NewReader(os.Stdin)
	input, err := ioutil.ReadAll(reader)

	if err != nil {
		return "", err
	}

	str := string(input)
	str = strings.TrimRight(str, "\n")

	return str, nil
}

func ParseFlag(m *Mypasswd) (err error) {
	flag.StringVar(&m.Passwd, "p", "", "Password string")
	flag.BoolVar(&m.Old, "old", false, "Returns the value of the pre-4.1 implementation of PASSWORD()")
	flag.Parse()

	if m.Passwd == "" {
		m.Passwd, err = readStdin()
	}

	return
}
