
[![Travis CI Build Status](https://travis-ci.org/evandrojr/awesome_print.cr.svg)](https://travis-ci.org/evandrojr/awesome_print.cr)

# awesome_print

It dreams about becoming [awesome_print](https://github.com/awesome-print/awesome_print) for crystal-lang.

```
ap some_var
```

It supports Int32, String, Char, Array, Range, Symbol and Hash.

Formated array example:

```
ap [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]

(output)

[100, 101, 102, 103, 104, 105, 106, 
 107, 108, 109, 110, 111, 112, 113, 
 114, 115]
```

2018-05-10: Added colors for some data types and support for Symbol

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  awesome_print:
    github: evandrojr/awesome_print.cr
```

## Usage

```crystal
require "awesome_print"
```

To check the content of a variable use:
```
ap some_var
```


## Contributing

1. Fork it ( https://github.com/evandrojr/awesome_print.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [evandrojr](https://github.com/evandrojr) Evandro Junior - creator, maintainer
