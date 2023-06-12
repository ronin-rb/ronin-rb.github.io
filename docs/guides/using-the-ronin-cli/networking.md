---
layout: page
title: Using the Ronin CLI - Networking
---

# Using the Ronin CLI - Networking

## Table of Contents

* [asn](#asn)
* [ip](#ip)
* [iprange](#ip-range)
* [netcat](#netcat)
* [dns](#dns)
* [host](#host)
* [typosquat](#typosquat)
* [email-addr](#email-addr)
* [cert-dump](#cert-dump)
* [cert-grab](#cert-grab)
* [cert-gen](#cert-gen)
* [http](#http)
* [url](#url)

## asn

The `ronin-asn` command can query the ASN for a given IP:

```shell
$ ronin asn -I 4.2.2.1
4.0.0.0/9 AS3356 (US) LEVEL3
```

ASNs can also be searched by number, country-code, name:

```shell
ronin asn -n AS3356
ronin asn -C CN
ronin asn -N LEVEL3
```

The `ronin-asn` command can also update it's internal database of ASNs:

```shell
ronin asn --update
```

## ip

The `ronin ip` command can query the system's external/public IP address:

```shell
ronin ip --public
```

The `ronin ip` command can also convert an IP address into decimal format:

```shell
$ ronin ip --decimal 127.0.0.1
2130706433
```

The `ronin ip` command can also be passed a text file of IP addresses (one
per-line) and convert them into `http://` URIs:

```shell
ronin ip --file targets.txt --http
```

Supported formatting options:

* `-r`, `--reverse` - prints the IP address in reverse name format.
* `-X`, `--hex` - converts the IP address to hexadecimal format.
* `-D`, `--decimal` - converts the IP address to decimal format.
* `-B`, `--binary` - converts the IP address to binary format.
* `-C`, `--cidr NETMASK` - converts the IP address into a CIDR range.
* `-H`, `--host` - converts the IP address to a host name.
* `-U`, `--uri` - converts the IP address into a URI.
* `--http` - converts the IP address into a `http://` URI.
* `--https` - converts the IP address into a `https://` URI.

## iprange

The `ronin iprange` can enumerate over every IP address in the IP CIDR range:

```shell
$ ronin iprange 10.1.0.0/15
10.0.0.1
10.0.0.2
10.0.0.3
10.0.0.4
10.0.0.5
10.0.0.6
10.0.0.7
10.0.0.8
10.0.0.9
...
```

The `ronin iprange` command also supports nmap-style glob ranges:

```shell
$ ronin iprange 10.1-3.0.*
10.1.0.1
10.1.0.2
10.1.0.3
10.1.0.4
10.1.0.5
10.1.0.6
10.1.0.7
10.1.0.8
10.1.0.9
10.1.0.10
...
```

The `ronin iprange` can enumerate over every IP address between two IP
addresses:

```shell
$ ronin iprange --start 10.0.0.1 --stop 10.0.3.33
10.0.0.1
10.0.0.2
10.0.0.3
10.0.0.4
10.0.0.5
10.0.0.6
10.0.0.7
10.0.0.8
10.0.0.9
10.0.0.10
```

## netcat

The `ronin netcat` command is very similar to the `ncat` or `nc` commands,
but written in Ruby and with more consistent options.

You can use `ronin netcat` to connect to a remote port.

```shell
ronin netcat -v example.com 80
```

Listen on a local TCP port:

```shell
ronin netcat -v -l 1337
```

Connect to a remote SSL/TLS service:

```shell
ronin netcat -v --ssl example.com 443
```

Connect to a remote UDP service:

```shell
ronin netcat -v -u example.com 1337
```

Listen on a local UDP port:

```shell
ronin netcat -v -u -l 1337
```

Opens a UNIX socket:

```shell
ronin netcat -v --unix /path/to/unix.socket
```

The `--hexdump` option will hexdump all data received from a socket:

```shell
$ ronin netcat --hexdump example.com 80
GET / HTTP/1.1
Host: example.com
User-Agent: Ruby

00000000  48 54 54 50 2f 31 2e 31 20 32 30 30 20 4f 4b 0d  |HTTP/1.1 200 OK.|
00000010  0a 41 67 65 3a 20 32 35 30 38 30 36 0d 0a 43 61  |.Age: 250806..Ca|
00000020  63 68 65 2d 43 6f 6e 74 72 6f 6c 3a 20 6d 61 78  |che-Control: max|
00000030  2d 61 67 65 3d 36 30 34 38 30 30 0d 0a 43 6f 6e  |-age=604800..Con|
00000040  74 65 6e 74 2d 54 79 70 65 3a 20 74 65 78 74 2f  |tent-Type: text/|
00000050  68 74 6d 6c 3b 20 63 68 61 72 73 65 74 3d 55 54  |html; charset=UT|
...
```

## dns

The `ronin dns` command allows querying DNS records:

```shell
ronin dns -t TXT github.com
```

The `ronin dns` command can also query multiple records read from a text file:

```shell
ronin dns -t TXT -f targets.txt
```

## host

The `ronin host` command allows parsing and manipulating host names.

The `--enum-tlds` option will enumerate over every TLD of the host name.
The `--registered` option will then filter the host names based on which have
any DNS records.

```shell
$ ronin host --enum-tlds --registered github.com
github.ac
github.actor
github.ae
github.africa
github.agency
github.ai
...
```

The `--enum-suffix` option is similar to `--enum-tlds`, but enumerates over
every [public suffix] of the host name.

[public suffix]: https://publicsuffix.org/

```shell
$ ronin host --enum-suffix --registered github.com
example.com.ag
example.ai
example.al
example.am
example.com.ar
example.at
example.co.at
example.or.at
example.com.au
example.be
example.com.bh
...
```

The `--enum-subdomains` option will change the sub-domain part of the host name
using a wordlist file.

```shell
$ ronin host --enum-subdomains subdomains.txt --has-addresses google.com
www.google.com
mail.google.com
smtp.google.com
ns1.google.com
ns2.google.com
m.google.com
ns.google.com
blog.google.com
admin.google.com
news.google.com
vpn.google.com
ns3.google.com
...
```

## typosquat

The `ronin typosquat` command by default will enumerate every typo variation of
a domain name:

```shell
$ ronin typosquat microsoft.com
microosoft.com
microsooft.com
microssoft.com
```

The `--registered` option will filter the typosquat domains by which ones have
DNS records.

```shell
ronin typosquat --registered microsoft.com
```

The `--registered` option will filter the typosquat domains by which ones have
IP addresses.

```shell
ronin typosquat --has-addresses microsoft.com
```

The `--registered` option will filter the typosquat domains by which ones
*do not* have any DNS records.

```shell
ronin typosquat --unregistered microsoft.com
```

## email-addr

The `ronin email-addr` command allows parsing and manipulating email addresses.
For example, the `ronin email-addr` can deobfuscate an obfuscated email address:

```shell
$ ronin email-addr --deobfuscate "john [dot] smith [at] example [dot] com"
john.smith@example.com
```

The `ronin email-addr` command can also enumerate over every obfuscation of an
email address:

```shell
$ ronin email-addr --enum-obfuscations john.smith@example.com
john.smith @ example.com
john.smith AT example.com
john.smith at example.com
john.smith[AT]example.com
john.smith[at]example.com
...
```

The `ronin email-addr` command also supports a `--file` option for reading
email addresses from a file. For example, if you wanted to map a list of email
addresses to their domains:

```shell
ronin email-addr --file emails.txt --domain
```

## cert-dump

The `ronin cert-dump` command will request the SSL/TLS certificate of a website
and pretty print it's information.

```
$ ronin cert-dump https://example.com
Serial:     16115816404043435608139631424403370993
Version:    2
Not Before: 2023-01-13 00:00:00 UTC
Not After:  2024-02-13 23:59:59 UTC

Public Key:
  Type: RSA
  Public-Key: (2048 bit)
  Modulus:
      00:c2:80:77:89:59:b8:45:6f:ba:4a:d9:11:fa:7b:
      ad:c7:57:d0:7a:fb:b6:fa:dd:05:bb:a2:81:71:bb:
      e1:7f:21:d2:5f:2e:f0:d2:72:4e:75:34:f8:8d:62:
      e3:4a:da:51:90:d4:01:3d:9c:0c:c0:71:f7:e6:2f:
      b6:d6:07:67:26:d0:de:ff:17:ce:f0:85:fd:31:c1:
      66:ca:87:65:05:47:2a:5f:c0:ab:b8:8c:c3:bf:d0:
      17:7f:63:a3:5c:f0:46:fb:86:aa:fb:4d:d7:2a:5e:
      7f:9a:e0:13:97:7d:be:fb:7d:35:57:0d:5d:5e:81:
      98:35:ea:16:42:a2:d3:b0:74:f7:59:2d:ed:38:e7:
      fe:7a:1b:b3:36:e6:7e:ae:3f:9e:a6:16:83:de:53:
      01:4e:81:00:ae:bb:42:f5:1f:75:29:34:cd:e9:84:
      80:38:ae:3c:37:14:c0:f0:27:ce:30:52:b9:8a:dc:
      5f:22:a0:79:f8:4f:4e:49:04:e2:75:7c:aa:2f:2a:
      1e:03:ec:71:4c:a3:2a:61:fc:6f:ca:91:1e:93:5a:
      2e:78:08:58:f6:ee:bb:34:20:5d:9a:e6:af:c6:d7:
      f2:bf:0a:7b:fa:8e:92:77:e3:6c:7b:0c:40:86:64:
      4a:15:ec:70:d7:72:8e:63:30:e1:0b:ef:5a:30:97:
      2e:25
  Exponent: 65537 (0x10001)

Subject:
  Common Name:  www.example.org
  Organization: Internet Corporation for Assigned Names and Numbers
  Locality:     Los Angeles
  State:        California
  Country:      US
  Alt Names:

    www.example.org
    example.net
    example.edu
    example.com
    example.org
    www.example.com
    www.example.edu
    www.example.net

Issuer:
  Common Name:  DigiCert TLS RSA SHA256 2020 CA1
  Organization: DigiCert Inc
  Country:      US

```

The `ronin cert-dump` command also accepts `host:port` pairs and files.

```shell
ronin cert-dump example.com:443
ronin cert-dump cert.pem
```

## cert-grab

The `ronin cert-grab` command will download the SSL/TLS certificate of a SSL/TLS
service or a website:

```shell
ronin cert-grab github.com:443
ronin cert-grab https://github.com
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
The SSL/TLS certificate will be saved into a file named
`<domain-name>:<port>.crt`.
  </div>
</article>

## cert-gen

The `ronin cert-gen` command allows for quickly generating SSL/TLS certificates.
By default it will generate a self-signed certificate.

```shell
ronin cert-gen -c test.com -O "Test Co" -U "Test Dept" \
               -L "Test City" -S NY -C US
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
By default a new RSA key will be generated and saved into `key.pem`.
The destination key file path can be changed using `--generate-key`, or a
pre-existing key can be specified using `--key-file`.
  </div>
</article>

## http

The `ronin http` command allows for quickly performing HTTP requests, but with
some additional useful features. By default `ronin http` will perform an HTTP
`GET` request and print syntax highlighted output:

```shell
ronin http https://example.com/
```

The `--post` option will perform an HTTP `POST` request and the `--header`
option will add additional raw headers to the request:

```shell
ronin http --post --header "Authorization: ..." https://foo.bar/
```

The `--user-agent` option allows quickly changing the `User-Agent` string to a
known common value:

```shell
ronin http --post --user-agent chrome-android https://foo.bar/
```

The `--user-agent-string` option allows setting a custom `User-Agent` string
value:

```shell
ronin http --post --user-agent-string "..." https://foo.bar/
```

The `--shell` option will spawn an interactive shell with commands for sending
HTTP requests to the given website:

```shell
$ ronin http --shell https://example.com/
https://example.com/> help
  help [COMMAND]                      	Prints the list of commands or additional help
  get PATH[?QUERY] [BODY]             	Performs a GET request
  head PATH[?QUERY]                   	Performs a HEAD request
  patch PATH[?QUERY] [BODY]           	Performs a PATCH request
  post PATH[?QUERY] [BODY]            	Performs a POST request
  put PATH [BODY]                     	Performs a PUT request
  copy PATH DEST                      	Performs a COPY request
  delete PATH[?QUERY]                 	Performs a DELETE request
  lock PATH[?QUERY]                   	Performs a LOCK request
  options PATH[?QUERY]                	Performs a OPTIONS request
  mkcol PATH[?QUERY]                  	Performs a MKCOL request
  move PATH[?QUERY] DEST              	Performs a MOVE request
  propfind PATH[?QUERY]               	Performs a PROPFIND request
  proppatch PATH[?QUERY]              	Performs a PROPPATCH request
  trace PATH[?QUERY]                  	Performs a TRACE request
  unlock PATH[?QUERY]                 	Performs a UNLOCK request
  cd PATH                             	Changes the base URL path
  headers [{set | unset} NAME [VALUE]]	Manages the request headers
```

## url

The `ronin url` command provides options for parsing and extracting data from
URLs, such as `--query-param` option which will extract the value of the given
query parameter:

```shell
ronin url --file urls.txt --query-param id
```

The `ronin url` also provides the `--status` option, which will perform an HTTP
request for the URL and return the HTTP status for each URL:

```shell
ronin url --file urls.txt --status
```

<div class="level">
  <div class="level-left">
    <a class="button" href="encoding.html">
      &laquo; Encoding
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="text.html">
      Text &raquo;
    </a>
  </div>
</div>
