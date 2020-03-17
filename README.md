# OPC-UA Mock Server

## Usage instructions

You need to have a folder with a single file on it that will contain the data you want to mock. Once the server
starts, it will read that file. Here is the structure of the file:
* The first line of the file define the name of the OPC-UA nodes
* The second line of the file define the data types of the OPC-UA nodes. The current supported data types are:
  * INT64
  * DATETIME

Here is an example:

```bash
NODE_NAME1,NODE_NAME2
INT64,INT64
1,2
1,3
2,2
1,2
```

Let's say you have this file at **~/opcuadata/mockdata.csv**. Here is how you start the server with it:

```bash
docker run --name opcua_mockserver --init --rm \
    -v ~/opcuadata:/app/data \
    -p 4840:4840 \
    intersystemsdc/opcua-mockserver:version-1.0
```