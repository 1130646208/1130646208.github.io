# Cube管理

## 查询Cube列表

### Request
**Url** 

[POST] /cube/list

**Headers**

- Content-Type: application/json

**Parameters**

| 名称 | 类型 | 是否必须 | 备注 |
| ------ | ------ | ------  | ------ |
| name | String | 否 | Cube名字 |  
| startTime | Instant | 否 | 筛选起始时间 |  
| endTime | Instant | 否 | 筛选结束时间 |  

### Response

**Desc**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| code | Integer | status code | 
| message | String |  status code explanation | 
| data | PageResult< CubeVO >  |  查询结果数据 | 

**PageResult< CubeVO >**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| content | List< CubeVO >  |  查询结果集合| 
| page| Integer |  当前所在页（页数=page+1）| 
| size| Integer |  当前所在页展示数据条数| 
| total| Long | 查询到数据总条数 | 

**CubeVO**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | Long |  查询到的Cube对象id| 
| name | String |  查询到的Cube对象name|
| remark | String |  查询到的Cube对象描述|
| createTime | Instant |  查询到的Cube对象数创建时间|
| updateTime | Instant |  查询到的Cube对象数修改时间|

**Examples**

```bash
curl -X POST https://0.0.0.0/cubr/list
-H 'Content-Type: application/json' \
-d '
    {
        "name": "wiki",
        "startTime":null,
        "endTime": null
    }
'
```

**Expected Response**

```json
{ 
     "code": 200,
    "message": "OK",
    "data": {
        "content": [
            {
                "id": 2,
                "name": "wiki",
                "description": null,
                "createTime": "2021-08-02T11:31:00.202739Z",
                "updateTime": "2021-08-02T11:31:00Z"
            },
            {
                "id": 3,
                "name": "wiki",
                "description": "gvolap test",
                "createTime": "2021-08-02T11:23:05.861772Z",
                "updateTime": "2021-08-02T11:23:06Z"
            },
            {
                "id": 1,
                "name": "wiki",
                "description": "a test",
                "createTime": "2021-08-02T08:48:47.635661Z",
                "updateTime": "2021-08-02T08:48:48Z"
            }
        ],
        "page": 0,
        "size": 10,
        "total": 3
    }
}

{
  "code": 500,
  "message": "Server Error"
}
```


## 添加Cube

### Request

**Url** 

[POST] /cube/add

**Headers**

- Content-Type: application/json

**Parameters**

| 名称 | 类型 | 是否必须 | 备注 | 
| ------ | ------ | ------ | ------ | 
| id | Long | 否 | 新增Cube的id | 
| userId | Long | 否 | 用户id |
| name | String | 是 | 新增Cube的名称 |  
| description | String | 是 | Cube的描述 |  

### Response

**Desc**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| code | Integer | status code | 
| message | String |  status code explanation | 
| data | CubeVO |  新增Cube对象数据 | 

**CubeVO**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | Long |  新增Cube对象id| 
| name | String |  新增Cube对象name|
| description | String |  新增Cube对象描述|
| createTime | Instant |  新增Cube对象数创建时间|
| updateTime | Instant |  新增Cube对象数修改时间|

**Examples**

```bash
curl -X POST https://0.0.0.0/cubr/add
-H 'Content-Type: application/json' \
-d '
    {
        "id": null,
        "userId":null,
        "name":"wiki",
        "description":"a test"
    }
'
```

**Expected Response**

```json
{
    "code": 200,
    "message": "OK",
    "data": {
        "id": 1,
        "name": "wiki",
        "description": "a test",
        "createTime": "2021-07-30T09:50:15.468582Z",
        "updateTime": "2021-07-30T09:50:15.468584Z"
    }
}

{
  "code": 500,
  "message": "Server Error"
}
```


## 更新Cube

### Request

**Url** 

[POST] /cube/update

**Headers**

- Content-Type: application/json

**Parameters**

| 名称 | 类型 | 是否必须 | 备注 | 
| ------ | ------ | ------ | ------ |
| id | Long | 是  | 更新Cube的id 
| userId | Long | 是  | 用户id |  
| name | String | 是  | 更新Cube的名称 |  
| description | String   |是  | Cube的描述 |  

### Response

**Desc**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| code | Integer | status code | 
| message | String |  status code explanation | 
| data | CubeVO |  Cube对象更新后数据 | 

**CubeVO**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| id | Long | Cube对象id| 
| name | String |  更新Cube对象更新后name|
| description | String |  Cube对象更新后描述|
| createTime | Instant |  Cube对象数创建时间|
| updateTime | Instant |  Cube对象数修改时间|

**Examples**

```bash
curl -X POST https://0.0.0.0/cubr/update
-H 'Content-Type: application/json' \
-d '
    {
        "id": 1,
        "userId": null,
        "name":"wiki",
        "description":"update test"
    }
'
```

**Expected Response**

```json
{
    "code": 200,
    "message": "OK",
    "data": {
        "id": 1,
        "name": "wiki",
        "description": "update test",
        "createTime": "2021-08-01T12:06:47.017014Z",
        "updateTime": "2021-08-01T12:06:47.017035Z"
    }
}

{
  "code": 500,
  "message": "Server Error"
}
```


## 删除Cube

### Request

**Url** 

[POST] /cube/delete

**Headers**

- Content-Type: application/json

**Parameters**

| 名称 | 类型 | 是否必须 | 备注 | 
| ------ | ------ | ------ | ------ |
| ids | List<Long> | 是  | 需要删除的Cube的id集合 |  


请求参数示例
```json
{

    "ids": [1]

}
```


### Response

**Desc**

| 名称 | 类型 | 说明 |
| ------ | ------ | ------ |
| code | Integer | status code | 
| message | String |  status code explanation | 

**Examples**

```bash
curl -X POST https://0.0.0.0/cubr/delete
-H 'Content-Type: application/json' \
-d '
    {
        "ids": [4，5]
    }
'
```

**Expected Response**

```json
{
    "code": 200,
    "message": "OK"
}

{
  "code": 500,
  "message": "Server Error"
}
```
