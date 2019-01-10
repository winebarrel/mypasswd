package mypasswd

import (
	. "mypasswd"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPassword(t *testing.T) {
	assert := assert.New(t)
	m := &Mypasswd{Passwd: "FOOBARZOO"}
	expected := "*70B45D8E18771E93E011F30DB91E80D6306EA4C3"
	actual, _ := m.Password()
	assert.Equal(expected, actual)
}
