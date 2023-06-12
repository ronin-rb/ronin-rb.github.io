---
layout: page
title: Using the Ronin CLI - Binary
---

# Using the Ronin CLI - Binary

## Table of Contents

* [hexdump](#hexdump)
* [unhexdump](#unhexdump)
* [strings](#strings)
* [bitflip](#bitflip)

## hexdump

The `ronin hexdump` command can hexdump data in a variety of formats:

```
$ ronin hexdump /bin/ls
00000000  7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00  |.ELF............|
00000010  03 00 3e 00 01 00 00 00 30 6d 00 00 00 00 00 00  |..>.....0m......|
00000020  40 00 00 00 00 00 00 00 58 22 02 00 00 00 00 00  |@.......X"......|
00000030  00 00 00 00 40 00 38 00 0d 00 40 00 20 00 1f 00  |....@.8...@. ...|
00000040  06 00 00 00 04 00 00 00 40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  |@.......@.......|
...
```

```
$ ronin hexdump --type uint32_le /bin/ls
00000000  464c457f 00010102 00000000 00000000  |.ELF............|
00000010  003e0003 00000001 00006d30 00000000  |..>.....0m......|
00000020  00000040 00000000 00022258 00000000  |@.......X"......|
00000030  00000000 00380040 0040000d 001f0020  |....@.8...@. ...|
00000040  00000006 00000004 00000040 00000000  |........@.......|
00000050  00000040 00000000 00000040 00000000  |@.......@.......|
...
```

```
$ ronin hexdump --group-columns 4 --columns 16 /bin/ls
00000000  7f 45 4c 46  02 01 01 00  00 00 00 00  00 00 00 00  |.ELF............|
00000010  03 00 3e 00  01 00 00 00  30 6d 00 00  00 00 00 00  |..>.....0m......|
00000020  40 00 00 00  00 00 00 00  58 22 02 00  00 00 00 00  |@.......X"......|
00000030  00 00 00 00  40 00 38 00  0d 00 40 00  20 00 1f 00  |....@.8...@. ...|
00000040  06 00 00 00  04 00 00 00  40 00 00 00  00 00 00 00  |........@.......|
00000050  40 00 00 00  00 00 00 00  40 00 00 00  00 00 00 00  |@.......@.......|
...
```

```
$ ronin hexdump --group-chars 4 /bin/ls
00000000  7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00  |.ELF|....|....|....|
00000010  03 00 3e 00 01 00 00 00 30 6d 00 00 00 00 00 00  |..>.|....|0m..|....|
00000020  40 00 00 00 00 00 00 00 58 22 02 00 00 00 00 00  |@...|....|X"..|....|
00000030  00 00 00 00 40 00 38 00 0d 00 40 00 20 00 1f 00  |....|@.8.|..@.| ...|
00000040  06 00 00 00 04 00 00 00 40 00 00 00 00 00 00 00  |....|....|@...|....|
00000050  40 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  |@...|....|@...|....|
...
```

## unhexdump

The `ronin unhexdump` command can also convert hexdumps from GNU hexdump or `od`
back into the raw data:

```shell
ronin unhexdump -o raw.bin hexdump.txt
```

## strings

The `ronin strings` command can be used to extract strings containing certain
character sets:

```
$ ronin strings /bin/ls
/lib64/ld-linux-x86-64.so.2
{"type":"rpm","name":"coreutils","version":"9.1-12.fc38","architecture":"x86_64","osCpe":"cpe:/o:fedoraproject:fedora:38"}
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
__libc_start_main
__cxa_finalize
__cxa_atexit
...
```

The `--alpha` options can be used to print strings only containing alphabetic
characters:

```shell
$ ronin strings --alpha /bin/ls
linux
type
name
coreutils
version
architecture
osCpe
...
```

The `--alpha-num` options can be used to print strings only containing
alpha-numeric characters:

```shell
$ ronin strings --alpha-num /bin/ls
lib64
linux
type
name
coreutils
version
fc38
...
```

The `--numeric` options can be used to print strings only containing numeric
characters:

```shell
$ ronin strings --numeric /bin/ls
1996
2022
18030
1000
1024
1024
1024
...
```

The `--hex` options can be used to print strings only containing hexadecimal
characters:

```shell
$ ronin strings --hex /bin/ls
fc38
eadd
fffffff
fffffff
fffA
1996
2022
...
```

The `--min-length` option can be used to set the minimum desired length of the
strings:

```shell
$ ronin strings --min-length 30 /bin/ls
{"type":"rpm","name":"coreutils","version":"9.1-12.fc38","architecture":"x86_64","osCpe":"cpe:/o:fedoraproject:fedora:38"}
https://wiki.xiph.org/MIME_Types_and_File_Extensions
https://wiki.xiph.org/MIME_Types_and_File_Extensions
--dereference-command-line-symlink-to-dir
https://www.gnu.org/software/coreutils/
<https://translationproject.org/team/>
https://gnu.org/licenses/gpl.html
abcdfghiklmnopqrstuvw:xABCDFGHI:LNQRST:UXZ1
dereference-command-line-symlink-to-dir
```

## bitflip

The `ronin bitflip` command can enumerate over every bit-flip of a given string.
The `--alpha` or `--alpha-num` options can be used to filter the bit-flipped
strings for strings that *only* contain alphabetic or alpha-numeric characters.
The `--append` option can also be used to append an additional string, after
bit-flipping.

```shell
$ ronin bitflip microsoft --alpha-num --append .com
licrosoft.com
oicrosoft.com
iicrosoft.com
eicrosoft.com
Microsoft.com
mhcrosoft.com
mkcrosoft.com
mmcrosoft.com
macrosoft.com
mycrosoft.com
...
```

<div class="level">
  <div class="level-left">
    <a class="button" href="index.html">
      &laquo; Using the Ronin CLI
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="cryptography.html">
      Cryptography &raquo;
    </a>
  </div>
</div>
