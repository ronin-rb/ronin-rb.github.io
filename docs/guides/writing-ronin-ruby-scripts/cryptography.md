---
layout: page
title: Writing Ronin Ruby Scripts - Cryptography
---

# Writing Ronin Ruby Scripts - Cryptography

## Table of Contents

* [Hashes](#hashes)
* [HMAC](#hmac)
* [Encryption](#encryption)
  * [AES](#aes)
  * [RSA](#rsa)
  * [ROT](#rot)
  * [XOR](#xor)
* [Mixin module](#mixin-module)

## Hashes

[ronin-support][ronin-support-docs] provides methods for calculating
cryptographic hashes of data:

```ruby
"hello".md5
# => "5d41402abc4b2a76b9719d911017c592"

"hello".sha1
# => "aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d"

"hello".sha256
# => "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"

"hello".sha512
# => "9b71d224bd62f3785d96d46ad3ea3d73319bfbc2890caadae2dff72519673ca72323c3d99ba5c11d7c7acc6e14b8c5da0c4663475c2e5c3adef46f73bcdec043"
```

Hashes of files can also be calculated:

```ruby
File.md5('data.txt')
# => "5d41402abc4b2a76b9719d911017c592"

File.sha1('data.txt')
# => "aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d"

File.sha256('data.txt')
# => "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"

File.sha512('data.txt')
# => "9b71d224bd62f3785d96d46ad3ea3d73319bfbc2890caadae2dff72519673ca72323c3d99ba5c11d7c7acc6e14b8c5da0c4663475c2e5c3adef46f73bcdec043"
```

See the documentation for [String] and [File] for a full list of available
methods.

## HMAC

[ronin-support][ronin-support-docs] provides methods for calculating an HMAC
of a [String] or a [File].

```ruby
"message".hmac(key: 's3cr3t')
# => "0170bab6b7a5ee349359d4eb71f7a1a6788d5cd1"
"message".hmac(key: 's3cr3t', digest: :sha256)
# => "a0873da7e97f43712665bb6c154799dc341ecad94cad194eb4354826b0218a0a"

File.hmac(path, key: 's3cr3t')
# => "..."
File.hmac(path, key: 's3cr3t', digest: :sha256)
# => "..."
```

See the documentation for [String] and [File] for a full list of available
methods.

## Encryption

[ronin-support][ronin-support-docs] provides methods for encrypting or
decrypting data using the given cryptographic cipher and key/password:

```ruby
"top secret".encrypt('aes-256-cbc', password: 's3cr3t')
# => "\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\"
"\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\".decrypt('aes-256-cbc
', password: 's3cr3t')
# => "top secret"

File.encrypt('file.txt', 'aes-256-cbc', password: 's3cr3t')
# => "..."
File.decrypt('encrypted.bin', 'aes-256-cbc', password: 's3cr3t')
# => "..."
```

See the documentation for [String#encrypt], [String#decrypt], [File.encrypt],
and [File.decrypt] for detailed documentation.

[String#encrypt]: /docs/ronin-support/String.html#encrypt-instance_method
[String#decrypt]: /docs/ronin-support/String.html#decrypt-instance_method
[File.encrypt]: /docs/ronin-support/File.html#encrypt-class_method
[File.decrypt]: /docs/ronin-support/File.html#decrypt-class_method

### AES

[ronin-support][ronin-support-docs] also provides methods for encrypting or
decrypting data using the AES cryptographic cipher:

```ruby
"top secret".aes_encrypt(key_size: 256, password: 's3cr3t')
# => "\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\"
"top secret".aes256_encrypt(password: 's3cr3t')
# => "\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\"
"top secret".aes128_encrypt(password: 's3cr3t')
# => "\x88\xA53\xE9|\xE2\x8E\xA0\xABv\xCF\x94\x17\xBB*\xC5"

"\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\".aes_decrypt(key_size:
256, password: 's3cr3t')
# => "top secret"
"\xF0[\x17\xDA\xA2\x82\x93\xF4\xB6s\xB5\xD8\x1F\xF2\xC6\\".aes256_decrypt(password: 's3cr3t')
# => "top secret"
"\x88\xA53\xE9|\xE2\x8E\xA0\xABv\xCF\x94\x17\xBB*\xC5".aes128_decrypt(password: 's3cr3t')
# => "top secret"

File.aes_encrypt('file.txt', key_size: 256, password: 's3cr3t')
# => "..."
File.aes256_encrypt('file.txt', password: 's3cr3t')
# => "..."
File.aes128_encrypt('file.txt', password: 's3cr3t')
# => "..."
File.aes_decrypt('encrypted.bin', key_size: 256, password: 's3cr3t')
# => "..."
File.aes256_decrypt('encrypted.bin', password: 's3cr3t')
# => "..."
File.aes128_decrypt('encrypted.bin', password: 's3cr3t')
# => "..."
```

See the documentation for [String] and [File] for a full list of available
methods.

### RSA

[ronin-support][ronin-support-docs] also provides methods for encrypting or
decrypting data using the RSA cryptographic cipher:

```ruby
"top secret".rsa_encrypt(key: "...")
# => "..."
"top secret".rsa_encrypt(key_file: "key.pem")
# => "..."
"...".rsa_decrypt(key: "...")
# => "..."
"...".rsa_decrypt(key_file: "key.pem")
# => "..."

File.rsa_encrypt('file.txt', key: "...")
# => "..."
File.rsa_encrypt('file.txt', key_file: "key.pem")
# => "..."
File.rsa_decrypt('encrypted.bin', key: "...")
# => "..."
File.rsa_decrypt('encrypted.bin', key_file: "key.pem")
# => "..."
```

See the documentation for [String] and [File] for a full list of available
methods.

### ROT

[ronin-support][ronin-support-docs] also provides methods for "encrypting" /"decrypting" data using the ROT-13 algorithm:

```ruby
"The quick brown fox jumps over 13 lazy dogs.".rot
# => "Gur dhvpx oebja sbk whzcf bire 46 ynml qbtf."

"Gur dhvpx oebja sbk whzcf bire 46 ynml qbtf.".rot(-13)
# => "The quick brown fox jumps over 13 lazy dogs."
```

See [String#rot] for more detailed documentation.

[String#rot]: /docs/ronin-support/String.html#rot-instance_method

### XOR

[ronin-support][ronin-support-docs] also provides methods for XOR "encrypting" /"decrypting" of data:

```ruby
"hello".xor(0x41)
# => ")$--."

"hello again".xor([0x55, 0x41, 0xe1])
# => "=$\x8d9.\xc14&\x80</"
```

See [String#xor] for more detailed documentation.

[String#xor]: /docs/ronin-support/String.html#xor-instance_method

## Mixin module

If you prefer using functions instead of the [String] or [File] methods,
you can include the [Ronin::Support::Crypto::Mixin] module.

[Ronin::Support::Crypto::Mixin]: /docs/ronin-support/Ronin/Support/Crypto/Mixin.html

<div class="level">
  <div class="level-left">
    <a class="button" href="archives.html">
      &laquo; Archives
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="networking.html">
      Networking &raquo;
    </a>
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
[File]: /docs/ronin-support/File.html
