[Github example](https://github.com/authelia/authelia/tree/master/examples/compose/lite)

[Source](https://www.authelia.com/reference/guides/generating-secure-values/)
## GENERATE SECRET (Random Password Hash)
```bash
    docker run --rm authelia/authelia:latest authelia crypto hash generate argon2 --random --random.length 64 --random.charset alphanumeric
```

## GENERATE RANDOM PASSWORD
```bash
    docker run --rm authelia/authelia:latest authelia hash-password 'your-password'
```

## GENERATE RSA certificate Keypair
```bash
    docker run --rm -u "$(id -u):$(id -g)" -v "$(pwd)":/keys authelia/authelia:latest authelia crypto pair rsa generate --bits 4096 --directory /keys
```