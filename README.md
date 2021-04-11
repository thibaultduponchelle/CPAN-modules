# Acme::Embarrasing

# Titles
## T2
### T3
#### T4
##### T5
###### T6

# Alternate titles
T1
==
T2
--

# Usual styling
Some **BOLD** or alternate __BOLD__ text with some *italic* and alternate _italic_

Some ***BOLD ITALIC*** or alternate ___BOLD ITALIC___

# Quote
> There Is More Than One Way To Do It

> Top level
>> Nested

> Quote with styling
> - First
> - Second
>
> Some **BOLD** 

# Html embedded
Some <strong>BOLD</strong> text.

A
<br/>
Sentence
<br/>
<br/>
On
<br/>
<br/>
<br/>
Multiple
<br/>
<br/>
<br/>
<br/>
Lines

## Bullets (-)
- First
- Second
- Third

## Bullets (\*)
- Foo
- Bar
- Baz

## Bullets (+)
+ Foo
+ Bar
+ Baz

## Numbered list
1. First
2. Second
3. Third

1) First
2) Second
3) Third


## Code
Inlined `code` or inlined ``code with `backticks` inside``

### Perl
```perl
#!/usr/bin/env perl

use Acme::LOLCAT;
 
print translate("You too can speak like a lolcat!") ."\n";
```

### Indented with spaces
    #!/usr/bin/env perl

    use Acme::LOLCAT;
 
    print translate("You too can speak like a lolcat!") ."\n";

### Indented with tab
	#!/usr/bin/env perl

	use Acme::LOLCAT;
 
	print translate("You too can speak like a lolcat!") ."\n";

### Bash
```bash
#!/bin/bash

for i in `seq 1 10`
do
  echo -n "$i "
done
echo ""
```

### Yaml
```yml
name: check-syntax

on: [push]

jobs:
  perl:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Check syntax 
      run: for f in `find . -name "*.pm" -o -name "*.pl" -o -name "*.t"`; do perl -c $f; done
```

## Images
### PNG
![](https://raw.githubusercontent.com/thibaultduponchelle/Acme-Markdown-Embarrassing/master/tux.png)

### SVG
![](https://raw.githubusercontent.com/thibaultduponchelle/Acme-Markdown-Embarrassing/master/tux.svg)

## Rules
***

---

________________

## Links
[MetaCPAN](https://metacpan.org) or with title [MetaCPAN](https://metacpan.org "MetaCPAN")

<https://www.metacpan.org>

## Image with link
[![](https://raw.githubusercontent.com/thibaultduponchelle/Acme-Markdown-Embarrassing/master/tux.png)](https://linuxfr.org/)

## Escape 
\* 

\` 

\-

\+

\#

