# KIU Typst templates

Current templates:

- homework
- PSA
- I2CN

# Installation

Want to install a package locally on your system without publishing it or
experiment with it before publishing? 
You can clone this repository:
```
git clone https://github.com/kiu-ninja/typst-templates.git {data-dir}/typst/packages/tcum/
```
Here, `{data-dir}` is

- `$XDG_DATA_HOME` or `~/.local/share` on Linux
- `~/Library/Application Support` on macOS
- `%APPDATA%` on Windows

Packages in the data directory have precedence over ones in the cache directory.

- Import from it with `#import "@tcum/hw:0.1.1": *`

Note that future iterations of Typst's package management may change/break this
local setup.
