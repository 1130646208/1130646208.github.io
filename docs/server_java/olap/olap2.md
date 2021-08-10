# 核心查询逻辑

**Base Object**

**TimeFilterDTO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| startTime | Instant | 开始时间(UTC) |
| endTime     | Instant | 结束时间(UTC) |

## 1. 查询维度下可选值

### Request
**Url** 

[POST] /search/dimension/value

**Headers**

- Content-Type: application/json

**Parameters**

| 名称      | 类型    | 是否必须 | 默认值 | 说明    |
| --------- | ------- | -------- | ------ | ------------ |
| cubeId    | Long    | 是       |        | Cube Id     |
| dimension | String  | 是       |        | 维度列名 |
| dimensionFilters | List DimensionFilterDTO  | 否       |        | 已选列及选值 |
| timeFilter | TimeFilterDTO  | 是       |        | 时间范围 |

**DimensionFilterDTO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| dimension | String | 列名 |
| values     | List String | 选值 |

### Response

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
        "cubeId": 1,
        "dimension": "channel",
        "dimensionFilters": [
            {
            "dimension": "srcIP",
            "values":["1.1.1.1","8.8.8.8"]
            }
        ],
        "timeFilter": {
            "startTime": "2000-12-31T17:01:35Z",
            "endTime": "2021-12-31T17:01:35Z"
        }
        
    }
'
```

**Expected Response**

**success:** 
```json
{
    "code": 200,
    "message": "OK",
    "data": {
        "values": [
            "#en.wikipedia"
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


## 2. 可操作列

### Request

**Url** 

[POST] /search/column

**Headers**

- Content-Type: application/json

**Parameters**

| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| cubeId     | Long   | 是       |        | Cube Id            |
| columns | List ColumnShowValueDTO | 否       | ROW    | 列类型: ROW, VALUE |

**ColumnShowValueDTO**
| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| columnCategory | String | 否       | ROW    | 列类型: ROW, VALUE |
| columnName | String | 否       |        | 列名               |



### Response

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
        "cubeId":1,
        "columns":[
            {
                "columnCategory":"ROW",
                "columnName":"country"
            }
        ]
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


## 3. 核心查询

### Request

**Url** 

[POST] /search

**Headers**

- Content-Type: application/json

**Parameters**

| 名称       | 类型   | 是否必须 | 默认值 | 说明               |
| ---------- | ------ | -------- | ------ | ------------------ |
| cubeId     | Long   | 是       |        | Cube Id            |
| timeFilter | TimeFilterDTO | 是       |     | 时间列必传 |
| dimensionFilters | List DimensionDTO | 是       |        | 维度: WHERE     |
| rows | List String | 否       |        | 维度：GROUP BY |
| values | List String | 否       |        | 数值：一般是SUM      |

**DimensionDTO** 

| 名称        | 类型         | 是否必须 | 默认值 | 说明               |
| ---------- | ----------- | ------- | ------ | ---------------- |
| dimension  | String      | 是       |        | 维度列            |
| values    | List String | 否      |         | 选择的值           |


### Response

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
| values | List QueryValueVO | 对应的数值 |
| data     | List SearchVO | 树状图 |

**QueryValueVO**

| 名称       | 类型               | 说明   |
| ---------- | ------------------ | ------ |
| name | String | 列名 |
| value     | String | 列名的值 |

**Examples**

```bash
curl -X POST https://0.0.0.0/search
-H 'Content-Type: application/json' \
-d '
    {
    "cubeId":1,
    "timeFilter":{
        "startTime":"2020-08-03T01:35:57.206775Z",
        "endTime":"2021-08-03T01:35:57.206909Z"
    },
    "dimensionFilters":[
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
    "message":"OK",
    "data":[
        {
            "rowName":"channel",
            "rowValue":"#en.wikipedia",
            "values":[
                {
                    "name":"bytes",
                    "value":412401
                }
            ],
            "data":[
                {
                    "rowName":"srcIP",
                    "rowValue":"1.1.1.1",
                    "values":[
                        {
                            "name":"bytes",
                            "value":412401
                        }
                    ],
                    "data":[
                        {
                            "rowName":"dstIP",
                            "rowValue":"2.2.2.2",
                            "values":[
                                {
                                    "name":"bytes",
                                    "value":412401
                                }
                            ],
                            "data":null
                        }
                    ]
                }
            ]
        }
    ]
}
```