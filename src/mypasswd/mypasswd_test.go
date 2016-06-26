package mypasswd

import (
	"github.com/stretchr/testify/assert"
	. "mypasswd"
	"testing"
)

func TestPassword(t *testing.T) {
	assert := assert.New(t)
	m := &Mypasswd{Passwd: "FOOBARZOO", Old: false}
	expected := "*70B45D8E18771E93E011F30DB91E80D6306EA4C3"
	actual, _ := m.Password()
	assert.Equal(expected, actual)
}

func TestOldPassword(t *testing.T) {
	assert := assert.New(t)
	m := &Mypasswd{Passwd: "FOOBARZOO", Old: true}
	expected := "6e35068701b1cc8b"
	actual, _ := m.Password()
	assert.Equal(expected, actual)
}
