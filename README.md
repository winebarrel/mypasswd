# mypasswd

Calculate a hashed password for MySQL.

see http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html#function_password

## Usage

```
Usage of mypasswd:
  -old
      Returns the value of the pre-4.1 implementation of PASSWORD()
  -p string
      Password string

```

```
$ mypasswd -p FOOBARZOO
*70B45D8E18771E93E011F30DB91E80D6306EA4C3

$ echo FOOBARZOO | mypasswd -old
6e35068701b1cc8b
```
