---
layout: page
title: Porting Metasploit Payloads to Ronin Payloads
---

# Porting Metasploit Payloads modules to Ronin Payloads

This guide explains how to convert a Metasploit payloads into a
[Ronin payloads][Ronin::Payloads::Payload].

## Table of Contents

* [Class Definition](#class-definition)
* [Included Modules](#included-modules)
* [Metadata](#metadata)
* [Options vs. Params](#options-vs-params)
* [`generate` vs. `validate`/`build`/`prelaunch`/`postlaunch`/`cleanup` methods](#generate-vs-validatebuildprelaunchpostlaunchcleanup-methods)
* [Printing](#printing)
* [Packing](#packing)

## Class Definition

### Metasploit

Every Metasploit payload is defined as a module named `MetasploitModule`.

```ruby
module MetasploitModule

  # ...

end
```

### Ronin

[Ronin payloads][Ronin::Payloads::Payload] are defined as classes that must:

1. Require any classes or modules used.
2. Be defined in the `Ronin::Payloads` namespace.
3. Have a unique `CamelCase` name similar to the file name.
4. Inherit from [Ronin::Payloads::Payload] or one of it's sub-classes.
5. Call `register` with the same name as it's file name.

```ruby
# payloads/my_payload.rb
require 'ronin/payloads/payload'

module Ronin
  module Payloads
    class MyPayload < Payload

      register 'my_payload'

      # ...

    end
  end
end
```

## Included Modules

### Metasploit

Since Metasploit payloads are defined as modules, they cannot inherit from
another base class. Instead, they must include in other `Msf::Payload::`
modules.

```ruby
module MetasploitModule
  include Msf::Payload::Adapter
  include Msf::Exploit::Powershell

  # ...
end
```

### Ronin

Since [Ronin payloads][Ronin::Payloads::Payload] are defined as classes, they
can inherit from specific [Ronin::Payloads::Payload] base classes which
define different types of payloads.

```ruby
require 'ronin/payloads/powershell_payload'

module Ronin
  module Payloads
    class MyPayload < PowerShellPayload

      # ...

    end
  end
end
```

Additionally, [ronin-payloads] provides a set of
[modules][Ronin::Payloads::Mixins] that can be included to add additional
functionality, such as
[working with binary data][Ronin::Payloads::Mixins::Binary],
using a [build directory][Ronin::Payloads::Mixins::BuildDir],
[bind shell][Ronin::Payloads::Mixins::BindShell] or
[reverse shell][Ronin::Payloads::Mixins::ReverseShell] functionality.

[Ronin::Payloads::Mixins]: /docs/ronin-payloads/Ronin/Payloads/Mixins.html
[Ronin::Payloads::Mixins::Binary]: /docs/ronin-payloads/Ronin/Payloads/Mixins/Binary.html
[Ronin::Payloads::Mixins::BuildDir]: /docs/ronin-payloads/Ronin/Payloads/Mixins/BuildDir.html
[Ronin::Payloads::Mixins::BindShell]: /docs/ronin-payloads/Ronin/Payloads/Mixins/BindShell.html
[Ronin::Payloads::Mixins::ReverseShell]: /docs/ronin-payloads/Ronin/Payloads/Mixins/ReverseShell.html

### Cheat Sheet

Metasploit                         | Ronin
-----------------------------------|-------------------------------------------
`include Msf::Payload::Java`       | `class MyPayload < JavaPayload`
`include Msf::Payload::JSP`        | `class MyPayload < JSPPayload`
`include Msf::Payload::NodeJS`     | `class MyPayload < NodeJSPayload`
`include Msf::Payload::Php`        | `class MyPayload < PHPPayload`
`include Msf::Payload::Python`     | `class MyPayload < PythonPayload`
`include Msf::Payload::Ruby`       | `class MyPayload < RubyPayload`
`include Msf::Payload::Windows::Powershell` | `class MyPayload < PowerShellPayload`
`include Msf::Exploit::Powershell` | `class MyPayload < PowerShellPayload`

## Metadata

### Metasploit

Metasploit payloads define their metadata in the `initialize` method by
passing a large Hash of Strings:

```ruby
module MetasploitModule

  # ...

  def initialize(info = {})
    super(merge_info(info,
      'Name'          => 'Linux Command Shell, Reverse TCP Inline',
      'Description'   => 'Connect back to attacker and spawn a command shell',
      'Author'        => 'ricky',
      'License'       => MSF_LICENSE,
      'Platform'      => 'linux',
      'Arch'          => ARCH_X64,
      # ...
    ))
  end
end
```

### Ronin

Ronin payloads define their metadata in the class body by calling class methods:

* [register](/docs/ronin-payloads/Ronin/Payloads/Payload.html#register-class_method)
* [summary](/docs/ronin-core/Ronin/Core/Metadata/Summary/ClassMethods.html#summary-instance_method)
* [description](/docs/ronin-core/Ronin/Core/Metadata/Description/ClassMethods.html#description-instance_method)
* [author](/docs/ronin-core/Ronin/Core/Metadata/Authors/ClassMethods.html#author-instance_method)
* [references](/docs/ronin-core/Ronin/Core/Metadata/References/ClassMethods.html#references-instance_method)
* [encoder_class](/docs/ronin-payloads/Ronin/Payloads/Payload.html#encoder_class-class_method)

```ruby
require 'ronin/payloads/payload'

module Ronin
  module Payloads
    class MyPayload < Payload

      register 'my_payload'

      summary 'A single sentence summary of the payload'
      description <<~EOS
        A longer multi-line or multi-paragraph description of the payload.
        Bla bla bla bla.
      EOS

      author 'Author1'
      author 'Author2', website:  'https://example.com',
                        email:    'author1@example2.com',
                        github:   'author2',
                        mastodon: 'https://example.com/@author2',
                        twitter:  '@author2',
                        discord:  '...'

      references [
        'https://example.com/url1',
        'https://example.com/url2',
        # ...
      ]

      # ...

    end
  end
end
```

Additional [metadata modules][Ronin::Payloads::Metadata] can be
included to define additional metadata, such as
[Metadata::Arch][Ronin::Payloads::Metadata::Arch] or
[Metadata::OS][Ronin::Payloads::Metadata::OS].
If the exploit class inherits from the
[ASMPayload][Ronin::Payloads::ASMPayload] or
[ShellcodePayload][Ronin::Payloads::ShellcodePayload] class,
then those modules are already included by default.

[Ronin::Payloads::Metadata]: /docs/ronin-payloads/Ronin/Payloads/Metadata.html
[Ronin::Payloads::Metadata::Arch]: /docs/ronin-payloads/Ronin/Payloads/Metadata/Arch.html
[Ronin::Payloads::Metadata::OS]: /docs/ronin-payloads/Ronin/Payloads/Metadata/OS.html
[Ronin::Payloads::ASMPayload]: /docs/ronin-payloads/Ronin/Payloads/ASMPayload.html
[Ronin::Payloads::ShellcodePayload]: /docs/ronin-payloads/Ronin/Payloads/ShellcodePayload.html

```ruby
require 'ronin/payloads/shellcode_payload'

module Ronin
  module Payloads
    class MyShellcode < ShellcodePayload

      # ...

      arch :x86_64
      os :linux

      # ...

    end
  end
end
```

See the [arch], [os], and [os_version] method documentation for further details.

[arch]: /docs/ronin-payloads/Ronin/Payloads/Metadata/Arch/ClassMethods.html#arch-instance_method
[os]: /docs/ronin-payloads/Ronin/Payloads/Metadata/OS/ClassMethods.html#os-instance_method
[os_version]: /docs/ronin-payloads/Ronin/Payloads/Metadata/OS/ClassMethods.html#os_version-instance_method

### Cheat Sheet

<table>
  <thead>
    <tr>
      <td width="50%">Metasploit</td>
      <td width="50%">Ronin</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>Name' => '...',</pre>
      </td>
      <td>
        <pre>summary '...'</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>'Description'    => %q{
   ...
},</pre>
      </td>
      <td>
        <pre>description &lt;&lt;~DESC
  ...
DESC</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>'License'        => MSF_LICENSE,</pre>
      </td>
      <td>
        N/A
      </td>
    </tr>
    <tr>
      <td>
        <pre>'Author'         => [
  'John Doe', # discoverer
  ...
],</pre>
      </td>
      <td>
        <pre>author 'John Doe'
...</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>'References'     =>
  [
    [ 'URL', 'https://example.com/...' ],
    # ...
  ],</pre>
      </td>
      <td>
        <pre>
references [
  'https://example.com/...',
  # ...
]</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>'Platform'       => 'Linux',</pre>
      </td>
      <td>
        <pre>include Metadata::OS
# ...

os :linux</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>'Arch'       => ARCH_X64,</pre>
      </td>
      <td>
        <pre>include Metadata::Arch
# ...

arch :x86_64</pre>
      </td>
    </tr>
  </tbody>
</table>

## Options vs. Params

### Metasploit

Metasploit payloads defines options using the `register_options` within the
`initialize` method. The `register_options` method accepts an Array of one or
more options. The options are initialized using `OptString`, `OptBool`, etc,
option classes. The first argument is the option name in all uppercase.
The second argument is the option description. The first argument is the
optional default value for the option.

```ruby
module MetasploitModule

  # ...

  def initialize(info = {})
    # ...

    # Register command execution options
    register_options(
      [
        OptString.new('SHELL', [ true, "The shell to execute.", "/bin/sh" ]),
      ])
  end

end
```

### Ronin

[Ronin payloads][Ronin::Payloads::Payload] defines options using the [param]
method which can be called multiple times. The first argument is the
param name, in lowercase or `snake_case`. The second argument is the
param [type class][Ronin::Core::Params::Types]. Additional keyword arguments
may define whether the param is required, it's default value, and it's
description.

[param]: /docs/ronin-core/Ronin/Core/Params/Mixin/ClassMethods.html#param-instance_method
[Ronin::Core::Params::Types]: /docs/ronin-core/Ronin/Core/Params/Types.html

```ruby
require 'ronin/payloads/payload'

module Ronin
  module Payloads
    class MyPayload < Payload

      # ...

      param :shell, String, required: true,
                            default:  '/bin/sh',
                            desc:     'The shell command to execute'

      # ...

    end
  end
end
```

**Note:** if the payload class includes the
[Mixins::BindShell][Ronin::Payloads::Mixins::BindShell] or
[Mixins::ReverseShell][Ronin::Payloads::Mixins::ReverseShell] modules, then it
will automatically have `host` and `port` params.

[Ronin::Payloads::Mixins::BindShell]: /docs/ronin-payloads/Ronin/Payloads/Mixins/BindShell.html
[Ronin::Payloads::Mixins::ReverseShell]: /docs/ronin-payloads/Ronin/Payloads/Mixins/ReverseShell.html

### Cheat Sheet

Metasploit                        | Ronin
----------------------------------|--------------------------------------------
`OptString.new('FOO', ...)`       | `param :foo, String, ...`
`OptInt.new('FOO', ...)`          | `param :foo, Integer, ...`
`OptBool.new('FOO', ...)`         | `param :foo, Boolean, ...`
`OptEnum.new('FOO', [true, '...', ['value1', 'value2', ...])` | `param :foo, Enum[:value1, :value2, ...]`

## `generate` vs. `build`/`prelaunch`/`postlaunch`/`cleanup` methods

### Metasploit

Most Metasploit payloads will define their payload building logic in a
`generate` method:

```ruby
module MetasploitModule
  # ...

  def generate(opts = {})
    opts[:arch] ||= module_info['AdaptedArch']
    payload = super

    cmd_psh_payload(payload, ARCH_X86, remove_comspec: true)
  end
end
```

**Note:** some Metasploit payloads define their entire payload within the
metadata section in the `initialize` method:

```ruby
module MetasploitModule

  # ...

  def initialize(info = {})
    super(merge_info(info,
      # ...
      'Payload'       =>
        {
          'Offsets' =>
            {
              'LHOST' => [ 20, 'ADDR' ],
              'LPORT' => [ 18, 'n'    ],
            },
          'Payload' =>
            "\x6a\x29"                     + # pushq  $0x29
            "\x58"                         + # pop    %rax
            "\x99"                         + # cltd
            "\x6a\x02"                     + # pushq  $0x2
            # ...
        }
      ))
  end
end
```

### Ronin

[Ronin payloads][Ronin::Payloads::Payload] define the payload's logic in five
main methods.

1. `validate` - Perform any additional validations before building the payload.
2. `build` - Builds any payload string or file. **Must** set the `@payload`
   instance variable with the built payload String.
3. `prelaunch` - Additional logic to execute before the exploit which is using
   the payload is launched.
4. `postlaunch` - Additional logic to execute after the exploit which is using
   the payload is launched.
5. `cleanup` - Perform any extra cleanup tasks after the payload is done being
   used.

```ruby
require 'ronin/payloads/payload'

module Ronin
  module Payloads
    class MyPayload < Payload

      # ...

      def build
        @payload = "..."
      end

      def cleanup
        # ...
      end

      def prelaunch
        # ...
      end

      def postlaunch
        # ...
      end

    end
  end
end
```

**Note:** the [Mixins::BindShell][Ronin::Payloads::Mixins::BindShell] or
[Mixins::ReverseShell][Ronin::Payloads::Mixins::ReverseShell] modules define
their own `prelaunch` and `postlaunch` logic to connect to the remote shell.

<table>
  <thead>
    <tr>
      <td width="50%">Metasploit</td>
      <td width="50%">Ronin</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>def generate(opts = {})
  # ...
end</pre>
      </td>
      <td>
        <pre>def build
  @payload = "..."
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def initialize(info = {})
  super(merge_info(info,
    # ...
    'Payload'       =>
      {
        'Payload' => "..."
      }
  ))
end</pre>
      </td>
      <td>
        <pre>def build
  @payload = "..."
end</pre>
      </td>
    </tr>
  </tbody>
</table>

## Printing

### Metasploit

Metasploit provides a set of methods for printing status messages from an
exploit:

```ruby
    print_status "Running the Javascript shell..."
    # ...

    print_warning("Unable to retrieve token")
    # ...

    print_error('Connection failed.')
    # ...
```

### Ronin

Ronin also provides a similar set of methods for printing status messages
from a payloads:

* [print_debug](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_debug-instance_method)
* [print_error](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_error-instance_method)
* [print_info](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_info-instance_method) /`print_status`
* [print_negative](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_negative-instance_method) / `print_failure` / `print_bad`
* [print_positive](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_positive-instance_method) / `print_success` / `print_good`
* [print_warning](/docs/ronin-support/Ronin/Support/CLI/Printing.html#print_warning-instance_method)

```ruby
    print_status "Sending request to /path ..."
    response = http_get('/path')

    if response.code == '200'
      if response.body.include?('Success')
        print_success "response indicates success! Proceeding ..."
      else
        print_failure "request failed! Trying again ..."
        print_debug response.body
      end
    else
      print_error "Did not receive a 200 response: #{response.code}"
    end
```

### Cheat Sheet

<table>
  <thead>
    <tr>
      <td width="50%">Metasploit</td>
      <td width="50%">Ronin</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <code>print_status("Message here")</code><br/>
        <code>vprint_status("Message here")</code>
      </td>
      <td>
        <code>print_info "Message here"</code> /<br/>
        <code>print_status "Message here"</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>print_good("Message here")</code><br/>
        <code>vprint_good("Message here")</code>
      </td>
      <td>
        <code>print_good "Message here"</code> /<br/>
        <code>print_success "Message here"</code> /<br/>
        <code>print_positive "Message here"</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>print_bad("Message here")</code><br/>
        <code>vprint_bad("Message here")</code>
      </td>
      <td>
        <code>print_bad "Message here"</code> /<br/>
        <code>print_failure "Message here"</code> /<br/>
        <code>print_negative "Message here"</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>print_warning("Message here")</code><br/>
        <code>vprint_warning("Message here")</code>
      </td>
      <td>
        <code>print_warning "Message here"</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>print_error("Message here")</code><br/>
        <code>print_bad("Message here")</code><br/>
        <code>vprint_error("Message here")</code><br/>
        <code>vprint_bad("Message here")</code>
      </td>
      <td>
        <code>print_error "Message here"</code>
      </td>
    </tr>
  </tbody>
</table>

## Packing

### Metasploit

Metasploit payloads use Ruby's built-in [Array#pack] method, which packs the
contents of an Array using a binary format String:

[Array#pack]: https://apidock.com/ruby/Array/pack

```ruby
    pop_r3_ret = [0x00013cd0].pack('V')
```

### Ronin

Ronin adds a it's own `pack` method to [Array][ronin-support Array#pack],
[Integer][ronin-support Integer#pack], and [Float][ronin-support Float#pack]
 which can also accept a binary type Symbol name instead of a pack String:

[ronin-support Array#pack]: /docs/ronin-support/Array.html#pack-instance_method
[ronin-support Integer#pack]: /docs/ronin-support/Integer.html#pack-instance_method
[ronin-support Float#pack]: /docs/ronin-support/Float.html#pack-instance_method

```ruby
    pop_r3_ret = 0x00013cd0.pack(:uint32_le)
```

If the [Ronin payload][Ronin::Payloads::Payload] includes
[Mixins::Binary][Ronin::Payloads::Mixins::Binary], then a
[pack][Ronin::Payloads::Mixins::Binary#pack] method will be added, which packs
a single value based on the payload's defined [arch] and [os].

[Ronin::Payloads::Mixins::Binary]: /docs/ronin-payloads/Ronin/Payloads/Mixins/Binary.html
[Ronin::Payloads::Mixins::Binary#pack]: /docs/ronin-payloads/Ronin/Payloads/Mixins/Binary.html#pack-instance_method

```ruby
require 'ronin/payloads/payload'
require 'ronin/payloads/metadata/arch'
require 'ronin/payloads/metadata/os'
require 'ronin/payloads/mixins/binary'

module Ronin
  module Payloads
    class MyPayload < Payload

      include Metadata::Arch
      include Metadata::OS
      include Mixins::Binary

      arch :x86_64
      os :linux

      def build
        # ...

        @payload = "..."
        @payload << pack(:uint32, 0x12345678)

        # ...
      end

    end
  end
end
```

### Cheat Sheet

Metasploit                          | Ronin
------------------------------------|------------------------------------------
`[i].pack('C')`                     | `i.pack(:uchar)`
`[i].pack('S')`                     | `i.pack(:uint16)`
`[i].pack('L')`                     | `i.pack(:uint32)`
`[i].pack('Q')`                     | `i.pack(:uint64)`
`[i].pack('c')`                     | `i.pack(:char)`
`[i].pack('s')`                     | `i.pack(:int16)`
`[i].pack('l')`                     | `i.pack(:int32)`
`[i].pack('q')`                     | `i.pack(:int64)`
`[i].pack('S<')`                    | `i.pack(:uint16_le)`
`[i].pack('L<')`                    | `i.pack(:uint32_le)`
`[i].pack('Q<')`                    | `i.pack(:uint64_le)`
`[i].pack('s<')`                    | `i.pack(:int16_le)`
`[i].pack('l<')`                    | `i.pack(:int32_le)`
`[i].pack('q<')`                    | `i.pack(:int64_le)`
`[i].pack('S>')`                    | `i.pack(:uint16_be)`
`[i].pack('L>')`                    | `i.pack(:uint32_be)`
`[i].pack('Q>')`                    | `i.pack(:uint64_be)`
`[i].pack('s>')`                    | `i.pack(:int16_be)`
`[i].pack('l>')`                    | `i.pack(:int32_be)`
`[i].pack('q>')`                    | `i.pack(:int64_be)`
`[f].pack('F')` / `[f].pack('f')`   | `f.pack(:float)` / `f.pack(:float32)`
`[f].pack('D')` / `[f].pack('d')`   | `f.pack(:double)` / `f.pack(:float64)`
`[f].pack('e')`                     | `f.pack(:float_le)` / `f.pack(:float32_le)`
`[f].pack('E')`                     | `f.pack(:double_le)` / `f.pack(:float64_le)`
`[f].pack('g')`                     | `f.pack(:float_be)` / `f.pack(:float32_be)`
`[f].pack('G')`                     | `f.pack(:double_be)` / `f.pack(:float64_be)`
`[i].pack('n')`                     | `i.pack(:uint16_le)`
`[i].pack('N')`                     | `i.pack(:uint32_le)`
`[i].pack('v')`                     | `i.pack(:uint16_be)`
`[i].pack('V')`                     | `i.pack(:uint32_be)`
`[...].pack('VVV')`                 | `[...].pack([:uint32_le, 3])`
`[...].pack('V*')`                  | `[...].pack(:uint32_le..)`
`[...].pack('VS<C')`                | `[...].pack(:uint32_le, :uint16_le, :uchar)`

[ronin-payloads]: /docs/ronin-payloads/
[Ronin::Payloads::Payload]: /docs/ronin-payloads/Ronin/Payloads/Payload.html
