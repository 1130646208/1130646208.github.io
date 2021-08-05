# 本地安装方法
---
## 1 安装mkdocs环境
```bash
pip3 install mkdocs mkdocs-material
```

---
## 2 初始化项目

```bash
mkdocs new your-project-name
```

运行之后会在本地生成一个目录


```bash
.
├── docs            # md源文件
│   └── index.md    
└── mkdocs.yml      # 配置文件
```

---
## 3 运行项目

```bash
mkdocs serve
```
在localhost:8000即可访问

---
## 4 配置文件结构

如果在配置文件中指定以下结构

```
site_name: 站点名称
nav:
  - 首页: index.md
  - OLAP:
      - stage1: olap/stage/1/xxx1.md
      - stage2: olap/stage/2/xxx.md

...
```

则对应your-project-name下的目录结构为:

```bash
.
├── docs
│   ├── index.md
│   └── olap/
│       └── stage/
│           ├── 1/  # 目录下放xxx1.md
│           └── 2/  # 目录下放xxx2.md
└── mkdocs.yml
```

保存配置文件即可生效.

---
## 5 静态页面生成

### 5.1 发布到github pages

在github repo根目录运行以下命令

```mkdocs gh-deploy```

即可生成静态页面到gh-pages分支,在repo的settings中定向到gh-pages即可通过公网访问

https://1130646208.github.io/

### 5.2 gitlab也有gitlab pages的服务


### 5.3 发布到个人服务器

运行命令

```bash

mkdocs build

```
即可构建静态页面,通过nginx访问

```bash
.
└── site
    ├── 404.html
    ├── css
    │   ├── base.css
    │   ├── bootstrap.min.css
    │   └── font-awesome.min.css
    ├── fonts
    │   ├── fontawesome-webfont.eot
    │   ├── fontawesome-webfont.svg
    │   ├── fontawesome-webfont.ttf
    │   ├── fontawesome-webfont.woff
    │   └── fontawesome-webfont.woff2
    ├── img
    │   ├── favicon.ico
    │   └── grid.png
    ├── index.html
    ├── js
    │   ├── base.js
    │   ├── bootstrap.min.js
    │   └── jquery-1.10.2.min.js
    ├── search
    │   ├── lunr.js
    │   ├── main.js
    │   ├── search_index.json
    │   └── worker.js
    ├── sitemap.xml
    └── sitemap.xml.gz

```