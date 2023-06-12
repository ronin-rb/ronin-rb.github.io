---
layout: page
title: Using the Ronin CLI - Cryptography
---

# Using the Ronin CLI - Cryptography

## Table of Contents

* [md5](#md5)
* [sha1](#sha1)
* [sha256](#sha256)
* [sha512](#sha512)
* [hmac](#hmac)
* [encrypt](#encrypt)
* [decrypt](#decrypt)
* [rot](#rot)
* [xor](#xor)

## md5

The `ronin md5` command can be used to calculate an MD5 checksum of a string:

```shell
$ ronin md5 --string "hello world"
5eb63bbbe01eeed093cb22bb8f5acdc3
```

It can also be used to calculate the MD5 checksum of a file:

```shell
ronin md5 file.txt
```

The `--multiline` option will cause `ronin md5` to calculate the MD5 checksum
of every line in a file:

```shell
ronin md5 --multiline file.txt
```

## sha1

The `ronin sha1` command can be used to calculate an SHA1 checksum of a string:

```shell
$ ronin sha1 --string "hello world"
2aae6c35c94fcfb415dbe95f408b9ce91ee846ed
```

It can also be used to calculate the SHA1 checksum of a file:

```shell
ronin sha1 file.txt
```

The `--multiline` option will cause `ronin sha1` to calculate the SHA1 checksum
of every line in a file:

```shell
ronin sha1 --multiline file.txt
```

## sha256

The `ronin sha256` command can be used to calculate an SHA256 checksum of a
string:

```shell
$ ronin sha256 --string "hello world"
b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9
```

It can also be used to calculate the SHA256 checksum of a file:

```shell
ronin sha256 file.txt
```

The `--multiline` option will cause `ronin sha256` to calculate the SHA256
checksum of every line in a file:

```shell
ronin sha256 --multiline file.txt
```

## sha512

The `ronin sha512` command can be used to calculate an SHA512 checksum of a
string:

```shell
$ ronin sha512 --string "hello world"
309ecc489c12d6eb4cc40f50c902f2b4d0ed77ee511a7c7a9bcd3ca86d4cd86f989dd35bc5ff499670da34255b45b0cfd830e81f605dcf7dc5542e93ae9cd76f
```

It can also be used to calculate the SHA512 checksum of a file:

```shell
ronin sha512 file.txt
```

The `--multiline` option will cause `ronin sha512` to calculate the SHA512
checksum of every line in a file:

```shell
ronin sha512 --multiline file.txt
```

## hmac

The `ronin hmac` command can generate a HMAC for a file:

```shell
ronin hmac --hash sha1 --password "s3cr3t" data.txt
```

The `--string` option can be used to generate a HMAC for a string:

```shell
ronin hmac --hash sha1 --password "s3cr3t" --string "..."
```

## encrypt

The `ronin encrypt` command can be used to encrypt data using a given cipher
using the `--cipher` option. The `--password` option will generate an encryption
key using the `--password` and a hash algorithm using `--hash` (defaults to
SHA256).

```shell
ronin encrypt --cipher aes-256-cbc --password "..." file.txt > encrypted.bin
```

You can pass in a raw encryption key using the `--key` option:

```shell
ronin encrypt --cipher aes-256-cbc --key "12345abcdef..." file.txt > encrypted.bin
ronin encrypt --cipher aes-256-cbc --key $"\x11\x22..." file.txt > encrypted.bin
```

The `--key-file` option will read the encryption key from a file:

```shell
ronin encrypt --cipher aes-256-cbc --key-file key.bin file.txt > encrypted.bin
```

A custom IV (initialization vector) can be specified using the `--iv` option:

```shell
ronin encrypt --cipher aes-256-cbc --key "..." --iv "..." file.txt > encrypted.bin
```

## decrypt

The `ronin decrypt` command can be used to decrypt data using a given cipher
using the `--cipher` option. The `--password` option will generate an decryption
key using the `--password` and a hash algorithm using `--hash` (defaults to
SHA256).

```shell
ronin decrypt --cipher aes-256-cbc --password "..." encrypted.bin
```

You can pass in a raw decryption key using the `--key` option:

```shell
ronin decrypt --cipher aes-256-cbc --key "12345abcdef..." encrypted.bin
ronin decrypt --cipher aes-256-cbc --key $"\x11\x22..." encrypted.bin
```

The `--key-file` option will read the decryption key from a file:

```shell
ronin decrypt --cipher aes-256-cbc --key-file key.bin encrypted.bin
```

A custom IV (initialization vector) can be specified using the `--iv` option:

```shell
ronin decrypt --cipher aes-256-cbc --key "..." --iv "..." encrypted.bin
```

## rot

The `ronin rot` command can be used to perform [ROT-13] "encryption":

[ROT-13]: https://en.wikipedia.org/wiki/ROT13

```
$ ronin rot --string "The quick brown fox jumps over the lazy dog"
Gur dhvpx oebja sbk whzcf bire gur ynml qbt
```

A custom rotation number can be specified using the `-n` option:

```
$ ronin rot -n 3 --string "The quick brown fox jumps over the lazy dog"
Wkh txlfn eurzq ira mxpsv ryhu wkh odcb grj
```

## xor

The `ronin xor` command can be used to perform XOR "encryption" of a string
using the `--key` option:

```shell
$ ronin xor --key ABC --string "The quick brown fox jumps over the lazy dog"
"\x15*&a36(!(a 1.5-a$,9b)4/32b,7'1a6+$b/ 8:a&,&"
```

<div class="level">
  <div class="level-left">
    <a class="button" href="binary.html">
      &laquo; Binary
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="encoding.html">
      Encoding &raquo;
    </a>
  </div>
</div>
