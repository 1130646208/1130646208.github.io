# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
- [x] Lorem ipsum dolor sit amet, consectetur adipiscing elit
- [ ] Vestibulum convallis sit amet nisi a tincidunt
    * [x] In hac habitasse platea dictumst
    * [x] In scelerisque nibh non dolor mollis congue sed et metus
    * [ ] Praesent sed risus massa
- [ ] Aenean pretium efficitur erat, donec pharetra, ligula non scelerisque

- ==This was marked==
- ^^This was inserted^^
- ~~This was deleted~~


=== "C"

    ``` c
    #include <stdio.h>

    int main(void) {
      printf("Hello world!\n");
      return 0;
    }
    ```

=== "C++"

    ``` c++
    #include <iostream>

    int main(void) {
      std::cout << "Hello world!" << std::endl;
      return 0;
    }
    ```

# 优势与劣势

## 优势:
- 轻量级
- 部署简单
- 插件扩展简单
- 发布文章简单

## 劣势
- 只能编辑markdown,再由服务器渲染.高级功能需要学习成本(不高).
- 对协作支持不好(多人修改一份文档,保存即生效.文档位置由配置文件指定.)
- 对大型项目支持不好
    - 目录结构需要修改yaml配置文件,保存即生效.如果不小心语法错误保存,服务器即挂.不过重启也很迅速.
    - 目录结构如果越来越复杂,配置文件会越来越长,不知道yaml支不支持配置文件中链接到另一个文件?
