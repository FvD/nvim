# nvim
neovim configuration files

## Instalation nvim

You will need at least tree-sitter to start without issues 

```
sudo apt install nodejs
sudo apt install npm
npm install tree-sitter
```

## LSP

The [full list of languageservers](https://microsoft.github.io/language-server-protocol/implementors/servers/) has others that may not be here.

### R

```
install.packages(languageserver)
```

### SQL

```
go get github.com/lighttiger2505/sqls
```


### Julia

```
using Pkg
Pkg.add("LanguageServer")
```

### Docker
Note: this requires node>=14.x and will not work with just the apt install above.

```
npm install dockerfile-language-server-nodejs
```


### Python

```
pip install python-lsp-server
```
