package main

import (
	"fmt"
	"log"
	"mypasswd"
)

func init() {
	log.SetFlags(0)
}

func main() {
	defer func() {
		if err := recover(); err != nil {
			log.Fatal(err)
		}
	}()

	m := &mypasswd.Mypasswd{}

	err := mypasswd.ParseFlag(m)

	if err != nil {
		log.Fatal(err)
	}

	hash, err := m.Password()

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(hash)
}
