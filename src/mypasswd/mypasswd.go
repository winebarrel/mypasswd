package mypasswd

/*
#cgo LDFLAGS: -lmysqlclient
#include <stdlib.h>

void make_scrambled_password(char *to, const char *password);
void make_scrambled_password_323(char *to, const char *password);

#define CRYPT_MAX_PASSWORD_SIZE_PLUS_BUF 79 * 3

char *password(char* str) {
  char *buf = malloc(CRYPT_MAX_PASSWORD_SIZE_PLUS_BUF + 1);

  if (buf == NULL) {
    return NULL;
  }

  make_scrambled_password(buf, str);

  return buf;
}
*/
import "C"

import (
	"fmt"
	"unsafe"
)

type Mypasswd struct {
	Passwd string
}

func (m *Mypasswd) Password() (string, error) {
	cpassed := C.CString(m.Passwd)
	chash := C.password(cpassed)
	C.free(unsafe.Pointer(cpassed))
	hash := C.GoString(chash)

	if chash != nil {
		C.free(unsafe.Pointer(chash))
	} else {
		return "", fmt.Errorf("Cannot make scrambledpassword")
	}

	return hash, nil
}
