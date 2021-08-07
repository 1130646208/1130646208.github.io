# Dictionary

## Global

Global constants, enums will define here.

### Example

Example


## OLAP

### ColumnCategoryEnum

| Enum Name | Column Type | Description |
| --------- | ----------- | ----------- |
| `TIME` | `time` | use serach, mapping sql for WHERE |
| `DIMENSION` | `dimension` | use serach, mapping sql for WHERE |
| `ROW` | `row` | use serach, mapping sql for GROUP BY |
| `VALUE` | `value` | use serach, mapping sql for SUM |

### ColumnTypeEnum

| Enum Name | Column Data Type |
| --------- | ---------------- |
| `TIMESTAMP` | `timestamp` |
| `STRING`    | `string` |
| `LONG`      | `long` |
| `DOUBLE`    | `double` |

### DatasourceEnum

| Enum Name | Description |
| --------- | ---------------- |
| `ROLLUP_DATA("data")` | druid datadource name |

### OlapCodeEnum

| Enum Name | Description |
| --------- | ---------------- |
| `CUBE_NOT_FOUNT(400, "Cube not found")` | Cube不存在 |
| `UNSUPPORTED_DATA_OPERATION(410, "Unsupported data operation")` | 不支持的数据操作 |
| `REQUEST_PARAM_EXIST(420, "Requested parameter already exists: %s")` | 请求参数已存在 |


### DefaultCodeEnum

| Enum Name | Description |
| --------- | ---------------- |
| `SUCCESS(200, "OK")` | 请求成功 |
| `PARAMETER_ERROR(400, "Invalid parameters")` | 请求参数无效 |
| `EMPTY_PARAMETER_ERROR(410, "Parameter should not be empty: %s")` | 请求参数为空 |
| `NOT_FOUND(404, "Resource not found")` | 请求资源不存在 |
| `ERROR(500, "Application internal error")` | 服务器内部错误 |
