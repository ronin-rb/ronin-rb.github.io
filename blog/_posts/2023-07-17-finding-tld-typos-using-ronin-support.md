---
layout: post
author: postmodern
title: Finding all TLD typos using Ruby and ronin-support
tags:
  - ronin-support
  - tld
  - typos
  - typo-squatting
---

You may have recently read a [news story][1] about how a typo in a US military
email address (`<mailbox>@<domain>.mil` -> `<mailbox>@<domain>.ml`) accidentally
caused sensitive military secrets to be sent to a similar Mali email address
for years; Mali is apparently a Russian ally.

What if I told you, you could use Ronin to find all of the one-character-missing
valid typos for all of the TLDs? The [ronin-support] library comes with a
[Ronin::Support::Network::TLD] module which can automatically download and parse
ICANN's TLD list. Using the TLD list we can generate typos for each TLD and
filter out the invalid typoed TLDs.

```ruby
require 'ronin/support/network/tld'

def omit_each_char(tld)
  return enum_for(__method__,tld) unless block_given?

  tld.length.times do |i|
    new_tld = tld.dup
    new_tld[i] = ''
    yield new_tld
  end
end

tlds = Ronin::Support::Network::TLD.list

typoed_tlds = tlds.to_h do |tld|
  [tld, omit_each_char(tld).select { |typoed_tld|
    tlds.include?(typoed_tld)
  }]
end

typoed_tlds.each do |tld,valid_typos|
  unless valid_typos.empty?
    puts "#{tld} -> #{valid_typos.join(', ')}"
  end
end
```

This gives us the following output:

```
aco -> co, ao, ac
ads -> as, ad
aeg -> eg, ag, ae
afl -> al, af
aig -> ag, ai
anz -> nz, az
aol -> al, ao
art -> at, ar
arte -> art
audio -> audi
autos -> auto
aws -> ws, as, aw
axa -> ax
bar -> ar, br, ba
bbc -> bb
bbt -> bt, bt, bb
bcg -> cg, bg
bcn -> cn, bn
best -> bet
bet -> et, bt, be
bid -> id, bd, bi
bing -> ing
bingo -> bing
bio -> io, bo, bi
biz -> bz, bi
bms -> ms, bs, bm
bmw -> mw, bw, bm
bom -> om, bm, bo
boo -> bo, bo
book -> boo
bot -> bt, bo
box -> bo
buy -> uy, by
bzh -> bh, bz
cab -> ca
cal -> al, cl, ca
call -> cal, cal
cam -> am, cm, ca
camp -> cam
car -> ar, cr, ca
cards -> cars
care -> car
careers -> career
cars -> crs, car
cat -> at, ca
cba -> ba, ca
cbn -> bn, cn
cbs -> bs
ceo -> co
cfa -> ca, cf
cfd -> cd, cf
channel -> chanel, chanel
chase -> case
chat -> cat
citic -> citi
com -> om, cm, co
coupons -> coupon
cpa -> pa, ca
crs -> rs, cr
cruises -> cruise
cyou -> you
dad -> ad
deals -> deal
dev -> de
dnp -> np
dog -> do
dot -> do
dtv -> tv
eat -> at, et
eco -> co, ec
edu -> eu
esq -> es
eus -> us, es, eu
fans -> fan
fit -> it, fi
fly -> ly
foo -> fo, fo
food -> foo
fox -> fo
frl -> fr
ftr -> tr, fr
fund -> fun
fyi -> fi
gal -> al, gl, ga
games -> game
gap -> gp, ga
gay -> gy, ga
gbiz -> biz
gdn -> gn, gd
gea -> ga, ge
gifts -> gift
gle -> ge, gl
gmo -> mo, gm
gmx -> mx, gm
goog -> goo
gop -> gp
got -> gt
hbo -> bo
hkt -> ht, hk
host -> hot
hot -> ht
ibm -> bm, im
ice -> ie
icu -> cu
ifm -> fm, im
inc -> nc, in
ing -> ng, in
ink -> in
int -> it, in
ist -> st, it, is
itv -> tv, it
jio -> io, jo
jmp -> mp, jp, jm
jot -> jo
joy -> jo
kfh -> kh
kia -> ki
kim -> im, km, ki
kpn -> pn, kn, kp
krd -> kr
kred -> red, krd
lat -> at, lt, la
law -> aw, la
lds -> ls
link -> ink
llc -> lc, lc
loans -> loan
lpl -> pl
ltd -> td, lt
ltda -> ltd
man -> mn, ma
map -> mp, ma
markets -> market
mba -> ba, ma
med -> md, me
men -> mn, me
menu -> men
mil -> il, ml
mint -> int, mit
mit -> it, mt
mlb -> lb, ml
mls -> ls, ms, ml
mma -> ma, ma, mm
mobi -> obi, moi
moe -> me, mo
moi -> mo
mom -> om, mm, mo
mov -> mv, mo
msd -> sd, md, ms
mtn -> tn, mn, mt
mtr -> tr, mr, mt
nab -> na
nba -> ba, na
nec -> ec, nc, ne
net -> et, ne
new -> ne
news -> new
next -> net
nfl -> nl, nf
ngo -> no, ng
nhk -> hk
now -> no
nra -> na, nr
nrw -> rw, nr
ntt -> tt
nyc -> nc
obi -> bi
one -> ne
ong -> ng
onl -> nl
ott -> tt
paris -> pars
parts -> pars
pay -> py, pa
pet -> et, pt, pe
phd -> ph
photos -> photo
pid -> id
pin -> in, pn
ping -> ing, pin
pink -> ink, pin
play -> pay
pnc -> nc, pn
pro -> ro, pr
prod -> pro
prof -> pro
pru -> ru, pr
pwc -> pw
read -> red
red -> re
reisen -> reise
ren -> re
rent -> ren
reviews -> review
ricoh -> rich
ril -> il
rio -> io, ro
run -> ru
rwe -> re, rw
sap -> sa
sarl -> srl
sas -> as, ss, sa
sbi -> bi, si, sb
sbs -> bs, ss, sb
sca -> ca, sa, sc
scb -> sb, sc
seat -> eat
sew -> se
sex -> sx, se
sexy -> sex
sfr -> fr, sr
show -> how
ski -> ki, si, sk
skin -> ski
sky -> ky, sy, sk
song -> ong
sony -> soy
soy -> sy, so
spa -> pa, sa
sport -> spot
srl -> sl, sr
stc -> tc, sc, st
swatch -> watch
tax -> ax
taxi -> tax
tci -> ci, tc
tdk -> dk, tk, td
tel -> tl
thd -> td, th
tjx -> tj
top -> to
trv -> tv, tr
tvs -> tv
ubank -> bank
ubs -> bs, us
uno -> no
ups -> ps, us
vet -> et, ve
vig -> vg, vi
vin -> in, vn, vi
vip -> vi
wien -> win
win -> in
wine -> win
wme -> me
works -> work
wtc -> tc
wtf -> tf, wf
xbox -> box
xin -> in
zone -> one
```

This is just one example of the many useful things one can do with Ronin and
it's libraries, only in a couple lines of Ruby. Enjoy.

**PS:** you may also be interested in the
[Ronin::Support::Network::PublicSuffix] and 
[Ronin::Support::Text::Typo] modules or the `ronin typosquat` command.

[1]: https://www.bbc.com/news/world-us-canada-66226873
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[Ronin::Support::Network::TLD]: /docs/ronin-support/Ronin/Support/Network/TLD.html
[Ronin::Support::Network::PublicSuffix]: /docs/ronin-support/Ronin/Support/Network/PublicSuffix.html
[Ronin::Support::Text::Typo]: /docs/ronin-support/Ronin/Support/Text/Typo.html
