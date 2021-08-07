# Get Started


## Request

All requests should include some specified headers:

| Header Name   | Allow Values       | Description                           |
| ------------- | -------------------| --------------------------------------|
| `Content-Type`| `application/json` | The data type of request data payload.|


## Response

Common Response in JSON format:

!!! Example
    ```json
    {
        "meta":{
            "code":200
        },
        "data":{
            "id":1,
            "name":"michael",
            "age":18
        }
    }
    ```


Exception Response in JSON format:

!!! Example
    ```json
        {
            "meta":{
                "code":500,
                "errorType":"Internal Error",
                "errorMessage":"Application internal error"
            }
        }
    ```

| Field       | Description     |
| ----------- | ----------------|
| `meta`| The response metadata. |
| `data`| The response data field (When no exception occurred). |


!!! note
    - When exceptions occur, `meta` field includes extra `errorType` and `errorMessage`.
    - `code` in `meta` represents http status code.
