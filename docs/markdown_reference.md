# Markdown 漂亮格式

## Lists

### Unordered lists

!!! Example

```
- level 1
    * level 2
        + level 3

- level 1
    - level 2
        - level 3
```
!!! Result

- level 1
    * level 2
        + level 3

- level 1
    - level 2
        - level 3

### Ordered lists

!!! Example

```
1. level 1

    1. level 2.1

    2. level 2.2
        1. level 2.2.1
```
!!! Result

1. level 1

    1. level 2.1

    2. level 2.2
        1. level 2.2.1

### Tasklists

!!! Example
```
- [x] checked
- [ ] unchecked
    * [x] checked
    * [ ] unchecked
- [ ] unchecked
```

!!! Result

- [x] checked
- [ ] unchecked
    * [x] checked
    * [ ] unchecked
- [ ] unchecked

## Data tables

### Usage

!!! Example

```bash
| Method      | Description                          |
| ----------- | ------------------------------------ |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |

```

!!! Result

| Method      | Description                          |
| ----------- | ------------------------------------ |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |


### Column alignment

!!! left alignment

```bash
| Method      | Description                          |
| :---------- | :----------------------------------- |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |
```
!!! Result

| Method      | Description                          |
| :---------- | :----------------------------------- |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |

!!! center alignment

```bash
| Method      | Description                          |
| :---------: | :----------------------------------: |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |
```

!!! Result

| Method      | Description                          |
| :---------: | :----------------------------------: |
| `GET`       | :material-check:     Fetch resource  |
| `PUT`       | :material-check-all: Update resource |
| `DELETE`    | :material-close:     Delete resource |

---
## Code blocks


### Adding line numbers

!!! Example

````python
```python linenums="1"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
````

!!! Result

``` python linenums="1"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

### Highlighting specific lines

!!! Example

````python
``` python hl_lines="2 3"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
````

!!! Result

``` python hl_lines="2 3"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

## Admonitions

### Simple

!!! Example

```
!!! note "My Note (can be empty)"
    This is a note.
```
!!! Result

!!! note "My Note"
    This is a note.

#### Supported types

`note`

!!! note "My Note"
    This is a note.

`abstract`, `summary`, `tldr`

!!! abstract "My Note"
    This is a note.

`info`, `todo`

!!! info "My Note"
    This is a note.

`tip`, `hint`, `important`

!!! tip "My Note"
    This is a note.

`success`, `check`, `done`

!!! success "My Note"
    This is a note.

`question`, `help`, `faq`

!!! question "My Note"
    This is a note.

`warning`, `caution`, `attention`

!!! warning "My Note"
    This is a note.

`failure`, `fail`, `missing`

!!! failure "My Note"
    This is a note.

`danger`, `error`

!!! danger "My Note"
    This is a note.

`bug`

!!! bug "My Note"
    This is a note.

`example`

!!! example "My Note"
    This is a note.

`quote`, `cite`

!!! quote "My Note"
    This is a note.

### Embedded content

!!! Example

````
!!! note
    This is a note contains code block.

    ``` python
    def bubble_sort(items):
        for i in range(len(items)):
            for j in range(len(items) - 1 - i):
                if items[j] > items[j + 1]:
                    items[j], items[j + 1] = items[j + 1], items[j]
    ```
    This is a note.

````
!!! Result

!!! note
    This is a note contains code block.

    ``` python
    def bubble_sort(items):
        for i in range(len(items)):
            for j in range(len(items) - 1 - i):
                if items[j] > items[j + 1]:
                    items[j], items[j + 1] = items[j + 1], items[j]
    ```
    This is a note.

### Collapsible blocks

!!! Example

```
??? note
    This is a note.

```

!!! Result

??? note
    This is a note.

## Content tabs

### Grouping code blocks

!!! Example

````
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
````

!!! Result
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

## Formatting

### Highlighting text

!!! Example
```
- ==This was marked==
- ^^This was inserted^^
- ~~This was deleted~~
```

!!! Result

- ==This was marked==
- ^^This was inserted^^
- ~~This was deleted~~

### Sub- and superscripts

!!! Example

```
- H~2~0
- A^T^A
```
!!! Result

- H~2~0
- A^T^A


