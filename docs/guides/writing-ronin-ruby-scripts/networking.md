---
layout: page
title: Writing Ronin Ruby Scripts - Networking
---

# Writing Ronin Ruby Scripts - Networking

## Table of Contents

* [IP addresses](#ip-addresses)
* [IP ranges](#ip-ranges)
* [Host names](#host-names)
* [Domains](#domains)
* [TCP](#tcp)
* [UDP](#udp)
* [UNIX sockets](#unix-sockets)
* [SSL](#ssl)
* [HTTP](#http)

## IP addresses

[ronin-support][ronin-support-docs] provides a [Ronin::Support::Network::IP]
class for working with IP addresses as objects:

```ruby
require 'ronin/support/network/ip'
include Ronin::Support

ip = Network::IP.new('192.30.255.113')
ip.get_name
# => "lb-192-30-255-113-sea.github.com"
ip.asn
# => #<Ronin::Support::Network::ASN::DNSRecord:0x00007fe481bbb008
#     @country_code="US",
#     @name=nil,
#     @number=36459,
#     @range=#<Ronin::Support::Network::IPRange::CIDR: 192.30.255.0/24>>
```

See the documentation for [Ronin::Support::Network::IP] for the complete list of
available methods.

[Ronin::Support::Network::IP]: /docs/ronin-support/Ronin/Support/Network/IP.html

## IP ranges

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::IPRange] class for working with different formats of
IP ranges:

[Ronin::Support::Network::IPRange]: /docs/ronin-support/Ronin/Support/Network/IPRange.html

```ruby
require 'ronin/support/network/ip_range'
include Ronin::Support

ip_range = Network::IPRange.new('192.168.1.1/28')
ip_range.each do |ip|
  puts ip
end
# 192.168.1.1
# 192.168.1.2
# 192.168.1.3
# 192.168.1.4
# 192.168.1.5
# ...

ip_range = Network::IPRange.new('192.168.*.1-5')
ip_range.each do |ip|
  puts ip
end
# 192.168.1.1
# 192.168.1.2
# 192.168.1.3
# 192.168.1.4
# 192.168.1.5
# 192.168.2.1
# 192.168.2.2
# 192.168.2.3
# 192.168.2.4
# 192.168.2.5
# ...
```

## Host names

[ronin-support][ronin-support-docs] provides a [Ronin::Support::Network::Host]
class for working with host names as objects:

```ruby
require 'ronin/support/network/host'
include Ronin::Support

host = Network::Host.new('www.github.com')
host.addresses
# => ["192.30.255.113"]
host.ips
# => [#<Ronin::Support::Network::IP: 192.30.255.113>]
host.get_cname
# => "github.com"
```

See the documentation for [Ronin::Support::Network::Host] for a complete list of
available methods.

[Ronin::Support::Network::Host]: /docs/ronin-support/Ronin/Support/Network/Host.html

## Domains

[ronin-support][ronin-support-docs] provides a [Ronin::Support::Network::Domain]
class for working with host names as objects:

```ruby
require 'ronin/support/network/domain'
include Ronin::Support

domain = Network::Domain.new('github.com')
domain.ips
# => [#<Ronin::Support::Network::IP: 192.30.255.113>]
domain.mailservers
# => ["aspmx.l.google.com",
#     "alt3.aspmx.l.google.com",
#     "alt4.aspmx.l.google.com",
#     "alt1.aspmx.l.google.com",
#     "alt2.aspmx.l.google.com"]
domain.nameservers
# => ["dns1.p08.nsone.net",
#     "dns2.p08.nsone.net",
#     "dns3.p08.nsone.net",
#     "dns4.p08.nsone.net",
#     "ns-1283.awsdns-32.org",
#     "ns-1707.awsdns-21.co.uk",
#     "ns-421.awsdns-52.com",
#     "ns-520.awsdns-01.net"]
```

See the documentation for [Ronin::Support::Network::Domain] for a complete list
of available methods.

[Ronin::Support::Network::Domain]: /docs/ronin-support/Ronin/Support/Network/Domain.html

## TCP

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::TCP::Mixin] module, which adds `tcp_` methods
for working with TCP sockets:

```ruby
# open a TCP socket
socket = tcp_connect('example.com',80)

# create a temporary TCP socket
tcp_connect('example.com',80) do |socket|
  # ...
end

# accept a TCP client connection
client = tcp_accept(port: 9000)
```

See the documentation for [Ronin::Support::Network::TCP::Mixin] for a complete
list of available methods.

[Ronin::Support::Network::TCP::Mixin]: /docs/ronin-support/Ronin/Support/Network/TCP/Mixin.html

## UDP

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::UDP::Mixin] module, which adds `udp_` methods
for working with UDP sockets:

```ruby
# open a UDP socket
socket = udp_connect('example.com',1234)

# create a temporary UDP socket
udp_connect('example.com',1234) do |socket|
  # ...
end

# accept a UDP client connection
client = udp_accept(port: 9000)
```

See the documentation for [Ronin::Support::Network::UDP::Mixin] for a complete
list of available methods.

[Ronin::Support::Network::UDP::Mixin]: /docs/ronin-support/Ronin/Support/Network/UDP/Mixin.html

## UNIX sockets

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::UNIX::Mixin] module, which adds `unix_` methods
for working with UNIX sockets:

```ruby
require 'ronin/support/network/unix/mixin'
include Ronin::Support::Network::UNIX::Mixin

# connect to an existing UNIX socket
socket = unix_connect('foo.socket')
socket.write('Connected')

# create a temporary UNIX socket
unix_connect('foo.socket') do |socket|
  socket.write('Connected')
  # ...
end

# open a UNIX socket and accept a connection
socket = unix_accept('foo.socket')
data   = socket.read(1024)
```

See the documentation for [Ronin::Support::Network::UNIX::Mixin] for a complete
list of available methods.

[Ronin::Support::Network::UNIX::Mixin]: /docs/ronin-support/Ronin/Support/Network/UNIX/Mixin.html

## SSL

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::SSL::Mixin] module, which adds `ssl_` methods
for working with SSL sockets:

```ruby
# open a SSL socket
socket = ssl_connect('example.com',443)

# create a temporary SSL socket
ssl_connect('example.com',443) do |socket|
  # ...
end

# accept a SSL client connection
client = ssl_accept(port: 9000)
```

See the documentation for [Ronin::Support::Network::SSL::Mixin] for a complete
list of available methods.

[Ronin::Support::Network::SSL::Mixin]: /docs/ronin-support/Ronin/Support/Network/SSL/Mixin.html

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
There is also a [Ronin::Support::Network::TLS::Mixin] module which is
identical to [Ronin::Support::Network::SSL::Mixin], but that it requires
an SSL version of TLS 1.2.

[Ronin::Support::Network::TLS::Mixin]: /docs/ronin-support/Ronin/Support/Network/TLS/Mixin.html
[Ronin::Support::Network::SSL::Mixin]: /docs/ronin-support/Ronin/Support/Network/SSL/Mixin.html
  </div>
</article>

## HTTP

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Network::HTTP::Mixin] module, which adds `http_` methods
for making HTTP requests

```ruby
require 'ronin/support/network/http/mixin'
include Ronin::Support::Network::HTTP::Mixin

response = http_get('https://example.com/')

response = http_get('https://example.com/', query_params: {'id' => 1})

response = http_post('https://example.com/', form_data: {'foo' => 'bar'})
```

See the documentation for [Ronin::Support::Network::HTTP::Mixin] for a complete
list of available methods.

[Ronin::Support::Network::HTTP::Mixin]: /docs/ronin-support/Ronin/Support/Network/HTTP/Mixin.html

If you need to create a persistent HTTP connection to host, you can create a new
[Ronin::Support::Network::HTTP] object:

[Ronin::Support::Network::HTTP]: /docs/ronin-support/Ronin/Support/Network/HTTP.html

```ruby
require 'ronin/support/network/http'
include Ronin::Support

http = Network::HTTP.connect('example.com',443)

response = http.get('/')
```

<div class="level">
  <div class="level-left">
    <a class="button" href="cryptography.html">
      &laquo; Cryptography
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/
