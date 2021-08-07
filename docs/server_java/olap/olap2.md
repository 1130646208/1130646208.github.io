# OLAP二期接口文档



## 核心查询逻辑

### 1. 查询维度下可选值

#### Request
**Url** 

[POST] /search/dimension/value

**Headers**

- Content-Type: application/json

**Parameters**

| 名称      | 类型    | 是否必须 | 默认值 | 说明    |
| --------- | ------- | -------- | ------ | ------------ |
| cubeId    | Long    | 是       |        | Cube Id     |
| dimension | String  | 是       |        | 维度列名 |

#### Response

**Desc**

| 名称      | 类型    |  说明    |
| --------- | -------  | ------------ |
| code    | Int    | status code     |
| message    | String    | status code explanation     |
| data | DimensionValueVO | 维度列可选值列表 |

**DimensionValueVO**

| 名称      | 类型    |  说明    |
| --------- | -------  | ------------ |
| values|List String    | 维度列可选值列表     |

**Examples**

```bash
curl -X POST https://0.0.0.0/search/dimension/value
-H 'Content-Type: application/json' \
-d '
    {
        cubeId: 1,
        dimension: "country"
    }
'
```

**Expected Response**

**success:** 
```json
{
    "code":200,
    "message":"ok",
    "data":{
        "values":[
            "China",
            "Japan",
            "UK"
        ]
    }
}
```
**failed**
```json
{
  "code": 500,
  "message": "Server Error",
  "data": null
}
```


### 2. 可操作列

#### Request

**Url** 

[POST] /search/column

**Headers**

- Content-Type: application/json

**Parameters**

| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| cubeId     | Long   | 是       |        | Cube Id            |
| columnType | String | 否       | ROW    | 列类型: ROW, VALUE |
| columnName | String | 否       |        | 列名               |

#### Response

**Desc**

| 名称    | 类型     | 说明                    |
| ------- | -------- | ----------------------- |
| code    | Int      | status code             |
| message | String   | status code explanation |
| data    | ColumnVO | 维度列可选值列表        |

**ColumnVO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| dimensions | List ColumnShowVO | 维度列 |
| values     | List ColumnShowVO | 数值列 |

**ColumnShowVO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| disable | Boolean | 是否置灰(默认否) |
| column     | String | 列名 |

**Examples**

```bash
curl -X POST https://0.0.0.0/search/column
-H 'Content-Type: application/json' \
-d '
    {
        cubeId: 1,
        columnType: "ROW",
        columnName: "country"
    }
'
```

**Expected Response**

```json
{
    "code":200,
    "message":"ok",
    "data":{
        "dimensions":[
            {
                "column":"country",
                "disable":false
            },
            {
                "column":"channel",
                "disable":true
            }
        ],
        "values":[
            {
                "column":"added",
                "disable":false
            },
            {
                "column":"packets",
                "disable":true
            }
        ]
    }
}
```


### 3. 核心查询

#### Request

**Url** 

[POST] /search

**Headers**

- Content-Type: application/json

**Parameters**

| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| cubeId     | Long   | 是       |        | Cube Id            |
| time | TimeFilterDTO | 是       |     | 时间列必传 |
| filters | List DimensionDTO | 是       |        | 维度: WHERE     |
| rows | List String | 否       |        | 维度：GROUP BY |
| values | List String | 否       |        | 数值：一般是SUM      |

**TimeFilterDTO**

| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| startTime     | Instant   | 是       |        | 开始时间(UTC)           |
| endTime | Instant | 是      |     | 结束时间(UTC) |

**DimensionDTO** 

| 名称        | 类型         | 是否必须 | 默认值 | 说明               |
| ---------- | ----------- | ------- | ------ | ---------------- |
| dimension  | String      | 是       |        | 维度列            |
| values    | List String | 否      |         | 选择的值           |


#### Response

**Desc**

| 名称    | 类型     | 说明                    |
| ------- | -------- | ----------------------- |
| code    | Int      | status code             |
| message | String   | status code explanation |
| data    | List SearchVO | 结果集        |

**SearchVO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| type | String | 列名 |
| name     | String | 列名的值 |
| value | Long | 对应的数值 |
| data     | List SearchVO | 树状图 |

**Examples**

```bash
curl -X POST https://0.0.0.0/search
-H 'Content-Type: application/json' \
-d '
    {
    "cubeId":1,
    "time":{
        "startTime":"2020-08-03T01:35:57.206775Z",
        "endTime":"2021-08-03T01:35:57.206909Z"
    },
    "filters":[
        {
            "dimension":"country",
            "values":[
                "Australia",
                "China"
            ]
        },
        {
            "dimension":"city",
            "values":[
                "Adelaide",
                "Auburn",
                "Beijing"
            ]
        }
    ],
    "rows":[
        "country",
        "city"
    ],
    "values":[
        "added"
    ]
}
'
```

**Expected Response**
```json
{
    "code":200,
    "message":"ok",
    "data":[
        {
            "rowName":"country",
            "rowValue":"Australia",
            "valueName":"added",
            "value":103,
            "data":[
                {
                    "rowName":"city",
                    "rowValue":"Adelaide",
                    "valueName":"added",
                    "value":102,
                    "data":null
                },
                {
                    "rowName":"city",
                    "rowValue":"Auburn",
                    "valueName":"added",
                    "value":1,
                    "data":null
                }
            ]
        },
        {
            "rowName":"country",
            "rowValue":"China",
            "valueName":"added",
            "value":447,
            "data":[
                {
                    "rowName":"city",
                    "rowValue":"Beijing",
                    "valueName":"added",
                    "value":447,
                    "data":null
                }
            ]
        }
    ]
}
```