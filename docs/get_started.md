# Get Started

## API Environments

| Environment | Host |
| ----------- | -----|
| Sandbox     | ...  |
| Production  | ...  |

## API Security

### Request

All requests should include some specified headers:

| Header Name | Allow Values                         | Description |
| ----------- | ------------------------------------ | ------------|
| `Content-Type`| `application/json` | The data type of request data payload, except multipart requests. |


### Response

Response Structure

Genie API will give response in JSON format:

!!! Example
    ```json
    {
        "code":200,
        "data":'OK'
    }
    ```

